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
	#'squeak_changestamp' : 'GLE 5/16/2024 12:14'
}
PEScreen >> addToSaveCollection: aSubmorphCollection [

	aSubmorphCollection do: [:submorph | self savingCollection addLast: (self getRGBFrom: submorph)].
	Transcript show: self savingCollection.
	self createFile: 'hallo.txt'
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/16/2024 11:56'
}
PEScreen >> createFile [

	(StandardFileStream forceNewFileNamed: 'name.txt') nextPutAll: (self savingCollection asStringWithCr);
		close. 
	self savingCollection removeAll
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/16/2024 12:24'
}
PEScreen >> createFile: aFileName [

	| fileStream |
	
	(StandardFileStream isAFileNamed: (StandardFileStream fullName: aFileName)) 
		ifTrue: [fileStream := StandardFileStream forceNewFileNamed: aFileName.
			Transcript showln: 'file exists']
		ifFalse: [fileStream := StandardFileStream newFileNamed: aFileName].
		fileStream nextPutAll: self savingCollection asStringWithCr; 
			close.
	self savingCollection removeAll
	
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
	#'squeak_changestamp' : 'GLE 5/16/2024 10:49'
}
PEScreen >> getLayerSubmorphs [

self submorphs do: [:each | each basicType = #PELayer ifTrue: [self addToSaveCollection: each submorphs]]
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
	#'squeak_changestamp' : 'GLE 5/16/2024 10:50'
}
PEScreen >> handleKeyDown: anEvent [

	| keyDictionary key |
	key := self eventToCharacter: anEvent.
	keyDictionary := Dictionary new.
	keyDictionary at: 'x' put: #abandon.
	keyDictionary at: 's' put: #getLayerSubmorphs.
	self perform: (keyDictionary at: key ifAbsent: #doNothing)

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/16/2024 10:28'
}
PEScreen >> initialize [

	super initialize.
	self extent: World extent;
		openInWorld;
		color: Color white;
		savingCollection: OrderedCollection new
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 5/16/2024 10:25'
}
PEScreen >> savingCollection [
	^ savingCollection
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 5/16/2024 10:25'
}
PEScreen >> savingCollection: anObject [
	savingCollection := anObject
]
