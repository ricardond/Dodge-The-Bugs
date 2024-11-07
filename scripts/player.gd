extends Area2D

const SPEED := 400
signal hit
@onready var screen_size = get_viewport_rect().size
@onready var anim: AnimatedSprite2D = $anim
@onready var collision: CollisionShape2D = $collision

func _ready() -> void:
	hide()

func _process(delta: float) -> void:

	var velocity = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * SPEED
		
	position += velocity * delta
	
	if velocity.x != 0:
		anim.play("move")
	elif velocity.y > 0:
		anim.play("move_up")
	elif velocity.y < 0:
		anim.play("move_down")
	else:
		anim.play("idle")
		
	anim.flip_h = true if velocity.x > 0 else false

	position = position.clamp(Vector2.ZERO, screen_size)

func _on_body_entered(body: Node2D) -> void:
	hide()
	hit.emit()
	collision.set_deferred("disable", true)

func start_pos(pos):
	position = pos
	show()
	collision.disabled = false
