extends Node2D

@export var bug_scene: PackedScene
@onready var game_over_scene = $GameOver
@onready var score_label: Label = $HUD/Score

var score

func _ready() -> void:
	new_game()

func game_over() -> void:
	$BugTimer.stop()
	$ScoreTimer.stop()
	$Music.stop()
	game_over_scene.show()
	
func new_game():
	$StartTime.start()
	$player.start_pos($StartPosition.position)
	$Music.play()
	score = 0

func _on_score_timer_timeout() -> void:
	score += 1
	update_score()
	
func _on_start_time_timeout() -> void:
	$BugTimer.start()
	$ScoreTimer.start()

func update_score():
	score_label.text = str(score)
	
func _on_bug_timer_timeout() -> void:
	var bug = bug_scene.instantiate()#Criamos a referência
	var bug_location = $BugPath/BugPathLocation #posição dos sprites
	bug_location.progress_ratio = randf() #Fazer rodar aleatoriamente
	
	var direction = bug_location.rotation + PI / 2
	bug.position =  bug_location.position
	direction += randf_range(-PI/4, PI/4)
	bug.rotation = direction
	
	var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	bug.linear_velocity = velocity.rotated(direction)
	add_child(bug)
