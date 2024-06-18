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
	#'squeak_changestamp' : 'GLE 6/17/2024 21:10'
}
PEColorPickerButton >> doActionRight [

	self pixelEditor openColorSelector
]
