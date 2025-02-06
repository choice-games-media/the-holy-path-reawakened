extends Node

# Lazy fix where reloaded scenes don't keep their variables, so making a flag within the game scene itself is useless
# The scene transitition is also reparented in the game scene, so you couldn't move this there
var has_played_transition: Dictionary = {"Game": false}
