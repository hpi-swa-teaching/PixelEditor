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
	#'squeak_changestamp' : 'GLE 6/3/2024 20:42'
}
PEButtonRow >> addMorphCollection: aMorphCollection [

	| collection |
	
	collection := self splitCollection: aMorphCollection.
	self addMorphCollectionUpper: (collection at: 1);
		addMorphCollectionLower: (collection at: 2)
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
	#'squeak_changestamp' : 'GLE 6/3/2024 20:21'
}
PEButtonRow >> extent: anExtent [

	super extent: anExtent.
	self fitSubmorphs
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/3/2024 20:50'
}
PEButtonRow >> fitSubmorphs [

	| collection splitCollection|
	
	self submorphs do: [:each | each extent: self newExtent].
	splitCollection := self splitCollection: self submorphs.
	collection := splitCollection at: 2.
	(splitCollection at: 1) addAllFirstTo: collection. 
	self removeAllMorphs.
	self addMorphCollection: collection.
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/3/2024 20:16'
}
PEButtonRow >> initialize [

	super initialize. 
	self borderWidth: 2;
		color: Color transparent;
		submorphs: OrderedCollection new
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/3/2024 18:47'
}
PEButtonRow >> newExtent [

	^ (self topRight x - self topLeft x) / (self submorphs size / 2) @ ((self bottomLeft y - self topLeft y) / 2)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/3/2024 20:41'
}
PEButtonRow >> splitCollection: aCollection [

	| counter lowerCollection upperCollection|
	
	counter := 0.
	lowerCollection := OrderedCollection new.
	upperCollection := OrderedCollection new.
	aCollection do: [:each | counter >= (aCollection size / 2) 
		ifTrue: [upperCollection add: each]
		ifFalse: [lowerCollection add: each].
		counter := counter + 1].
	^ {	upperCollection . lowerCollection }
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/3/2024 20:16'
}
PEButtonRow >> submorphs: aCollection [

	submorphs := aCollection
]
