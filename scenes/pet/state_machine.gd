class_name StateMachine extends Node

@export var current_state: StateBase
var last_number:int=0

func _ready() -> void:
	for child in get_children():
		if child is StateBase:
			child.state_machine = self
	await get_parent().ready
	current_state.enter()

func _process(delta: float) -> void:
	current_state.process_update(delta)

func _physics_process(delta: float) -> void:
	current_state.physical_process_update(delta)

## 修改状态
func change_state(target_state_name: String) -> void:
	var target_state = get_node(target_state_name)
	if target_state == null:
		printerr("状态传入错误")
		return
	current_state.exit()
	current_state = target_state
	current_state.enter()


func _on_timer_timeout() -> void:
	if Global.can_random_state:
		#print("上一个状态是:",get_child(last_number).name)
		randomize()
		var rand_child_number:int=randi_range(0,6)
		while last_number==rand_child_number:
			randomize()
			rand_child_number=randi_range(0,6)

		var rand_child_name=get_child(rand_child_number).name
		change_state(rand_child_name)
		last_number=rand_child_number


