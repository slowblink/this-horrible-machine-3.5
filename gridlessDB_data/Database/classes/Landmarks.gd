extends Resource
class_name Landmarks

enum Directions {Above, Below, Downtrench, Uptrench}
export(Directions) var direction = Directions.Below
export (bool) var dangerous = 0
export (bool) var beautiful = 0
export (bool) var valued = 0
