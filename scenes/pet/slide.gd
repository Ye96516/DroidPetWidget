##这是滑动状态
extends StateBase

var dir:Vector2i
func enter() -> void:
	super.enter()

	timer.wait_time=3.12
	timer.start()
	an_player.play("slide")
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
	
