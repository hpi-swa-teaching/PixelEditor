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
	#'squeak_changestamp' : 'GLE 5/17/2024 18:10'
}
PEButtonBuilder >> buildColorButtonRow: aScreen [
	
	aScreen addMorph: (PEButtonRow new position: PEButtonBuilder colorButtonRowPosition;
		extent: PEButtonBuilder colorButtonRowExtent)
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
	#'squeak_changestamp' : 'GLE 5/17/2024 18:09'
}
PEButtonBuilder >> buildSettingsButtonRow: aScreen [
	
	aScreen addMorph: (PEButtonRow new addMorph: (self buildSaveButton: aScreen); 
			position: PEButtonBuilder buttonRowPosition;
			extent: PEButtonBuilder buttonRowExtent)
]
