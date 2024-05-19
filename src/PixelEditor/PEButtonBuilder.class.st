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
	#'squeak_changestamp' : 'GLE 5/17/2024 19:45'
}
PEButtonBuilder class >> colorsForButtons [

	^ {Color transparent.
		Color black. 
		Color blue.
		Color yellow.
		Color red.
		Color green}
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
	#'squeak_changestamp' : 'GLE 5/17/2024 19:36'
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
	#'squeak_changestamp' : 'GLE 5/17/2024 17:48'
}
PEButtonBuilder >> buildSaveButton: aScreen [

	
	^ PEButton new anObject: aScreen;
		actionLeft: #save;
		extent: (PEButtonBuilder saveButtonSize);
		label: 'Save';
		yourself

		
		
	

	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/17/2024 19:53'
}
PEButtonBuilder >> buildSettingsButtonRow: aScreen [
	
	aScreen addMorph: (PEButtonRow new addMorphNext: (self buildSaveButton: aScreen);
		position: PEButtonBuilder buttonRowPosition;
		extent: PEButtonBuilder buttonRowExtent)
]
