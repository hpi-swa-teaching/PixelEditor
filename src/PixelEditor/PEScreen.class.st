Class {
	#name : #PEScreen,
	#superclass : #Morph,
	#instVars : [
		'savingCollection'
	],
	#category : #PixelEditor
}

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
	#'squeak_changestamp' : 'GLE 5/17/2024 14:18'
}
PEScreen >> fileExists: aFileName [

	| UserInputBox |
	
	UserInputBox := UserDialogBoxMorph new.
	UserInputBox label: 'File exists already. Do you want to replace it?';
		openInWorld.
	UserInputBox createAcceptButton action: [
		self writeFile: aFileName stream: (StandardFileStream forceNewFileNamed: aFileName).
		UserInputBox delete].
	UserInputBox createCancelButton action: [
		self savingCollection removeAll.
		UserInputBox delete]
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
	#'squeak_changestamp' : 'GLE 5/16/2024 11:04'
}
PEScreen >> getRGBFrom: aMorph [

| red blue green morphColor|
	morphColor := aMorph color.
	morphColor = Color transparent ifTrue: [^ {-1.-1.-1}].
	red := morphColor privateRed.
	blue := morphColor privateBlue.
	green := morphColor privateGreen.
	^ {red.blue.green}

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/17/2024 17:13'
}
PEScreen >> handleKeyDown: anEvent [

	| keyDictionary key |
	key := self eventToCharacter: anEvent.
	keyDictionary := Dictionary new.
	keyDictionary at: 'x' put: #abandon.
	keyDictionary at: 's' put: #save.
	self perform: (keyDictionary at: key ifAbsent: #doNothing)

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/17/2024 17:15'
}
PEScreen >> initialize [

	super initialize.
	self extent: World extent;
		openInWorld;
		color: Color white;
		savingCollection: OrderedCollection new
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/17/2024 17:13'
}
PEScreen >> save [

	| fileName |
	
	self getLayerSubmorphs.
	fileName := Project uiManager request: 'Choose a File Name'.
	fileName isEmpty 
		ifFalse: [self checkIfFileExists: '.\Testing\', fileName]
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
	#'squeak_changestamp' : 'GLE 5/17/2024 11:02'
}
PEScreen >> writeFile: aFileName stream: aFileStream [

	aFileStream nextPutAll: self savingCollection asStringWithCr; 
		close.
	self savingCollection removeAll
	
]
