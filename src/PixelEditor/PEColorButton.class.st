Class {
	#name : #PEColorButton,
	#superclass : #PEUI,
	#instVars : [
		'anObject'
	],
	#classInstVars : [
		'selectedButton'
	],
	#category : #PixelEditor
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/17/2024 14:55'
}
PEColorButton class >> borderColor [

	^ Color black
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/17/2024 19:37'
}
PEColorButton class >> borderSize [

	^ 1
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/11/2024 14:16'
}
PEColorButton class >> selectedButton [

	^ selectedButton
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/11/2024 14:16'
}
PEColorButton class >> selectedButton: aButton [

	selectedButton := aButton
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/17/2024 14:49'
}
PEColorButton >> anObject [

	^ anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/17/2024 14:49'
}
PEColorButton >> anObject: aObject [

	anObject := aObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/11/2024 14:16'
}
PEColorButton >> doActionLeft [

	self anObject changeSelectedColor: self color.
	PEColorButton selectedButton: self.
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/27/2024 10:56'
}
PEColorButton >> doActionRight [

	self anObject changeButtonColor: self

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/17/2024 14:57'
}
PEColorButton >> handlesMouseDown: anEvent [

	^ true
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GT 6/10/2024 19:11'
}
PEColorButton >> image: anImage [

	self addMorph: (ImageMorph new image: anImage;
		position: self position;
		yourself)
	

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/27/2024 10:47'
}
PEColorButton >> initialize [
	
	super initialize.
	self borderColor: PEColorButton borderColor;
		borderWidth: PEColorButton borderSize.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/27/2024 10:54'
}
PEColorButton >> mouseDown: anEvent [

	anEvent yellowButtonPressed ifTrue: [self doActionRight].
	anEvent redButtonPressed ifTrue: [self doActionLeft]
]
