Class {
	#name : #PEButton,
	#superclass : #PEUI,
	#instVars : [
		'actionLeft',
		'actionRight',
		'anObject'
	],
	#category : #PixelEditor
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/17/2024 17:43'
}
PEButton class >> buttonBorderSize [

	^ 1
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 5/17/2024 15:04'
}
PEButton >> actionLeft [

	^ actionLeft
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 5/17/2024 15:04'
}
PEButton >> actionLeft: aCodeBlock [

	actionLeft := aCodeBlock
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 5/17/2024 15:05'
}
PEButton >> actionRight [

	^ actionRight
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 5/17/2024 15:04'
}
PEButton >> actionRight: aCodeBlock [

	actionRight := aCodeBlock
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 5/17/2024 14:49'
}
PEButton >> anObject [

	^ anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 5/17/2024 14:49'
}
PEButton >> anObject: aObject [

	anObject := aObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/17/2024 15:05'
}
PEButton >> doActionLeft [

	self anObject perform: self actionLeft
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/17/2024 15:05'
}
PEButton >> doActionRight [

	self anObject perform: self actionRight
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/17/2024 14:57'
}
PEButton >> handlesMouseDown: anEvent [

	^ true
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/17/2024 17:44'
}
PEButton >> initialize [
	
	super initialize.
	self color: Color transparent;
		borderColor: Color black;
		borderWidth: PEButton buttonBorderSize
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/17/2024 17:50'
}
PEButton >> label: aString [

	self addMorph: (PEButtonText new contents: aString;
		center: self center;
		yourself)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/17/2024 15:08'
}
PEButton >> mouseDown: anEvent [

	anEvent redButtonPressed ifTrue: [self doActionLeft].
	anEvent yellowButtonPressed ifTrue: [self doActionRight]
]
