extends Node2D


# Declare member variables here. Examples:
var _gameState : GameState;
export(float) var delayBetweenPatternAnims = 0.75;
var currentDelayCount = delayBetweenPatternAnims;

var patternToPlay = [];
var isPlaying = false;
var patternIndexToPlay = 0;

# Called when the node enters the scene tree for the first time.
func _ready():
	var count = 0;
	var childrenArr = $items.get_children();
	var distance = 75.0;
	for item in childrenArr:
		var rad = count * ((2 * PI) / float(childrenArr.size()))
		var pos = Vector2(cos(rad), sin(rad)).normalized() * distance;
		item.position = pos;
		count = count + 1;
		
		for child in item.get_children():
			if (child.name.begins_with("Sprite_")):
				child.get_node("AnimationPlayerItem").play("default");
			continue;
		continue;
	
	self._gameState = $"/root/GameStateManager".getGameState();
	self._gameState.connect("signal_play_pattern", self, "onPlayPattern");
	self._gameState.playPattern();
		
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (self.isPlaying):
		self.currentDelayCount = self.currentDelayCount - delta;
		if (self.currentDelayCount <= 0.0):
			var count = 0;
			for child in $items.get_children():
				if (count == self.patternIndexToPlay):
					child.playClickedAnim();
					self.currentDelayCount = self.delayBetweenPatternAnims;
					self.patternIndexToPlay = self.patternIndexToPlay + 1;
					if (self.patternIndexToPlay >= self.patternToPlay.size()):
						print("done animating")
						self.isPlaying = false;
						self._gameState.unblockInput();
					break;
				count = count + 1;
				continue;
	pass

func onPlayPattern(patternArr):
	self.patternToPlay = patternArr;
	self.patternIndexToPlay = 0;
	self.isPlaying = true;
	return;
