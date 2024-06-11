Class {
	#name : #PESettingsButton,
	#superclass : #PluggableButtonMorph,
	#instVars : [
		'jsonString'
	],
	#category : #PixelEditor
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/4/2024 00:58'
}
PESettingsButton >> addToJson [
	
	self jsonString: self jsonString, ('"width" : "', PECanvas pixelGridWidth, ' ", ').
	self jsonString: self jsonString, ('"height" : "', PECanvas pixelGridHeight, ' ", ').
	self jsonString: self jsonString, ('"pixelSize" : "', PEPixel pixelSize, ' " ').
	self target canvas submorphs do: [:each | each basicType = #PELayer 
		ifTrue: [self addToJsonString: each submorphs]]
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/4/2024 00:41'
}
PESettingsButton >> addToJsonString: aCollection [

	| pixelID |
	pixelID := 1.
	aCollection do: [:each | 
		self jsonString: (self jsonString, ', "', pixelID, '" : ', (self colorForJson: each color)).
		pixelID := pixelID + 1]
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/6/2024 18:52'
}
PESettingsButton >> checkIfFileExists: aFileName [
	
	(StandardFileStream isAFileNamed: (StandardFileStream fullName: aFileName))
		ifTrue: [self fileExists: aFileName]
		ifFalse: [self writeFile: aFileName stream: (StandardFileStream newFileNamed: aFileName)]
		
	
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/4/2024 00:41'
}
PESettingsButton >> colorForJson: aColor [

	| stringRed stringGreen stringBlue |
	aColor = Color transparent ifTrue: [^ '"#r# : #-1#"'].
	stringRed := '"#r# : #', aColor privateRed, '#'.
	stringGreen :=  ', #g# : #', aColor privateGreen, '#'. 
	stringBlue := ', #b# : #', aColor privateBlue, '#"'.
	^ stringRed, stringGreen, stringBlue
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/4/2024 00:41'
}
PESettingsButton >> doNothing [

	"Nothing"
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/4/2024 01:22'
}
PESettingsButton >> fileExists: aFileName [

	| UserInputBox |
	
	UserInputBox := UserDialogBoxMorph new.
	UserInputBox label: 'File exists already. Do you want to replace it?';
		openInWorld.
	UserInputBox createAcceptButton action: [
		self writeFile: aFileName stream: (StandardFileStream forceNewFileNamed: aFileName).
		UserInputBox delete].
	UserInputBox createCancelButton action: [UserInputBox delete]
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/4/2024 00:55'
}
PESettingsButton >> initialize [

	super initialize.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/4/2024 00:54'
}
PESettingsButton >> jsonString [

	^ self target jsonString
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/4/2024 00:54'
}
PESettingsButton >> jsonString: anObject [

	self target jsonString: anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/7/2024 17:26'
}
PESettingsButton >> load [
	
	| fileName |
	
	fileName := PEFileSaver new windowTitle: 'Load File'; 
		setDirectoryTo: (FileDirectory on: (FileStream fullName: 'Saved-Images' ));
		getUserResponse.
	fileName isNil ifFalse: [
		PEBuilder new buildPixelEditorWithJson: (self loadFile: fileName).
		self target systemWindow abandon]
	
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/4/2024 00:43'
}
PESettingsButton >> loadFile: afileName [
	
	^ Json readFromString: (self stringFromStream: (StandardFileStream oldFileNamed: afileName))
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/4/2024 00:53'
}
PESettingsButton >> mouseDown: anEvent [

	self doAction
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/4/2024 00:43'
}
PESettingsButton >> save [

	| fileName |
	
	fileName := PEFileSaver new getUserResponse.
	fileName isNil
		ifFalse: [self checkIfFileExists: fileName]
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/4/2024 00:43'
}
PESettingsButton >> stringFromStream: aStream [

	| string |
	
	string := '{'.
	[aStream atEnd] whileFalse: [string := string, aStream next].
	^ string, '}'
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/4/2024 00:43'
}
PESettingsButton >> writeFile: aFileName stream: aFileStream [

	self addToJson.
	aFileStream nextPutAll: self jsonString; 
		close.
	self jsonString: ''
	
]
