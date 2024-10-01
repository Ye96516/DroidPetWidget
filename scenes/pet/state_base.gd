extends Node

## 基础状态
class_name StateBase

@export var an_sprite: AnimatedSprite2D 
@export var pet_checker: Area2D 
@export var an_player: AnimationPlayer 
@export var timer:Timer
@export var pet:CharacterBody2D

var state_machine: StateMachine


## 进入状态
func enter() -> void:
	#print(self.name)
	pass

## 退出状态
func exit() -> void:
	pass

## 渲染帧触发
func process_update(delta: float) -> void:
	pass

## 物理帧触发
func physical_process_update(delta: float) -> void:
	pass
