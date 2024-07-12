"
A PEArchitect is used to find dependencies between classes.
Call "" PEArchitect addFromSystemCategory: 'The Package you want to test' "" to get the dependencies.

Instance Variables

"
Class {
	#name : #PEArchitect,
	#superclass : #Object,
	#classInstVars : [
		'dictionary'
	],
	#category : #'PixelEditor-Structure',
	#'squeak_changestamp' : 'GLE 7/12/2024 10:55'
}

{
	#category : #'find dependencies',
	#'squeak_changestamp' : 'GLE 7/11/2024 11:44'
}
PEArchitect class >> addFromSystemCategory: aCategory [

	(OCompletionTable default classesInCategory: aCategory) do: [:each | self addToDictionary: each ].
	self dictionary inspect
]

{
	#category : #'find dependencies',
	#'squeak_changestamp' : 'GLE 7/11/2024 11:45'
}
PEArchitect class >> addToDictionary: aClass [

	| collection |
	
	collection := Set new.
	(SystemNavigation allCallsOnClass: aClass) do: [:each | collection add: each classSymbol ].
	self dictionary at: aClass class put: collection
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/19/2024 16:06'
}
PEArchitect class >> dictionary [

	dictionary ifNil: [ self resetDictionary ].
	^ dictionary
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/19/2024 16:06'
}
PEArchitect class >> resetDictionary [

	dictionary := Dictionary new
]
