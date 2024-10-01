
extends CharacterBody2D

@onready var mouse_collison: CollisionShape2D = %MouseCollison
@onready var an_player: AnimationPlayer = %AnPlayer
@onready var an_sprite: AnimatedSprite2D = %AnSprite

@onready var state_machine: StateMachine = $StateMachine
@onready var unit_timer: Timer = %UnitTimer


var is_dragging:bool
var mouse_enter:bool
var is_pressing_mouse_position:Vector2


func _ready() -> void:
	pass


func _physics_process(delta: float) -> void:
	mouse_collison.global_position=get_global_mouse_position()
	if Input.is_action_just_pressed("space"):
		get_tree().quit()
	if is_dragging:
		get_window().position+=Vector2i(get_global_mouse_position()-is_pressing_mouse_position)
	move_and_slide()




func _input(event) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed && mouse_enter:
				#记录点击次数存储在全局
				unit_timer.start()
				Global.click_time+=1
				if Global.click_time>=3 && unit_timer.time_left>=0:
					state_machine.change_state("FiredHair")
					Global.click_time=0
					unit_timer.stop()
				#移动桌宠
				is_pressing_mouse_position=get_global_mouse_position()
				is_dragging = true
			else:
				is_dragging = false


func _on_mouse_checker_area_entered(_area: Area2D) -> void:
	mouse_enter=true

func _on_mouse_checker_area_exited(_area: Area2D) -> void:
	mouse_enter=false
