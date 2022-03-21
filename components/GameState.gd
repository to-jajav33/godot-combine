extends Node

class_name GameState

signal signal_play_pattern();
signal signal_unblock_input();


# Declare member variables here. Examples:
var correctPattern = [];
var currentPattern = [];
var _canClickAgain = false;


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize();
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func canClickAgain():
	return self._canClickAgain;

func blockInput():
	self._canClickAgain = false;
	return;

func unblockInput():
	self._canClickAgain = true;
	self.emit_signal("signal_unblock_input");
	return;

func patternClicked(id : int):
	self.currentPattern.append(id);
	
	var isCorrect = true;
	if (self.currentPattern.size() > self.correctPattern.size()):
		isCorrect = false;
	else:
		var count = 0;
		for patt in self.currentPattern:
			isCorrect = patt == self.correctPattern[count];
			if (isCorrect == false):
				break;
			
			count = count + 1;
			continue;
	
	if (isCorrect == false):
		self.blockInput();
	elif(self.currentPattern.size() == self.correctPattern.size()):
		self.blockInput();
		# get new pattern
		# emit event to start new pattern animation
	return isCorrect;

func reset():
	self.correctPattern = [];
	self.currentPattern = [];
	return;


func addNewPattern():
	self.correctPattern.append(randi() % 4);
	return;

func playPattern():
	self.blockInput();
	self.emit_signal("signal_play_pattern", self.correctPattern);
	return;
