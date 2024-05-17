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
	#'squeak_changestamp' : 'GLE 5/17/2024 14:54'
}
PEColorButton class >> borderSize [

	^ 2
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
