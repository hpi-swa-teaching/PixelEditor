Class {
	#name : #PEScreen,
	#superclass : #Morph,
	#category : #PixelEditor
}

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
	#'squeak_changestamp' : 'GLE 5/14/2024 12:23'
}
PEScreen >> handleKeyDown: anEvent [

	| keyDictionary key |
	key := self eventToCharacter: anEvent.
	keyDictionary := Dictionary new.
	keyDictionary at: 'x' put: #abandon.
	self perform: (keyDictionary at: key ifAbsent: #doNothing)

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/14/2024 11:30'
}
PEScreen >> initialize [

	super initialize.
	self extent: World extent;
		openInWorld;
		color: Color white
]
