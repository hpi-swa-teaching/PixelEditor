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
	#'squeak_changestamp' : 'GT 5/20/2024 18:43'
}
PEButtonBuilder class >> colorsForButtons [

	^ {Color transparent.
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
	#'squeak_changestamp' : 'GLE 5/17/2024 17:38'
}
PEButtonBuilder class >> saveButtonSize [

	^ 80 @ 50
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/17/2024 18:09'
}
PEButtonBuilder >> buildButtonRows: aScreen [

	self buildSettingsButtonRow: aScreen;
		buildColorButtonRow: aScreen
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/27/2024 10:57'
}
PEButtonBuilder >> buildColorButton: aScreen color: aColor [

	"The brush added to the end of aScreen submorphs. We can access it by calling last on the submorph 	array of aScreen"
	
	^ PEColorButton new anObject: aScreen submorphs last;
		extent: (PEButtonBuilder colorButtonSize);
		color: aColor;
		yourself
		
	

	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/17/2024 19:43'
}
PEButtonBuilder >> buildColorButtonRow: aScreen [
	
	| buttonRow |
	
	buttonRow := PEButtonRow new. 
	PEButtonBuilder colorsForButtons do: [:nextColor | 
		buttonRow addMorphBelow: (self buildColorButton: aScreen color: nextColor)].
	buttonRow position: PEButtonBuilder colorButtonRowPosition;
		extent: PEButtonBuilder colorButtonRowExtent.
	aScreen addMorph: buttonRow
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
	#'squeak_changestamp' : 'GLE 6/3/2024 14:19'
}
PEButtonBuilder >> buildColorButtons: aCanvas color: aColor [

	"The brush added to the end of aScreen submorphs. We can access it by calling last on the submorph 	array of aScreen"
	
	^ PEColorButton new anObject: aCanvas submorphs last;
		extent: (PEButtonBuilder colorButtonSize);
		color: aColor;
		yourself
		
	

	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/6/2024 19:14'
}
PEButtonBuilder >> buildExportButton: aPixelEditor [

	^ PEExportButton new target: aPixelEditor;
		label: 'Export';
		extent: (PEButtonBuilder saveButtonSize);
		yourself

		
		
	

	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/6/2024 19:14'
}
PEButtonBuilder >> buildSaveButton: aPixelEditor [

	^ PESaveButton new target: aPixelEditor;
		label: 'Save';
		extent: (PEButtonBuilder saveButtonSize);
		yourself

		
		
	

	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/1/2024 12:00'
}
PEButtonBuilder >> buildSettingsButtonRow: aScreen [
	
	aScreen addMorph: (PEButtonRow new extent: PEButtonBuilder buttonRowExtent;
		addMorphNext: (self buildSaveButton: aScreen);
		addMorphNext: (self buildloadButton: aScreen);
		position: PEButtonBuilder buttonRowPosition)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/6/2024 19:15'
}
PEButtonBuilder >> buildSettingsButtons: aPixelEditor [
	
	^ {	self buildSaveButton: aPixelEditor . 
		self buildloadButton: aPixelEditor . 
		self buildExportButton: aPixelEditor }
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/6/2024 19:13'
}
PEButtonBuilder >> buildloadButton: aPixelEditor [

	^ PELoadButton new target: aPixelEditor;
		label: 'Load';
		extent: (PEButtonBuilder saveButtonSize);
		yourself

		
		
	

	
]
