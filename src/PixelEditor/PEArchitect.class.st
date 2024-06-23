Class {
	#name : #PEArchitect,
	#superclass : #Object,
	#classInstVars : [
		'dictionary'
	],
	#category : #'PixelEditor-Structure'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/19/2024 16:11'
}
PEArchitect class >> addFromSystemCategory: aCategory [

	(OCompletionTable default classesInCategory: aCategory) do: [:each | self addToDictionary: each].
	self dictionary inspect
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/20/2024 17:50'
}
PEArchitect class >> addToDictionary: aClass [

	| collection |
	
	collection := Set new.
	(SystemNavigation allCallsOnClass: aClass) do: [:each | collection add: each classSymbol].
	self dictionary at: aClass class put: collection
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/19/2024 16:06'
}
PEArchitect class >> dictionary [

	dictionary ifNil: [ self resetDictionary ].
	^ dictionary
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/19/2024 16:06'
}
PEArchitect class >> resetDictionary [

	dictionary := Dictionary new
]
