Class {
	#name : #PEButtonBuilder,
	#superclass : #PEBuilder,
	#classInstVars : [
		'buttonBuilder'
	],
	#category : #PixelEditor
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 7/6/2024 15:11'
}
PEButtonBuilder class >> buttonBuilder [

	^ buttonBuilder
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 7/6/2024 15:12'
}
PEButtonBuilder class >> buttonBuilder: aButtonBuilder [

	^ buttonBuilder := aButtonBuilder
]

{
	#category : #initialize,
	#'squeak_changestamp' : 'GLE 7/6/2024 15:14'
}
PEButtonBuilder class >> default [

	self buttonBuilder 
		ifNil: [ self buttonBuilder: self new ].
	^ self buttonBuilder
]

{
	#category : #initialize,
	#'squeak_changestamp' : 'GLE 7/6/2024 15:13'
}
PEButtonBuilder class >> reset [

	self buttonBuilder: PEButtonBuilder new
]

{
	#category : #images,
	#'squeak_changestamp' : 'GLE 6/22/2024 13:25'
}
PEButtonBuilder >> addImage: anImage toMorph: aMorph [

	| image | 
	
	image := ImageMorph new image: anImage.
	image layoutProperties: (LayoutProperties new 
		hResizing: #spaceFill;
		vResizing: #spaceFill).
	image layoutPolicy: (TableLayout new layout: image in: aMorph).
	aMorph addMorph: image
	
]

{
	#category : #images,
	#'squeak_changestamp' : 'GT 6/10/2024 19:11'
}
PEButtonBuilder >> assetHandler [

	^ GitAssetLoader for: 'PixelEditor'
]

{
	#category : #'color selector/palette buttons',
	#'squeak_changestamp' : 'GLE 6/22/2024 13:43'
}
PEButtonBuilder >> buildAcceptButton: aColorPalette [

	^ PluggableButtonMorph new 
		target: aColorPalette;
		action: #adjustColor;
		label: 'Accept';
		extent: self colorPickerButtonSize;
		yourself
]

{
	#category : #'color selector/palette buttons',
	#'squeak_changestamp' : 'GLE 6/22/2024 13:43'
}
PEButtonBuilder >> buildCloseButton: aColorPalette [

	^ PluggableButtonMorph new 
		target: aColorPalette;
		action: #abandon;
		label: 'Close';
		extent: self colorPickerButtonSize;
		yourself
]

{
	#category : #' color buttons',
	#'squeak_changestamp' : 'GLE 6/22/2024 13:34'
}
PEButtonBuilder >> buildColorButtonWithTarget: aPixelEditor andColor: aColor [ 
	
	^ PEColorButton new 
		pixelEditor: aPixelEditor; 
		extent: self colorButtonSize;
		color: aColor;
		yourself
		
	

	
]

{
	#category : #' color buttons',
	#'squeak_changestamp' : 'GLE 6/22/2024 13:40'
}
PEButtonBuilder >> buildColorButtonsWithTarget: aPixelEditor [

	| buttonCollection |
	
	buttonCollection := OrderedCollection new.
	self colorsForButtons do: [:nextColor | 
		buttonCollection add: (self buildColorButtonWithTarget: aPixelEditor andColor: nextColor)].
	^  PEButtonRow new addMorphCollection: buttonCollection
]

{
	#category : #'color selector/palette buttons',
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
	#category : #'color selector/palette buttons',
	#'squeak_changestamp' : 'GLE 6/20/2024 18:55'
}
PEButtonBuilder >> buildColorSelectorButtonRow: aColorSelector [

	aColorSelector colorButton: PEColorButton selectedButton.   
	^ PEButtonRow new addMorphNext: (self buildAcceptButton: aColorSelector);
			addMorphNext: (self buildCloseButton: aColorSelector)
]

{
	#category : #'color selector/palette buttons',
	#'squeak_changestamp' : 'GLE 6/20/2024 11:12'
}
PEButtonBuilder >> buildEmptyButtonRow [

	^ PEButtonRow new

		
		
	

	
]

{
	#category : #'tool buttons',
	#'squeak_changestamp' : 'GLE 6/22/2024 13:34'
}
PEButtonBuilder >> buildEraserButton [

	| button |
	
	button := PEEraser new
		beTransparent;
		borderWidth: 0;
		extent: self toolButtonSize.
	self addImage: (self assetHandler loadForm: self eraserPath) toMorph: button.
	^ button
]

{
	#category : #'settings buttons',
	#'squeak_changestamp' : 'GLE 6/22/2024 13:34'
}
PEButtonBuilder >> buildExportButton: aPixelEditor [

	^ PEExportButton new 
		target: aPixelEditor;
		label: 'Export';
		extent: self settingsButtonSize;
		yourself

		
		
	

	
]

{
	#category : #'settings buttons',
	#'squeak_changestamp' : 'GLE 6/22/2024 13:34'
}
PEButtonBuilder >> buildGridButton: aPixelEditor [

	^ PEGridButton new 
		target: aPixelEditor;
		label: 'Grid';
		extent: self settingsButtonSize;
		yourself

		
		
	

	
]

{
	#category : #'input window buttons',
	#'squeak_changestamp' : 'GLE 7/7/2024 17:56'
}
PEButtonBuilder >> buildInputSubmitButtonWithTarget: anInputWindow [

	^ PluggableButtonMorph new 
		label: 'Submit size';
		extent: self submitButtonSize;
		target: anInputWindow;
		action: #processValues;
		yourself
		
	

	
]

{
	#category : #'settings buttons',
	#'squeak_changestamp' : 'GLE 6/22/2024 13:34'
}
PEButtonBuilder >> buildLoadButton: aPixelEditor [

	^ PELoadButton new 
		target: aPixelEditor;
		label: 'Load';
		extent: self settingsButtonSize;
		yourself

		
		
	

	
]

{
	#category : #'settings buttons',
	#'squeak_changestamp' : 'GLE 6/22/2024 13:35'
}
PEButtonBuilder >> buildSaveButton: aPixelEditor [

	^ PESaveButton new 
		target: aPixelEditor;
		label: 'Save';
		extent: self settingsButtonSize;
		yourself

		
		
	

	
]

{
	#category : #'settings buttons',
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
	#category : #'tool buttons',
	#'squeak_changestamp' : 'GLE 6/20/2024 11:10'
}
PEButtonBuilder >> buildToolButtons: aPixelEditor [

	^ PEButtonRow new addMorphCollection: 
		{ self buildEraserButton. 
		   self buildColorPickerButton: aPixelEditor }
		
		
	

	
]

{
	#category : #images,
	#'squeak_changestamp' : 'GLE 6/11/2024 14:14'
}
PEButtonBuilder >> colorBucketPath [

	^ '/assets/colorBucket.png'
]

{
	#category : #'button sizes',
	#'squeak_changestamp' : 'GLE 5/17/2024 19:13'
}
PEButtonBuilder >> colorButtonSize [

	^ 80 @ 80
]

{
	#category : #'button sizes',
	#'squeak_changestamp' : 'GLE 6/20/2024 17:56'
}
PEButtonBuilder >> colorPickerButtonSize [

	^ 96 @ 50
]

{
	#category : #' color buttons',
	#'squeak_changestamp' : 'GLE 7/11/2024 10:23'
}
PEButtonBuilder >> colorsForButtons [

	^ { Color lightBrown.
		 Color black. 
		 Color blue.
		 Color yellow.
		 Color red.
		 Color green.
		 Color magenta.
		 Color cyan }
]

{
	#category : #images,
	#'squeak_changestamp' : 'GT 6/10/2024 18:55'
}
PEButtonBuilder >> eraserPath [

	^ '/assets/eraser.png'
]

{
	#category : #'button sizes',
	#'squeak_changestamp' : 'LW 6/10/2024 16:02'
}
PEButtonBuilder >> settingsButtonSize [

	^ 200 @ 100
]

{
	#category : #'button sizes',
	#'squeak_changestamp' : 'GLE 7/6/2024 15:20'
}
PEButtonBuilder >> submitButtonSize [

	^ 200 @ 75
]

{
	#category : #'button sizes',
	#'squeak_changestamp' : 'GLE 6/11/2024 14:51'
}
PEButtonBuilder >> toolButtonSize [

	^ 100 @ 100
]
