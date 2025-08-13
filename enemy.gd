extends Node
class_name Enemy02

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var camera_2d = $Camera2D

var camera_shake_noise : FastNoiseLite

func _ready():
	# Initialize noise if needed
	camera_shake_noise = FastNoiseLite.new()

func set_shader_blink_intensity(new_value: float):
	# Assuming the shader is on animated_sprite_2d and has a uniform named 'blink_intensity'
	animated_sprite_2d.material.set_shader_parameter("blink_intensity", new_value)

func apply_damage():
	var blink_tween = get_tree().create_tween()
	blink_tween.tween_method(self.set_shader_blink_intensity, 1.0, 0.0, 0.5)
