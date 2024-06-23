Class {
	#name : #PEColorPickerButton,
	#superclass : #PEColorButton,
	#category : #PixelEditor
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/11/2024 14:18'
}
PEColorPickerButton >> doActionLeft [

	self doActionRight
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/23/2024 14:06'
}
PEColorPickerButton >> doActionRight [

	PEColorButton selectedButton color isTransparent
		ifFalse: [self pixelEditor openColorSelector]
	
]
