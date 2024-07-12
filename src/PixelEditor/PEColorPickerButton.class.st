"
A PEColorPickerButton is only for opening the colorPalette.


"
Class {
	#name : #PEColorPickerButton,
	#superclass : #PEColorButton,
	#category : #PixelEditor,
	#'squeak_changestamp' : 'GLE 7/12/2024 11:58'
}

{
	#category : #'on click',
	#'squeak_changestamp' : 'GLE 6/11/2024 14:18'
}
PEColorPickerButton >> doActionLeft [

	self doActionRight
]

{
	#category : #'on click',
	#'squeak_changestamp' : 'GLE 7/7/2024 18:19'
}
PEColorPickerButton >> doActionRight [

	PEColorButton selectedButton color isTransparent
		ifFalse: [ self pixelEditor openColorSelector ]
	
]
