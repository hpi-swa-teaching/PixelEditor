Class {
	#name : #PixelEditorContainerTest,
	#superclass : #PixelEditorTest,
	#instVars : [
		'containerDictionary'
	],
	#category : #'PixelEditor-Tests'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/18/2024 10:41'
}
PixelEditorContainerTest >> containerDictionary [

	^ self pixelEditor containerDictionary
]

{
	#category : #testing,
	#'squeak_changestamp' : 'GLE 6/18/2024 10:41'
}
PixelEditorContainerTest >> iterateContainerDictionary: aDictionary [

	aDictionary removeKey: #colorSelector.
	^ (aDictionary allSatisfy: [:each | each submorphs isEmpty not])
]

{
	#category : #testing,
	#'squeak_changestamp' : 'GLE 6/18/2024 10:41'
}
PixelEditorContainerTest >> testContainerContent [

	self createPixelEditor.
	self assert: (self iterateContainerDictionary: self containerDictionary).
	self abandonPixelEditor

	
]
