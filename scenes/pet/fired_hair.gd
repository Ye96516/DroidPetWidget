##这是炸毛状态
extends StateBase

func enter() -> void:
	super.enter()
	#进入状态时停止随机进入状态
	Global.can_random_state=false
	timer.wait_time=0.625*3
	timer.start()
	an_player.play("fired_hair")
	an_sprite.material.set("shader_parameter/outline_color",Vector4(1,0.2,0,1))
	pass


func exit() -> void:
	super.exit()
	Global.can_random_state=true
	an_sprite.material.set("shader_parameter/outline_color",Vector4(0.2,0.2,0,1))
	pass


func process_update(delta: float) -> void:
	super.process_update(delta)
	if is_equal_approx(timer.time_left,0.0):
		state_machine.change_state("TurnBack")


func physical_process_update(delta: float) -> void:
	super.physical_process_update(delta)
	pass
