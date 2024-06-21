Class {
	#name : #PEButtonBuilder,
	#superclass : #PEBuilder,
	#classInstVars : [
		'buttonBuilder'
	],
	#category : #PixelEditor
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/17/2024 18:11'
}
PEButtonBuilder class >> buttonRowExtent [

	^ 500 @ 50
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/17/2024 17:54'
}
PEButtonBuilder class >> buttonRowPosition [

	^ 50 @ 50
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 5/21/2024 21:28'
}
PEButtonBuilder class >> canvasSizeButtonSize [

	^ 80 @ 50
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/17/2024 17:55'
}
PEButtonBuilder class >> colorButtonRowExtent [

	^ 80 @ 500
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/17/2024 18:10'
}
PEButtonBuilder class >> colorButtonRowPosition [

	^ 10 @ 300
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/17/2024 19:13'
}
PEButtonBuilder class >> colorButtonSize [

	^ 80 @ 80
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GT 6/10/2024 19:33'
}
PEButtonBuilder class >> colorsForButtons [

	^ {Color lightBrown.
		Color black. 
		Color blue.
		Color yellow.
		Color red.
		Color green.
		Color magenta.
		Color cyan}
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/20/2024 11:14'
}
PEButtonBuilder class >> default [

	buttonBuilder 
		ifNil: [ buttonBuilder := PEButtonBuilder new ].
	^ buttonBuilder
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 6/10/2024 16:02'
}
PEButtonBuilder class >> settingsButtonSize [

	^ 200 @ 100
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/11/2024 14:51'
}
PEButtonBuilder class >> toolButtonSize [

	^ 100 @ 100
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/17/2024 16:21'
}
PEButtonBuilder >> addImage: anImage toMorph: aMorph [

	| image | 
	
	image := ImageMorph new image: anImage.
	image layoutProperties: (LayoutProperties new hResizing: #spaceFill;
		vResizing: #spaceFill).
	image layoutPolicy: (TableLayout new layout: image in: aMorph).
	aMorph addMorph: image
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GT 6/10/2024 19:11'
}
PEButtonBuilder >> assetHandler [

	^ GitAssetLoader for: 'PixelEditor'
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/20/2024 17:57'
}
PEButtonBuilder >> buildAcceptButton: aColorPalette [

	^ PluggableButtonMorph new target: aColorPalette;
		action: #adjustColor;
		label: 'Accept';
		extent: self colorPickerButtonSize;
		yourself
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/20/2024 17:57'
}
PEButtonBuilder >> buildCloseButton: aColorPalette [

	^ PluggableButtonMorph new target: aColorPalette;
		action: #abandon;
		label: 'Close';
		extent: self colorPickerButtonSize;
		yourself
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/19/2024 23:10'
}
PEButtonBuilder >> buildColorButtonWithTarget: aPixelEditor andColor: aColor [ 
	
	^ PEColorButton new 
		pixelEditor: aPixelEditor; 
		extent: PEButtonBuilder colorButtonSize;
		color: aColor;
		yourself
		
	

	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/20/2024 11:03'
}
PEButtonBuilder >> buildColorButtonsWithTarget: aPixelEditor [

	| buttonCollection |
	
	buttonCollection := OrderedCollection new.
	PEButtonBuilder colorsForButtons do: [:nextColor | 
		buttonCollection add: (self buildColorButtonWithTarget: aPixelEditor andColor: nextColor)].
	^  PEButtonRow new addMorphCollection: buttonCollection
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/17/2024 21:11'
}
PEButtonBuilder >> buildColorPickerButton: aPixelEditor [

	| button |
	
	button := PEColorPickerButton new
		pixelEditor: aPixelEditor;
		beTransparent;
		borderWidth: 0.
	self addImage: (self assetHandler loadForm: self colorBucketPath) toMorph: button.
	^ button
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/20/2024 18:55'
}
PEButtonBuilder >> buildColorSelectorButtonRow: aColorSelector [

	aColorSelector colorButton: PEColorButton selectedButton.   
	^ PEButtonRow new addMorphNext: (self buildAcceptButton: aColorSelector);
			addMorphNext: (self buildCloseButton: aColorSelector)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/20/2024 11:12'
}
PEButtonBuilder >> buildEmptyButtonRow [

	^ PEButtonRow new

		
		
	

	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/20/2024 11:07'
}
PEButtonBuilder >> buildEraserButton [

	| button |
	
	button := PEEraser new
		beTransparent;
		borderWidth: 0;
		extent: PEButtonBuilder toolButtonSize.
	self addImage: (self assetHandler loadForm: self eraserPath) toMorph: button.
	^ button
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/19/2024 22:44'
}
PEButtonBuilder >> buildEraserButton: aCanvas [

	| button |
	
	button := PEEraser new
		beTransparent;
		borderWidth: 0;
		extent: PEButtonBuilder toolButtonSize.
	self addImage: (self assetHandler loadForm: self eraserPath) toMorph: button.
	^ button
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 6/10/2024 16:03'
}
PEButtonBuilder >> buildExportButton: aPixelEditor [

	^ PEExportButton new target: aPixelEditor;
		label: 'Export';
		extent: (PEButtonBuilder settingsButtonSize);
		yourself

		
		
	

	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/17/2024 19:09'
}
PEButtonBuilder >> buildGridButton: aPixelEditor [

	^ PEGridButton new target: aPixelEditor;
		label: 'Grid';
		extent: (PEButtonBuilder settingsButtonSize);
		yourself

		
		
	

	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/11/2024 13:58'
}
PEButtonBuilder >> buildLoadButton: aPixelEditor [

	^ PELoadButton new target: aPixelEditor;
		label: 'Load';
		extent: (PEButtonBuilder settingsButtonSize);
		yourself

		
		
	

	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 6/10/2024 16:03'
}
PEButtonBuilder >> buildSaveButton: aPixelEditor [

	^ PESaveButton new target: aPixelEditor;
		label: 'Save';
		extent: (PEButtonBuilder settingsButtonSize);
		yourself

		
		
	

	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/20/2024 11:11'
}
PEButtonBuilder >> buildSettingsButtons: aPixelEditor [
	
	^ PEButtonRow new addMorphCollection: 
		{ self buildSaveButton: aPixelEditor. 
		   self buildLoadButton: aPixelEditor. 
		   self buildExportButton: aPixelEditor.
		   self buildGridButton: aPixelEditor }
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/20/2024 11:10'
}
PEButtonBuilder >> buildToolButtons: aPixelEditor [

	^ PEButtonRow new addMorphCollection: 
		{ self buildEraserButton. 
		   self buildColorPickerButton: aPixelEditor }
		
		
	

	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/11/2024 14:14'
}
PEButtonBuilder >> colorBucketPath [

	^ '/assets/colorBucket.png'
]

{
	#category : #'button sizes',
	#'squeak_changestamp' : 'GLE 6/20/2024 17:56'
}
PEButtonBuilder >> colorPickerButtonSize [

	^ 96 @ 50
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GT 6/10/2024 18:55'
}
PEButtonBuilder >> eraserPath [

	^ '/assets/eraser.png'
]
