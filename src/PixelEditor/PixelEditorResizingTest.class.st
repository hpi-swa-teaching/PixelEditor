Class {
	#name : #PixelEditorResizingTest,
	#superclass : #TestCase,
	#instVars : [
		'pixelEditor',
		'settingsButtons',
		'colorButtons'
	],
	#category : #'PixelEditor-Tests'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'ThB 6/21/2024 17:45'
}
PixelEditorResizingTest >> abandonPixelEditor [

	self pixelEditor systemWindow abandon
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ThB 6/21/2024 18:31'
}
PixelEditorResizingTest >> colorButtons [
	^ colorButtons
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ThB 6/21/2024 18:31'
}
PixelEditorResizingTest >> colorButtons: anObject [
	colorButtons := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ThB 6/21/2024 17:44'
}
PixelEditorResizingTest >> createPixelEditor [

	self pixelEditor: PixelEditor open
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ThB 6/21/2024 17:44'
}
PixelEditorResizingTest >> pixelEditor [
	^ pixelEditor
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ThB 6/21/2024 17:47'
}
PixelEditorResizingTest >> pixelEditor: aPixelEditor [
	pixelEditor := aPixelEditor
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ThB 6/21/2024 18:32'
}
PixelEditorResizingTest >> setUp [

	self createPixelEditor.
	
	settingsButtons := pixelEditor containerDictionary at: #settingsButtons.
	colorButtons := pixelEditor containerDictionary at: #colorButtons.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ThB 6/21/2024 18:31'
}
PixelEditorResizingTest >> settingButtons [
	^ settingButtons
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ThB 6/21/2024 18:31'
}
PixelEditorResizingTest >> settingButtons: anObject [
	settingButtons := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ThB 6/21/2024 18:32'
}
PixelEditorResizingTest >> testResizingAgent [
	
	settingsButtons owner bounds: (0@0 corner: 100@100).
	colorButtons owner bounds: (0@0 corner: 100@100).

	self assert: (settingsButtons bounds origin = settingsButtons owner bounds origin).
	self assert: (colorButtons bounds origin = colorButtons owner bounds origin).
]
