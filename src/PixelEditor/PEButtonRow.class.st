"
A PEButtonRow is a container that holds mostly buttons and computes the correct layout and size of its submorphs when its bounds change.


"
Class {
	#name : #PEButtonRow,
	#superclass : #PEUI,
	#category : #PixelEditor,
	#'squeak_changestamp' : 'GLE 7/12/2024 11:56'
}

{
	#category : #submorphs,
	#'squeak_changestamp' : 'GLE 7/7/2024 18:16'
}
PEButtonRow >> addMorphBelow: aMorph [

	self submorphs isEmpty
		ifTrue: [ self addMorph: aMorph ] 
		ifFalse: [ self addMorphBack: (aMorph position: 0 @ (self submorphs last bottomRight y)) ] 
]

{
	#category : #submorphs,
	#'squeak_changestamp' : 'GLE 7/11/2024 10:13'
}
PEButtonRow >> addMorphCollection: aMorphCollection [

	| dictionary symbol |
	
	dictionary := Dictionary new.
	dictionary 
		at: 1 put: #addOneMorph:;
		at: 2 put: #addTwoMorphs:.
	symbol := dictionary at: aMorphCollection size ifAbsent: #addMorphCollectionAsSubmorphs:.
	self perform: symbol with: aMorphCollection
]

{
	#category : #submorphs,
	#'squeak_changestamp' : 'GLE 6/17/2024 20:40'
}
PEButtonRow >> addMorphCollectionAsSubmorphs: aMorphCollection [

	| collection |
	
	collection := self splitCollection: aMorphCollection.
	self addMorphCollectionUpper: (collection at: 1);
		addMorphCollectionLower: (collection at: 2)
]

{
	#category : #submorphs,
	#'squeak_changestamp' : 'GLE 7/7/2024 18:17'
}
PEButtonRow >> addMorphCollectionLower: aMorphCollection [

	| counter upperMorph |
	
	counter := 1.
	aMorphCollection do: [:each | 
		upperMorph := self submorphs at: counter.
		self addMorphBack: (each position: (upperMorph bottomLeft x) @ (upperMorph bottomLeft y)).
		counter := counter + 1 ]
]

{
	#category : #submorphs,
	#'squeak_changestamp' : 'GLE 7/11/2024 10:13'
}
PEButtonRow >> addMorphCollectionUpper: aMorphCollection [

	aMorphCollection do: [:each | self addMorphNext: each ]

]

{
	#category : #submorphs,
	#'squeak_changestamp' : 'GLE 7/7/2024 18:18'
}
PEButtonRow >> addMorphNext: aMorph [

	self submorphs isEmpty
		ifTrue: [self addMorph: (aMorph position: self position) ] 
		ifFalse: [ 
			self addMorphBack: (aMorph position: (self submorphs last bottomRight x) @ self position y) ] 
]

{
	#category : #submorphs,
	#'squeak_changestamp' : 'GLE 6/17/2024 20:51'
}
PEButtonRow >> addOneMorph: aMorphCollection [

	self addMorph: aMorphCollection first
]

{
	#category : #submorphs,
	#'squeak_changestamp' : 'GLE 7/7/2024 18:18'
}
PEButtonRow >> addTwoMorphs: aMorphCollection [

	aMorphCollection do: [:each | 
		self addMorphNext: each.
		each extent: self extent x / 2 @ self extent y ]
]

{
	#category : #'update cycle',
	#'squeak_changestamp' : 'GLE 6/3/2024 20:21'
}
PEButtonRow >> extent: anExtent [

	super extent: anExtent.
	self fitSubmorphs
]

{
	#category : #submorphs,
	#'squeak_changestamp' : 'GLE 7/7/2024 18:19'
}
PEButtonRow >> fitSubmorphs [

	| collection splitCollection|
	
	self submorphs do: [:each | each extent: self newExtent].
	self submorphs size <= 2
		ifTrue: [ collection := self submorphs ]
		ifFalse: [ splitCollection := self splitCollection: self submorphs.
			collection := splitCollection last.
			(splitCollection first) addAllFirstTo: collection ].
	self removeAllMorphs.
	self addMorphCollection: collection
]

{
	#category : #initialize,
	#'squeak_changestamp' : 'GLE 6/22/2024 14:03'
}
PEButtonRow >> initialize [

	super initialize. 
	self 
		borderWidth: 2;
		beTransparent
]

{
	#category : #'update cycle',
	#'squeak_changestamp' : 'GLE 6/16/2024 19:11'
}
PEButtonRow >> newExtent [

	^ (self topRight x - self topLeft x) / (self submorphs size / 2) @ ((self bottomLeft y - self topLeft y) / 2)
]

{
	#category : #submorphs,
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
	#category : #'update cycle',
	#'squeak_changestamp' : 'GLE 6/21/2024 09:58'
}
PEButtonRow >> update [

	self extent: self owner extent
]
