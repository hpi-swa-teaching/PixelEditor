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
	#category : #accessing,
	#'squeak_changestamp' : 'LW 6/17/2024 13:48'
}
PixelEditorColorSelectorTest >> canvas [

	^ canvas
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 6/17/2024 00:47'
}
PixelEditorColorSelectorTest >> canvas: aCanvas [

	canvas := aCanvas
	
]

{
	#category : #testing,
	#'squeak_changestamp' : 'GLE 6/22/2024 13:09'
}
PixelEditorColorSelectorTest >> changeColor [

	self changeSelectedColor.
	self layer handlesMouseStillDown: self simulateMouseEvent
]

{
	#category : #testing,
	#'squeak_changestamp' : 'GLE 7/11/2024 11:47'
}
PixelEditorColorSelectorTest >> changeSelectedColor [

	PEPixel selectedColor: Color green.
	self color: Color green
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 6/17/2024 00:17'
}
PixelEditorColorSelectorTest >> color [

	^ color
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 6/17/2024 00:59'
}
PixelEditorColorSelectorTest >> color: aColor [

	color := aColor
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/22/2024 13:04'
}
PixelEditorColorSelectorTest >> getCanvasAndLayer [

	self canvas: (self pixelEditor containerDictionary at: #canvas).
	self getLayer: (self pixelEditor containerDictionary at: #canvas) layer
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/21/2024 16:10'
}
PixelEditorColorSelectorTest >> getColorButton [

	^ (self pixelEditor containerDictionary at: #colorButtons) submorphs first
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/21/2024 16:09'
}
PixelEditorColorSelectorTest >> getColorSelector [

	^ self pixelEditor containerDictionary at: #colorSelector
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/21/2024 15:08'
}
PixelEditorColorSelectorTest >> getLayer: aLayer [
	
	self layer: aLayer first.
	self getPixelDictionary: self layer

	

	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/22/2024 13:05'
}
PixelEditorColorSelectorTest >> getPixel [

	^ self layer pixelDictionary values first
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 6/23/2024 12:59'
}
PixelEditorColorSelectorTest >> getPixel: aDictionary [

	self pixel: (aDictionary keys) atRandom
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 6/17/2024 01:06'
}
PixelEditorColorSelectorTest >> getPixelDictionary: aLayer [

	self getPixel: (aLayer pixelDictionary)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 6/17/2024 01:02'
}
PixelEditorColorSelectorTest >> layer [

	^ layer
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 6/17/2024 01:02'
}
PixelEditorColorSelectorTest >> layer: aLayer [

	layer := aLayer
]

{
	#category : #testing,
	#'squeak_changestamp' : 'GLE 6/22/2024 13:13'
}
PixelEditorColorSelectorTest >> openColorSelector [

	self getColorButton doActionRight
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 6/17/2024 00:15'
}
PixelEditorColorSelectorTest >> pixel [

	^ pixel
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 6/17/2024 00:17'
}
PixelEditorColorSelectorTest >> pixel: aColor [

	pixel := aColor
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/22/2024 12:58'
}
PixelEditorColorSelectorTest >> pixelDictionary [

	^ self layer pixelDictionary
]

{
	#category : #testing,
	#'squeak_changestamp' : 'GLE 6/22/2024 13:03'
}
PixelEditorColorSelectorTest >> simulateMouseEvent [

	^ Morph new position: self layer position
]

{
	#category : #testing,
	#'squeak_changestamp' : 'GLE 6/22/2024 13:14'
}
PixelEditorColorSelectorTest >> testColorSelector [

	| colorSelector |

	self createPixelEditor;
		openColorSelector.
	colorSelector := self getColorSelector submorphs first.
	colorSelector adjustColor.
	self assert: (colorSelector hsvMorph selectedColor = PEColorButton selectedButton color).
	self abandonPixelEditor
]

{
	#category : #testing,
	#'squeak_changestamp' : 'GLE 6/22/2024 13:14'
}
PixelEditorColorSelectorTest >> testColorSelectorOpen [

	self 
		createPixelEditor;
		openColorSelector;
		assert: (self getColorSelector hasSubmorphs);
		abandonPixelEditor
]

{
	#category : #testing,
	#'squeak_changestamp' : 'GLE 6/22/2024 13:12'
}
PixelEditorColorSelectorTest >> testColoring [

	self 
		createPixelEditor;
		getCanvasAndLayer;
		changeColor;
		assert: (self getPixel color = self color);
		abandonPixelEditor
	
]
