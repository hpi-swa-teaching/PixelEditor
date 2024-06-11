Class {
	#name : #PEButtonBuilder,
	#superclass : #PEBuilder,
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
	#'squeak_changestamp' : 'GT 6/10/2024 19:11'
}
PEButtonBuilder >> assetHandler [

	^ GitAssetLoader for: 'PixelEditor'
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/7/2024 19:21'
}
PEButtonBuilder >> buildColorButton: aCanvas color: aColor [

	"The brush added to the end of aScreen submorphs. We can access it by calling last on the submorph 	array of aScreen"
	
	^ PEColorButton new anObject: aCanvas brush;
		extent: (PEButtonBuilder colorButtonSize);
		color: aColor;
		yourself
		
	

	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/3/2024 14:21'
}
PEButtonBuilder >> buildColorButtons: aCanvas [

	| buttonCollection |
	
	buttonCollection := OrderedCollection new.
	PEButtonBuilder colorsForButtons do: [:nextColor | 
		buttonCollection add: (self buildColorButton: aCanvas color: nextColor)].
	^  buttonCollection
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/11/2024 14:31'
}
PEButtonBuilder >> buildColorPickerButton: aCanvas [

	^PEColorPickerButton new
		beTransparent;
		borderWidth: 0;
		image: (self assetHandler loadForm: self colorBucketPath)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/11/2024 14:50'
}
PEButtonBuilder >> buildEraserButton: aCanvas [

	^PEColorButton new anObject: aCanvas brush;
		beTransparent;
		borderWidth: 0;
		extent: PEButtonBuilder toolButtonSize;
		image: (self assetHandler loadForm: self eraserPath)
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
	#'squeak_changestamp' : 'LW 6/10/2024 16:05'
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
	#'squeak_changestamp' : 'GLE 6/7/2024 20:40'
}
PEButtonBuilder >> buildSettingsButtons: aPixelEditor [
	
	^ {	self buildSaveButton: aPixelEditor. 
		self buildLoadButton: aPixelEditor. 
		self buildExportButton: aPixelEditor.
		self buildGridButton: aPixelEditor }
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/11/2024 14:32'
}
PEButtonBuilder >> buildToolButtons: aCanvas [

	^ {self buildEraserButton: aCanvas.
		self buildColorPickerButton: aCanvas}
		
		
	

	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/11/2024 14:14'
}
PEButtonBuilder >> colorBucketPath [

	^ '/assets/colorBucket.png'
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GT 6/10/2024 18:55'
}
PEButtonBuilder >> eraserPath [

	^ '/assets/eraser.png'
]
