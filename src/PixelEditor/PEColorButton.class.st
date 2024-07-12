"
A PEColorButton is used for changing the selected color to its own color. With right click you open a colorPalette morph.

Instance Variables
	pixelEditor:		type: PixelEditor new

pixelEditor
	- We save the PixelEditor so we can create a colorPalette on right click.

"
Class {
	#name : #PEColorButton,
	#superclass : #PEUI,
	#instVars : [
		'pixelEditor'
	],
	#classInstVars : [
		'selectedButton'
	],
	#category : #PixelEditor,
	#'squeak_changestamp' : 'GLE 7/12/2024 11:59'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/11/2024 14:16'
}
PEColorButton class >> selectedButton [

	^ selectedButton
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/11/2024 14:16'
}
PEColorButton class >> selectedButton: aButton [

	selectedButton := aButton
]

{
	#category : #'on click',
	#'squeak_changestamp' : 'GLE 7/7/2024 18:19'
}
PEColorButton >> doActionLeft [

	PEPixel selectedColor: self color.
	self class selectedButton: self
	
]

{
	#category : #'on click',
	#'squeak_changestamp' : 'GLE 6/22/2024 14:04'
}
PEColorButton >> doActionRight [

	self doActionLeft.
	self class selectedButton: self.
	self pixelEditor openColorSelector
	
	
]

{
	#category : #'on click',
	#'squeak_changestamp' : 'GLE 5/17/2024 14:57'
}
PEColorButton >> handlesMouseDown: anEvent [

	^ true
]

{
	#category : #initialize,
	#'squeak_changestamp' : 'GLE 7/11/2024 11:42'
}
PEColorButton >> initialize [
	
	super initialize.
	self 
		borderColor: Color black;
		borderWidth: 1
]

{
	#category : #'on click',
	#'squeak_changestamp' : 'GLE 7/7/2024 18:19'
}
PEColorButton >> mouseDown: anEvent [

	anEvent yellowButtonPressed ifTrue: [ self doActionRight ].
	anEvent redButtonPressed ifTrue: [ self doActionLeft ]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/17/2024 21:14'
}
PEColorButton >> pixelEditor [

	^ pixelEditor
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/17/2024 21:14'
}
PEColorButton >> pixelEditor: aPixelEditor [

	pixelEditor := aPixelEditor
]
