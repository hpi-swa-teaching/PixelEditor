Class {
	#name : #PixelEditorColorSelectorTest,
	#superclass : #TestCase,
	#instVars : [
		'pixelEditor',
		'pixel',
		'color',
		'canvas',
		'layer'
	],
	#category : #'PixelEditor-Tests'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 6/17/2024 00:19'
}
PixelEditorColorSelectorTest >> abandonPixelEditor [

	self pixelEditor systemWindow abandon
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 6/17/2024 13:48'
}
PixelEditorColorSelectorTest >> canvas [

	^ canvas
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 6/17/2024 00:47'
}
PixelEditorColorSelectorTest >> canvas: aCanvas [

	canvas := aCanvas
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 6/16/2024 23:47'
}
PixelEditorColorSelectorTest >> changeColor [

	self pixelEditor changeSelectedColor: Color green.
	^ Color green
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 6/17/2024 01:07'
}
PixelEditorColorSelectorTest >> changeColor: aPixel [

	self changeSelectedColor.
	(self layer pixelDictionary at: pixel) changeColor
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 6/17/2024 13:46'
}
PixelEditorColorSelectorTest >> changeSelectedColor [

	| brush |
	brush := self canvas brush.
	brush changeSelectedColor: Color green.
	"self color: Color green.
	self layer submorphsDo: [:each | each className = #PEPixel ifTrue: [
        each brushSelectedColor: self color]]."
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 6/17/2024 00:17'
}
PixelEditorColorSelectorTest >> color [

	^ color
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 6/17/2024 00:59'
}
PixelEditorColorSelectorTest >> color: aColor [

	color := aColor
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 6/16/2024 23:47'
}
PixelEditorColorSelectorTest >> colorPixel [
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 6/16/2024 23:46'
}
PixelEditorColorSelectorTest >> createPixelEditor [

	self pixelEditor: PixelEditor open
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 6/17/2024 00:55'
}
PixelEditorColorSelectorTest >> getCanvas [

	self canvas: (self pixelEditor containerDictionary at: #canvas).
	self getLayer: (self pixelEditor containerDictionary at: #canvas)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 6/17/2024 01:04'
}
PixelEditorColorSelectorTest >> getLayer: aCanvas [
	
	self layer: (aCanvas layer) first.
	self getPixelDictionary: self layer

	

	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 6/17/2024 00:35'
}
PixelEditorColorSelectorTest >> getPixel: aDictionary [

	self pixel: (aDictionary keys) first
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 6/17/2024 01:06'
}
PixelEditorColorSelectorTest >> getPixelDictionary: aLayer [

	self getPixel: (aLayer pixelDictionary)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 6/17/2024 01:02'
}
PixelEditorColorSelectorTest >> layer [

	^ layer
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 6/17/2024 01:02'
}
PixelEditorColorSelectorTest >> layer: aLayer [

	layer := aLayer
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 6/17/2024 00:15'
}
PixelEditorColorSelectorTest >> pixel [

	^ pixel
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 6/17/2024 00:17'
}
PixelEditorColorSelectorTest >> pixel: aColor [

	pixel := aColor
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 6/16/2024 23:39'
}
PixelEditorColorSelectorTest >> pixelEditor [

	^ pixelEditor
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 6/16/2024 23:40'
}
PixelEditorColorSelectorTest >> pixelEditor: anObject [

	pixelEditor := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 6/17/2024 01:08'
}
PixelEditorColorSelectorTest >> testWindowOpen [

	self createPixelEditor.
	self getCanvas.
	self changeColor: self pixel.
	self assert: (((self layer pixelDictionary at: pixel) color = self color) ifFalse: [ ^ false ] ifTrue: [ ^ true]).
	self abandonPixelEditor
]
