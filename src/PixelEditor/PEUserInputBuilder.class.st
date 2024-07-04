Class {
	#name : #PEUserInputBuilder,
	#superclass : #PEBuilder,
	#classInstVars : [
		'userInputBuilder'
	],
	#category : #PixelEditor
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/20/2024 12:07'
}
PEUserInputBuilder class >> default [

	userInputBuilder
		ifNil: [ userInputBuilder := PEUserInputBuilder new ].
	^ userInputBuilder
]

{
	#category : #'file access',
	#'squeak_changestamp' : 'LW 7/4/2024 11:38'
}
PEUserInputBuilder >> createInputWindowPanel: aBuilder andModel: anInputWindow [

	^ PEPanelBuilder default 
		createInputWindowPanelWithBuilder: aBuilder andModel: anInputWindow
]

{
	#category : #'file access',
	#'squeak_changestamp' : 'GLE 6/22/2024 13:28'
}
PEUserInputBuilder >> fileExists: aFileName sentFrom: aSaveButton [

	| UserInputBox |
	
	UserInputBox := UserDialogBoxMorph new.
	UserInputBox 
		label: 'File exists already. Do you want to replace it?';
		openInWorld.
	UserInputBox createAcceptButton action: [UserInputBox delete.
		aSaveButton writeFile: aFileName stream: (StandardFileStream forceNewFileNamed: aFileName)].
	UserInputBox createCancelButton action: [UserInputBox delete]
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
