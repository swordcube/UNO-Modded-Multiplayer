class_name CardData extends Resource

## The internal name of the card data. Used in game for stacking.
@export var card_type:String

## Decide if playing this card will skip the next player.
@export_enum("Never", "If Unstackable", "Always") var skip_next:int = 0

## Allows you to play this card on any color and switch the color as well.
@export var wild_color:bool = false

## The symbols used on the cards and any effects applied on the next player.
@export var symbols:Array[CardSymbol] = []
