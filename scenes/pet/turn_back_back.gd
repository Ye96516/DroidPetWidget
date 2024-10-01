##这是回头又转回来的状态
extends StateBase

func enter() -> void:
	super.enter()
	timer.wait_time=1.75
	timer.start()
	an_player.play("turn_back_back")
	pass


func exit() -> void:
	super.exit()
	pass


func process_update(delta: float) -> void:
	super.process_update(delta)
	pass


func physical_process_update(delta: float) -> void:
	super.physical_process_update(delta)

		
	pass
