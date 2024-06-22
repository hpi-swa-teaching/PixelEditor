Class {
	#name : #PixelEditorResizingTest,
	#superclass : #PixelEditorTest,
	#instVars : [
		'settingsButtons',
		'colorButtons'
	],
	#category : #'PixelEditor-Tests'
}

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
	#'squeak_changestamp' : 'GLE 6/22/2024 12:55'
}
PixelEditorResizingTest >> getSettingsAndColorButtons [

	self 
		settingsButtons: (self pixelEditor containerDictionary at: #settingsButtons);
		colorButtons: (self pixelEditor containerDictionary at: #colorButtons)
		
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/22/2024 12:49'
}
PixelEditorResizingTest >> rightSize [

	^ (self settingsButtons bounds origin = self settingsButtons owner bounds origin)
		and: (self colorButtons bounds origin = self colorButtons owner bounds origin)
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/22/2024 12:53'
}
PixelEditorResizingTest >> setBounds [

	self settingsButtons owner bounds: (0@0 corner: 100@100).
	self colorButtons owner bounds: (0@0 corner: 100@100).
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/22/2024 12:50'
}
PixelEditorResizingTest >> settingsButtons [

	^ settingsButtons
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/22/2024 12:50'
}
PixelEditorResizingTest >> settingsButtons: anObject [

	settingsButtons := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/22/2024 12:56'
}
PixelEditorResizingTest >> testResizingAgent [

	self 
		createPixelEditor;
		getSettingsAndColorButtons;
		setBounds.
	self assert: self rightSize.
	self abandonPixelEditor
	
]
