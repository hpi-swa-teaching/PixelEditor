Class {
	#name : #PixelEditorContainerTest,
	#superclass : #TestCase,
	#instVars : [
		'pixelEditor',
		'containerDictionary'
	],
	#category : #'PixelEditor-Tests'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/17/2024 15:58'
}
PixelEditorContainerTest >> abandonPixelEditor [

	self pixelEditor systemWindow abandon
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/18/2024 10:41'
}
PixelEditorContainerTest >> containerDictionary [

	^ self pixelEditor containerDictionary
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 6/13/2024 15:56'
}
PixelEditorContainerTest >> createPixelEditor [

	self pixelEditor: PixelEditor open
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/18/2024 10:41'
}
PixelEditorContainerTest >> iterateContainerDictionary: aDictionary [

	aDictionary removeKey: #colorSelector.
	^ (aDictionary allSatisfy: [:each | each submorphs isEmpty not])
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 6/13/2024 15:58'
}
PixelEditorContainerTest >> pixelEditor [

	^ pixelEditor
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 6/13/2024 15:59'
}
PixelEditorContainerTest >> pixelEditor: anObject [

	pixelEditor := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/18/2024 10:41'
}
PixelEditorContainerTest >> testContainerContent [

	self createPixelEditor.
	self assert: (self iterateContainerDictionary: self containerDictionary).
	self abandonPixelEditor

	
]
