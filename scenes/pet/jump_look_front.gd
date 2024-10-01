##这是回头跳又转过来的状态
extends StateBase

var dir:Vector2i
func enter() -> void:
	super.enter()
	timer.wait_time=1.375
	timer.start()
	an_player.play("jump_look_front")
	pass


func exit() -> void:
	super.exit()
	pass


func process_update(delta: float) -> void:
	super.process_update(delta)
	pass


func physical_process_update(delta: float) -> void:
	super.physical_process_update(delta)
	move()
	pass

func move() -> void:
	var point_to_mouse:Vector2=Vector2( (Vector2i(pet.get_global_mouse_position())+get_window().position) - (get_window().position+Vector2i(pet.position)) )
	dir=Vector2i( point_to_mouse.normalized()*5)

	if dir.x > 0:
		an_sprite.flip_h = false
	else:
		an_sprite.flip_h = true
		
	if abs(point_to_mouse.x)>5 && abs(point_to_mouse.y)>5:
		get_window().position += dir
