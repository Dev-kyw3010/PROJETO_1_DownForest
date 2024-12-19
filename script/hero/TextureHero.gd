extends Sprite
class_name TexturePlayer

# Comunicação ente irmãos
export(NodePath) onready var animation = get_node(animation) as AnimationPlayer
export(NodePath) onready var player = get_node(player) as KinematicBody2D
# Realiza as chamadas das animações de cada ação do personagem
func animate(dir : Vector2) -> void:
	
	VerifyFlip(dir)
	if dir.y != 0:
		Vertical_Behavior(dir)
	elif player.landing == true:
		animation.play("LANDING")
	else:
		Horizontal_Behavior(dir)
func VerifyFlip(dir : Vector2) -> void:
	if dir.x > 0: # Direita
		flip_h = false
	elif dir.x < 0: # Esquerda
		flip_h = true 

func Horizontal_Behavior(dir : Vector2) -> void:
	
	if dir.x != 0:
		#run
		animation.play("RUN")
	else:
		#idle
		animation.play("IDLE")

func Vertical_Behavior(dir : Vector2) -> void:
	if dir.y > 0:
		player.landing = true
		animation.play("FALL")
	elif dir.y < 0:
		animation.play("JUMP")
