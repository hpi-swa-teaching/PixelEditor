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
	#'squeak_changestamp' : 'GLE 6/16/2024 20:44'
}
PEColorPickerButton >> doActionRight [

	| button |
	
	button := PEColorButton selectedButton.
	button color = Color transparent
		ifTrue:[^ nil]
		ifFalse: [PEColorPalette new colorButton: button]
]
