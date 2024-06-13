Class {
	#name : #PixelEditorWindowTest,
	#superclass : #TestCase,
	#category : #'PixelEditor-Tests'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/13/2024 11:57'
}
PixelEditorWindowTest >> testWindowOpen [

	
	self assert: PixelEditor open systemWindow
]
