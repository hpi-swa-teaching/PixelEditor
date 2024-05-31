Class {
	#name : #PEScreen,
	#superclass : #Morph,
	#instVars : [
		'savingCollection',
		'jsonString',
		'pixelID'
	],
	#category : #PixelEditor
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/31/2024 13:31'
}
PEScreen >> addToJson [
	
	self jsonString: self jsonString, ('"width" : "', PECanvas pixelGridWidth, ' ", ').
	self jsonString: self jsonString, ('"height" : "', PECanvas pixelGridHeight, ' ", ').
	self jsonString: self jsonString, ('"pixelSize" : "', PEPixel pixelSize, ' " ').
	self submorphs do: [:each | each basicType = #PELayer 
		ifTrue: [self addToJsonString: each submorphs]]
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/31/2024 18:59'
}
PEScreen >> addToJsonString: aCollection [

	| pixelID |
	pixelID := 1.
	aCollection do: [:each | 
		self jsonString: (self jsonString, ', "', pixelID, '" : ', (self colorForJson: each color)).
		pixelID := pixelID + 1]
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/17/2024 10:42'
}
PEScreen >> addToSaveCollection: aSubmorphCollection [

	aSubmorphCollection do: [:submorph | self savingCollection addLast: (self getRGBFrom: submorph)].
	self savingCollection addLast: '!'
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/17/2024 14:18'
}
PEScreen >> checkIfFileExists: aFileName [
	
	(StandardFileStream isAFileNamed: (StandardFileStream fullName: aFileName)) 
		ifFalse: [self writeFile: aFileName stream: (StandardFileStream newFileNamed: aFileName)]
		ifTrue: [self fileExists: aFileName]
	
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/31/2024 19:04'
}
PEScreen >> colorForJson: aColor [

	| stringRed stringGreen stringBlue |
	aColor = Color transparent ifTrue: [^ '"#r# : #-1#"'].
	stringRed := '"#r# : #', aColor privateRed, '#'.
	stringGreen :=  ', #g# : #', aColor privateGreen, '#'. 
	stringBlue := ', #b# : #', aColor privateBlue, '#"'.
	^ stringRed, stringGreen, stringBlue
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/14/2024 12:23'
}
PEScreen >> doNothing [

	"Nothing"
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/14/2024 11:33'
}
PEScreen >> eventToCharacter: anEvent [ 
 
	^ anEvent keyCharacter asString asLowercase
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/31/2024 11:07'
}
PEScreen >> fileExists: aFileName [

	| UserInputBox |
	
	UserInputBox := UserDialogBoxMorph new.
	UserInputBox label: 'File exists already. Do you want to replace it?';
		openInWorld;
		position: self center.
	UserInputBox createAcceptButton action: [
		self writeFile: aFileName stream: (StandardFileStream forceNewFileNamed: aFileName).
		UserInputBox delete].
	UserInputBox createCancelButton action: [UserInputBox delete]
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/17/2024 17:13'
}
PEScreen >> getLayerSubmorphs [

	self submorphs do: [:each | each basicType = #PELayer 
		ifTrue: [self addToSaveCollection: each submorphs]]
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/17/2024 20:49'
}
PEScreen >> getRGBFrom: aMorph [

| red blue green morphColor alpha |
	morphColor := aMorph color.
	morphColor = Color transparent ifTrue: [^ {-1.-1.-1.0}].
	red := morphColor privateRed.
	blue := morphColor privateBlue.
	green := morphColor privateGreen.
	alpha := morphColor alpha.
	^ {red.blue.green.alpha}

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/31/2024 12:11'
}
PEScreen >> handleKeyDown: anEvent [

	| keyDictionary key |
	key := self eventToCharacter: anEvent.
	keyDictionary := Dictionary new.
	keyDictionary at: 'x' put: #abandon.
	keyDictionary at: 's' put: #save.
	keyDictionary at: 'l' put: #load.
	self perform: (keyDictionary at: key ifAbsent: #doNothing)

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/17/2024 20:47'
}
PEScreen >> handlesMouseDown: anEvent [

	^ true
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/31/2024 19:00'
}
PEScreen >> initialize [

	super initialize.
	self extent: World extent;
		openInWorld;
		color: Color white;
		savingCollection: OrderedCollection new;
		jsonString: String new
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 5/31/2024 11:29'
}
PEScreen >> jsonString [

	^ jsonString
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 5/31/2024 11:29'
}
PEScreen >> jsonString: anObject [

	jsonString := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/31/2024 15:35'
}
PEScreen >> load [
	
	| fileName |
	
	fileName := Project uiManager request: 'Choose a File Name'.
	PEBuilder new buildPixelEditorWithJson: (self loadFile: '.\Saved-Images\', fileName).
	self abandon.
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/31/2024 16:06'
}
PEScreen >> loadFile: afileName [
	
	^ Json readFromString: (self stringFromStream: (StandardFileStream oldFileNamed: afileName))
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/17/2024 20:47'
}
PEScreen >> mouseDown: anEvent [

	self doNothing
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/31/2024 11:29'
}
PEScreen >> save [

	| fileName |
	
	fileName := Project uiManager request: 'Choose a File Name'.
	fileName isEmpty 
		ifFalse: [self checkIfFileExists: '.\Saved-Images\', fileName]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 5/17/2024 11:07'
}
PEScreen >> savingCollection [

	^ savingCollection
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 5/17/2024 11:07'
}
PEScreen >> savingCollection: anObject [

	savingCollection := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/31/2024 13:26'
}
PEScreen >> stringFromStream: aStream [

	| string |
	
	string := '{'.
	[aStream atEnd] whileFalse: [string := string, aStream next].
	^ string, '}'
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/31/2024 19:00'
}
PEScreen >> writeFile: aFileName stream: aFileStream [

	self addToJson.
	aFileStream nextPutAll: self jsonString; 
		close.
	self jsonString: ''
	
]
