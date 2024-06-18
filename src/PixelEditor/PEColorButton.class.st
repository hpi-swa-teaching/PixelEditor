Class {
	#name : #PEColorButton,
	#superclass : #PEUI,
	#instVars : [
		'brush',
		'pixelEditor'
	],
	#classInstVars : [
		'selectedButton'
	],
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
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/17/2024 21:13'
}
PEColorButton >> brush [

	^ brush
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/17/2024 21:14'
}
PEColorButton >> brush: aBrush [

	brush := aBrush
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/17/2024 21:14'
}
PEColorButton >> doActionLeft [

	self brush changeSelectedColor: self color.
	PEColorButton selectedButton: self.
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/17/2024 21:27'
}
PEColorButton >> doActionRight [

	PEColorButton selectedButton: self.
	self pixelEditor openColorSelector
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/17/2024 14:57'
}
PEColorButton >> handlesMouseDown: anEvent [

	^ true
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/27/2024 10:47'
}
PEColorButton >> initialize [
	
	super initialize.
	self borderColor: PEColorButton borderColor;
		borderWidth: PEColorButton borderSize.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/27/2024 10:54'
}
PEColorButton >> mouseDown: anEvent [

	anEvent yellowButtonPressed ifTrue: [self doActionRight].
	anEvent redButtonPressed ifTrue: [self doActionLeft]
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/17/2024 21:14'
}
PEColorButton >> pixelEditor [

	^ pixelEditor
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/17/2024 21:14'
}
PEColorButton >> pixelEditor: aPixelEditor [

	pixelEditor := aPixelEditor
]
