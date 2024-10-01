##这是Idle状态
extends StateBase

func enter() -> void:
	super.enter()
	timer.wait_time=6.25
	timer.start()
	an_sprite.play("idle")
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
