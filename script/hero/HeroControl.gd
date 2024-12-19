extends KinematicBody2D
class_name PlayerScript

onready var texture : Sprite = get_node("Texture") # Referencia ao node Sprite
# Variables
var velocity : Vector2 # Vetor Bidimensional (X,Y)
var jump_count : int = 0 # Contador de pulos
var landing : bool = false 

# Exports
export(int) var move_speed # Velocidade de movimento horizontal
export(int) var jump_speed # velocidade do pulo
export(int) var player_gravity # força da gravidade do personagem 
func _physics_process(delta):
	
	Horizontal_Movement_Env() # Função dos controles horizontais
	Vertical_Movement_Env() # Função dos controles verticais
	velocity = move_and_slide(velocity,Vector2.UP) # Deslocamento do Objeto ( velocidade linear )
	Gravidade(delta) # Função gravidade 
	texture.animate(velocity) # Chamando a Função De Animação
func Horizontal_Movement_Env() -> void:
	
	# Input.get_action_strength() = Me retorna um valor enquanto estiver pressionando o input
	var inputs_horizontal : float = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	velocity.x = inputs_horizontal * move_speed
	print(velocity.x) # Verificar valor

func Vertical_Movement_Env() -> void:
	if is_on_floor():
		jump_count = 0
	if Input.is_action_just_pressed("jump") and jump_count < 2:
		jump_count +=1
		velocity.y = jump_speed
	
func Gravidade(delta:float) -> void:
	# Cada frame de execução do game
	velocity.y += delta * player_gravity
	# Limitando a gravidade
	if velocity.y >= player_gravity:
		velocity.y = player_gravity
