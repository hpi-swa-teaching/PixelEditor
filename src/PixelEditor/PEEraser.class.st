"
A PEEraser is changing the selected color to transparent when clicked.
"
Class {
	#name : #PEEraser,
	#superclass : #PEColorButton,
	#category : #PixelEditor,
	#'squeak_changestamp' : 'GLE 7/12/2024 11:59'
}

{
	#category : #'on click',
	#'squeak_changestamp' : 'GLE 6/19/2024 16:38'
}
PEEraser >> doActionRight [

	self doActionLeft
]
