Class {
	#name : #PixelEditorColorSelectorTest,
	#superclass : #PixelEditorTest,
	#instVars : [
		'pixel',
		'color',
		'canvas',
		'layer'
	],
	#category : #'PixelEditor-Tests'
}

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
	#'squeak_changestamp' : 'GLE 6/21/2024 15:04'
}
PixelEditorColorSelectorTest >> changeSelectedColor [

	PEPixel selectedColor: Color green.
	self color: Color green.
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
	#'squeak_changestamp' : 'GLE 6/21/2024 14:16'
}
PixelEditorColorSelectorTest >> getCanvas [

	self canvas: (self pixelEditor containerDictionary at: #canvas).
	self getLayer: (self pixelEditor containerDictionary at: #canvas) layer
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/21/2024 16:10'
}
PixelEditorColorSelectorTest >> getColorButton [

	^ (self pixelEditor containerDictionary at: #colorButtons) submorphs first
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/21/2024 16:09'
}
PixelEditorColorSelectorTest >> getColorSelector [

	^ self pixelEditor containerDictionary at: #colorSelector
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/21/2024 15:08'
}
PixelEditorColorSelectorTest >> getLayer: aLayer [
	
	self layer: aLayer first.
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
	#'squeak_changestamp' : 'GLE 6/21/2024 16:16'
}
PixelEditorColorSelectorTest >> testColorSelector [

	| colorSelector |

	self createPixelEditor.
	self getColorButton doActionRight.
	colorSelector := self getColorSelector submorphs first.
	colorSelector adjustColor.
	self assert: (colorSelector hsvMorph selectedColor = PEColorButton selectedButton color).
	self abandonPixelEditor
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/21/2024 16:11'
}
PixelEditorColorSelectorTest >> testColorSelectorOpen [

	self createPixelEditor.
	self getColorButton doActionRight.
	self assert: (self getColorSelector hasSubmorphs).
	self abandonPixelEditor
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/17/2024 21:00'
}
PixelEditorColorSelectorTest >> testColoring [

	self createPixelEditor.
	self getCanvas.
	self changeColor: self pixel.
	self assert: ((self layer pixelDictionary at: pixel) color = self color).
	self abandonPixelEditor
	
]
