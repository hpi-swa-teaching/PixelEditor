Class {
	#name : #PEButtonRow,
	#superclass : #PEUI,
	#instVars : [
		'yCoordinate'
	],
	#category : #PixelEditor
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/3/2024 18:33'
}
PEButtonRow >> addMorphBelow: aMorph [

	self submorphs isEmpty
		ifTrue: [self addMorph: aMorph] 
		ifFalse: [self addMorphBack: (aMorph position: 0 @ (self submorphs last bottomRight y))] 
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/3/2024 18:27'
}
PEButtonRow >> addMorphCollection: aMorphCollection [

	| counter lowerCollection upperCollection|
	counter := 0.
	lowerCollection := OrderedCollection new.
	upperCollection := OrderedCollection new.
	aMorphCollection do: [:each | counter >= (aMorphCollection size / 2) 
		ifTrue: [upperCollection add: each]
		ifFalse: [lowerCollection add: each].
		counter := counter + 1].
	self addMorphCollectionUpper: upperCollection;
		addMorphCollectionLower: lowerCollection
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/3/2024 18:29'
}
PEButtonRow >> addMorphCollectionLower: aMorphCollection [

	| counter upperMorph |
	
	counter := 1.
	aMorphCollection do: [:each | upperMorph := self submorphs at: counter.
		self addMorphBack: (each position: (upperMorph bottomLeft x) @ (upperMorph bottomLeft y)).
		counter := counter + 1]
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/3/2024 18:18'
}
PEButtonRow >> addMorphCollectionUpper: aMorphCollection [

	aMorphCollection do: [:each | self addMorphNext: each].

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/3/2024 18:58'
}
PEButtonRow >> addMorphNext: aMorph [

	self submorphs isEmpty
		ifTrue: [self addMorph: (aMorph position: self position)] 
		ifFalse: [self addMorphBack: (aMorph position: (self submorphs last bottomRight x) @ self position y)] 
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/3/2024 18:59'
}
PEButtonRow >> extent: anExtent [

	super extent: anExtent.
	self fitSubmorphs
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/3/2024 18:53'
}
PEButtonRow >> fitSubmorphs [

	| collection |
	
	self submorphs do: [:each | each extent: self newExtent].
	collection := self submorphs.
	self removeAllMorphs.
	self addMorphCollection: collection.
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/3/2024 16:46'
}
PEButtonRow >> initialize [

	super initialize. 
	self borderWidth: 2;
		color: Color transparent;
		yCoordinate: 0
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/3/2024 18:47'
}
PEButtonRow >> newExtent [

	^ (self topRight x - self topLeft x) / (self submorphs size / 2) @ ((self bottomLeft y - self topLeft y) / 2)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/3/2024 16:46'
}
PEButtonRow >> yCoordinate [
	^ yCoordinate
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/3/2024 16:46'
}
PEButtonRow >> yCoordinate: anObject [
	yCoordinate := anObject
]
