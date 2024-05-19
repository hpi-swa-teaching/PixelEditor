Class {
	#name : #PEColorButton,
	#superclass : #PEButton,
	#category : #PixelEditor
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/17/2024 14:55'
}
PEColorButton class >> borderColor [

	^ Color black
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/17/2024 19:37'
}
PEColorButton class >> borderSize [

	^ 1
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/17/2024 19:09'
}
PEColorButton >> doActionLeft [

	self anObject changeSelectedColor: self color.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/17/2024 14:56'
}
PEColorButton >> initialize [
	
	super initialize.
	self borderWidth: PEColorButton borderSize;
		borderColor: PEColorButton borderColor
]
