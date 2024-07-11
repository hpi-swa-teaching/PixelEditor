Class {
	#name : #PixelEditorTest,
	#superclass : #TestCase,
	#instVars : [
		'pixelEditor'
	],
	#category : #'PixelEditor-Tests'
}

{
	#category : #initialize,
	#'squeak_changestamp' : 'GLE 6/21/2024 15:22'
}
PixelEditorTest >> abandonPixelEditor [

	self pixelEditor systemWindow abandon
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/21/2024 16:20'
}
PixelEditorTest >> assetHandler [

	^ GitAssetLoader for: 'PixelEditor'
]

{
	#category : #initialize,
	#'squeak_changestamp' : 'GLE 6/21/2024 15:22'
}
PixelEditorTest >> createPixelEditor [

	self pixelEditor: PixelEditor open
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/21/2024 15:24'
}
PixelEditorTest >> pixelEditor [

	^ pixelEditor
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/21/2024 15:24'
}
PixelEditorTest >> pixelEditor: anObject [

	pixelEditor := anObject
]
