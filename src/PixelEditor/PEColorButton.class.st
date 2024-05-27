Class {
	#name : #PEColorButton,

	#superclass : #PEUI,
	#instVars : [
		'actionRight',
		'actionLeft',
		'anObject'
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
	#category : #'as yet unclassified',

	#'squeak_changestamp' : 'GLE 5/17/2024 15:04'
}
PEColorButton >> actionLeft [

	^ actionLeft
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/17/2024 15:04'
}
PEColorButton >> actionLeft: aCodeBlock [

	actionLeft := aCodeBlock
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/17/2024 15:05'
}
PEColorButton >> actionRight [

	^ actionRight
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/17/2024 15:04'
}
PEColorButton >> actionRight: aCodeBlock [

	actionRight := aCodeBlock
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
	#'squeak_changestamp' : 'GLE 5/27/2024 10:56'
}
PEColorButton >> doActionLeft [

	self anObject changeSelectedColor: self color
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
