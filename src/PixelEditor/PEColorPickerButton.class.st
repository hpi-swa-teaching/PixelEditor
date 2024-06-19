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
	#'squeak_changestamp' : 'GLE 6/19/2024 16:34'
}
PEColorPickerButton >> doActionRight [

	PEColorButton selectedButton color = Color transparent
		ifFalse: [self pixelEditor openColorSelector]
	
]
