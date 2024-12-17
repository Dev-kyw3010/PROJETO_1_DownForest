extends ParallaxBackground
class_name Background
# ----------------------------------------------------
# ----------------------------------------------------
export(bool) var can_process # (ativo / inativo )
export(Array,int) var layers # (velocidade de cada camada do parallax)


func _physics_process(delta):
	for index in get_child_count():
		if get_child(index) is ParallaxLayer:
			get_child(index).motion_offset.x -= delta * layers[index]

func _ready():
	if can_process == false:
		set_physics_process(false)
