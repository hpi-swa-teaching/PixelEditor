Class {
	#name : #PEButtonRow,
	#superclass : #PEUI,
	#category : #PixelEditor
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/17/2024 18:54'
}
PEButtonRow >> addMorphBelow: aMorph [

	self submorphs isEmpty
		ifTrue: [self addMorph: aMorph] 
		ifFalse: [self addMorphBack: (aMorph position: 0 @ (self submorphs last bounds corner y))] 
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/17/2024 18:53'
}
PEButtonRow >> addMorphNext: aMorph [

	self submorphs isEmpty
		ifTrue: [self addMorph: aMorph] 
		ifFalse: [self addMorphBack: (aMorph position: (self submorphs last bounds corner x) @ 0)] 
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GT 5/20/2024 15:35'
}
PEButtonRow >> initialize [

	super initialize. 
	self borderWidth: 2;
		color: Color transparent
]
