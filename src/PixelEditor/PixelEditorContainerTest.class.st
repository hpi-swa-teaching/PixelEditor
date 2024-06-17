Class {
	#name : #PixelEditorContainerTest,
	#superclass : #TestCase,
	#instVars : [
		'pixelEditor',
		'containerArray'
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
	#'squeak_changestamp' : 'LW 6/13/2024 16:11'
}
PixelEditorContainerTest >> containerArray [

	^ containerArray
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 6/13/2024 16:11'
}
PixelEditorContainerTest >> containerArray: anArray [

	containerArray := anArray
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
	#'squeak_changestamp' : 'LW 6/13/2024 16:11'
}
PixelEditorContainerTest >> getContainerArray [

	^ self pixelEditor containerArray
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 6/13/2024 16:09'
}
PixelEditorContainerTest >> iterateContainerArray: anArray [

	^ (anArray allSatisfy: [:each | each submorphs isEmpty not])
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
	#'squeak_changestamp' : 'LW 6/13/2024 16:18'
}
PixelEditorContainerTest >> testContainerContent [

	self createPixelEditor.
	self containerArray: self getContainerArray.
	self assert: (self iterateContainerArray: self containerArray).
	"self pixelEditor abandon"

	
]
