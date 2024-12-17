extends KinematicBody2D
class_name Player

# Chamando Objetos
onready var player_sprite : Sprite = get_node("Texture")
# Physics
var Velocity : Vector2

# Variables : Exports
export(int) var move_speed


func _physics_process(delta):
	Horizontal_Move_Env() # Controlador para movimentos verticais
	Velocity = move_and_slide(Velocity) # Método do Vector2 para deslocar o objeto e slidar
	player_sprite.animate(Velocity) # Chamando o método de animações

func Horizontal_Move_Env() -> void:
	
	# Gatilhos usados para dar valor a posição que o personagem ( Velocity.x )
	var inputsHorizontal : float = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	
	Velocity.x = move_speed * inputsHorizontal
