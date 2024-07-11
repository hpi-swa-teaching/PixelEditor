Class {
	#name : #PixelEditorWindowTest,
	#superclass : #PixelEditorTest,
	#category : #'PixelEditor-Tests'
}

{
	#category : #testing,
	#'squeak_changestamp' : 'GLE 6/21/2024 16:40'
}
PixelEditorWindowTest >> testWindowOpen [

	self createPixelEditor.
	self assert: (self pixelEditor systemWindow ifNil: [ false ] ifNotNil: [ true ]).
	self abandonPixelEditor.
]
