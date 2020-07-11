extends Node2D

export(int) var speed = 80
var controllable = true

var move = Vector2.ZERO
onready var state_machine = $AnimationTree["parameters/playback"]

func _ready():
	$AnimationTree.active = true
	controllable = true

func _unhandled_input(_event):
	move = Vector2.ZERO
	if not controllable:
		return
	if Input.is_action_just_pressed("attack"):
		state_machine.travel("attack")
		return
	move.x = \
		Input.get_action_strength("right") - Input.get_action_strength("left")
	if move.x != 0:
		scale.x = -1 if move.x < 0 else 1
		state_machine.travel("walk")
	else:
		state_machine.travel("idle")

func _physics_process(delta):
	position += move*speed*delta
