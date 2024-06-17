Class {
	#name : #PixelEditorWindowTest,
	#superclass : #TestCase,
	#instVars : [
		'pixelEditor'
	],
	#category : #'PixelEditor-Tests'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/17/2024 14:12'
}
PixelEditorWindowTest >> abandonPixelEditor [

	self pixelEditor systemWindow abandon
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/13/2024 15:40'
}
PixelEditorWindowTest >> createPixelEditor [

	self pixelEditor: PixelEditor open
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/13/2024 15:38'
}
PixelEditorWindowTest >> pixelEditor [

	^ pixelEditor
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/13/2024 15:38'
}
PixelEditorWindowTest >> pixelEditor: anObject [

	pixelEditor := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/16/2024 18:07'
}
PixelEditorWindowTest >> testWindowOpen [

	| test |
	self createPixelEditor.
	self assert: (self pixelEditor systemWindow ifNil: [ test := false ] ifNotNil: [ test := true ]).
	self abandonPixelEditor.
	^ test
]
