Class {
	#name : #PEUserInputBuilder,
	#superclass : #PEBuilder,
	#instVars : [
		'inputFieldDictionary'
	],
	#classInstVars : [
		'userInputBuilder'
	],
	#category : #PixelEditor
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 7/6/2024 15:16'
}
PEUserInputBuilder class >> default [

	self userInputBuilder
		ifNil: [ self reset ].
	^ self userInputBuilder
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 7/6/2024 15:16'
}
PEUserInputBuilder class >> reset [

	self userInputBuilder: self new
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 7/6/2024 15:16'
}
PEUserInputBuilder class >> userInputBuilder [

	^ userInputBuilder
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 7/6/2024 15:17'
}
PEUserInputBuilder class >> userInputBuilder: aUserInputBuilder [

	^ userInputBuilder := aUserInputBuilder
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 7/6/2024 15:04'
}
PEUserInputBuilder >> createInputWindowPanel: aBuilder andModel: anInputWindow [

	| panel |
	panel := PEPanelBuilder default 
		createInputWindowPanelWithBuilder: aBuilder andModel: anInputWindow.
	anInputWindow inputFieldDictionary: self inputFieldDictionary.
	^ panel
]

{
	#category : #'file access',
	#'squeak_changestamp' : 'GLE 7/6/2024 16:48'
}
PEUserInputBuilder >> fileExists: aFileName sentFrom: aSaveButton [

	| UserInputBox |
	
	UserInputBox := UserDialogBoxMorph new
		label: 'File exists already. Do you want to replace it?';
		title: 'Saving Error';
		openInWorld.
	UserInputBox createAcceptButton action: [UserInputBox delete.
		aSaveButton writeFile: aFileName stream: (StandardFileStream forceNewFileNamed: aFileName)].
	UserInputBox createCancelButton action: [UserInputBox delete].
	
]

{
	#category : #'file access',
	#'squeak_changestamp' : 'GLE 6/22/2024 13:49'
}
PEUserInputBuilder >> fileSaverDialogWithTitle: aWindowTitle andDirectory: aDirectory [

	^ PEFileSaver new 
		windowTitle: aWindowTitle; 
		setDirectoryTo: (FileDirectory on: (FileStream fullName: aDirectory)) 
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 7/6/2024 14:23'
}
PEUserInputBuilder >> formattedAlignmentMorph [

 	^ AlignmentMorph new 
		beTransparent;
		cellPositioning: #topLeft;
		listDirection: #bottomToTop
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 7/6/2024 14:20'
}
PEUserInputBuilder >> initialize [

	super initialize.
	self inputFieldDictionary: Dictionary new

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 7/6/2024 14:09'
}
PEUserInputBuilder >> inputField [

	^ PEPluggableTextMorphPlus new 
		extent: self inputFieldSize;
		color: Color veryLightGray; 
		setText: '';
		yourself
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 7/6/2024 14:20'
}
PEUserInputBuilder >> inputFieldDictionary [

	^ inputFieldDictionary
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 7/6/2024 14:20'
}
PEUserInputBuilder >> inputFieldDictionary: aDictionary [

	inputFieldDictionary := aDictionary
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 7/6/2024 14:10'
}
PEUserInputBuilder >> inputFieldSize [

	^ 200 @ 50
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 7/6/2024 14:34'
}
PEUserInputBuilder >> inputFieldWithLabel: aLabel [

	self inputFieldDictionary at: aLabel put: self inputField.
	^ self formattedAlignmentMorph
		addMorph: (self label: aLabel);
		addMorph: (self inputFieldDictionary at: aLabel)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 7/6/2024 14:05'
}
PEUserInputBuilder >> label: aLabel [

	^ StringMorph new contents: aLabel
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 7/6/2024 16:43'
}
PEUserInputBuilder >> wrongValues [

	UserDialogBoxMorph new 
		label: 'Please use only natural numbers'; 
		openInWorld; 
		position: World center; 
		title: 'Error'; 
		createButton: 'I will comply' value: [self cascadeReceiver delete] color: Color lightOrange
]
