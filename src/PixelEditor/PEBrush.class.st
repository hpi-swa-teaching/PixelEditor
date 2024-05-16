Class {
	#name : #PEBrush,
	#superclass : #PETools,
	#instVars : [
		'pixelCollection',
		'selectedColor',
		'eraser'
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
	#'squeak_changestamp' : 'GLE 5/13/2024 19:51'
}
PEBrush >> brush [
	eraser:= false.
	self changeSelectedColor: self selectedColor
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
	#'squeak_changestamp' : 'GLE 5/13/2024 19:51'
}
PEBrush >> eraser [
 	eraser:= true.
	self changeSelectedColor: Color transparent
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/13/2024 19:49'
}
PEBrush >> handlesMouseDown: anEvent [

	^true
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/13/2024 19:52'
}
PEBrush >> initialize [
	
	super initialize.
	self extent: 50 @ 50;
		openInWorld;
		position: 100@100;
		selectedColor: Color black.
		eraser:= false
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/13/2024 19:51'
}
PEBrush >> mouseDown: anEvent [

	eraser ifTrue: [self brush]
			ifFalse:[self eraser]
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/13/2024 19:01'
}
PEBrush >> pixelCollection [

	^pixelCollection
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
	#'squeak_changestamp' : 'GLE 5/13/2024 19:48'
}
PEBrush >> selectedColor [
	
	^selectedColor
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/13/2024 19:48'
}
PEBrush >> selectedColor: aColor [

	selectedColor := aColor
]
