##这是回头状态(仔细看是奔跑，我也服了这个画师了)
extends StateBase

var dir:Vector2i

func enter() -> void:
	super.enter()
	dir= Vector2i(Vector2(randf_range(-1,1), randf_range(-1,1)).normalized() * 5)
	#print("初始移动方向为：",dir)
	timer.wait_time=3
	timer.start()
	an_player.play("turn_back")
	pass


func exit() -> void:
	super.exit()
	pass


func process_update(delta: float) -> void:
	super.process_update(delta)
	if Input.is_action_just_pressed("a"):
		Engine.time_scale=0
	pass


func physical_process_update(delta: float) -> void:
	super.physical_process_update(delta)
	move()
	pass

func move() -> void:
	if dir.x > 0:
		an_sprite.flip_h = false
	else:
		an_sprite.flip_h = true
	if (get_window().position.x+pet.position.x) < (DisplayServer.screen_get_size().x-80) && (get_window().position.x+pet.position.x) > 80:
		if (get_window().position.y+pet.position.y) < (DisplayServer.screen_get_size().y-80) && (get_window().position.y+pet.position.y) > 80:
			get_window().position += dir
			#print("正在移动，自身坐标为：",get_window().position+Vector2i(pet.position))
		else:
			dir=Vector2i(Vector2(DisplayServer.screen_get_size()/2-(get_window().position+Vector2i(pet.position))).normalized()*5)
			#print("to_screen_center",dir)
			get_window().position += dir
	else:
		dir=Vector2i(Vector2(DisplayServer.screen_get_size()/2-(get_window().position+Vector2i(pet.position))).normalized()*5)
		#print("to_screen_center",dir)
		get_window().position += dir
#
#
#
#func _on_timer_timeout() -> void:
	#dir= Vector2i(Vector2(randf_range(-1,1), randf_range(-1,1)).normalized() * 5)
	##print("当前移动方向为：",dir)
