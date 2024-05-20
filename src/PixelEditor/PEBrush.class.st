Class {
	#name : #PEBrush,
	#superclass : #PETools,
	#instVars : [
		'pixelCollection',
		'selectedColor'
	],
	#category : #PixelEditor
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/16/2024 10:41'
}
PEBrush >> basicType [

	^#PEBrush
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GT 5/20/2024 17:56'
}
PEBrush >> changeButtonColor: aButton [

	PEColorPalette new colorButton: aButton
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/13/2024 19:02'
}
PEBrush >> changeSelectedColor: aColor [

	self pixelCollection do: [:each | each selectedColor: aColor]
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/17/2024 19:50'
}
PEBrush >> initialize [ 
	
	super initialize.
	self color: Color transparent
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/17/2024 18:18'
}
PEBrush >> pixelCollection [

	^ pixelCollection
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/13/2024 19:01'
}
PEBrush >> pixelCollection: aCollection [

	pixelCollection := aCollection
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/17/2024 18:18'
}
PEBrush >> selectedColor [
	
	^ selectedColor
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/13/2024 19:48'
}
PEBrush >> selectedColor: aColor [

	selectedColor := aColor
]
