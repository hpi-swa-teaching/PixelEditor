Class {
	#name : #PEButtonWorks,
	#superclass : #PEUI,
	#instVars : [
		'actionLeft',
		'actionRight',
		'anObject',
		'labelText'
	],
	#category : #PixelEditor
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/17/2024 17:43'
}
PEButtonWorks class >> buttonBorderSize [

	^ 1
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 5/17/2024 15:04'
}
PEButtonWorks >> actionLeft [

	^ actionLeft
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 5/17/2024 15:04'
}
PEButtonWorks >> actionLeft: aCodeBlock [

	actionLeft := aCodeBlock
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 5/17/2024 15:05'
}
PEButtonWorks >> actionRight [

	^ actionRight
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 5/17/2024 15:04'
}
PEButtonWorks >> actionRight: aCodeBlock [

	actionRight := aCodeBlock
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 5/17/2024 14:49'
}
PEButtonWorks >> anObject [

	^ anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 5/17/2024 14:49'
}
PEButtonWorks >> anObject: aObject [

	anObject := aObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 5/24/2024 23:24'
}
PEButtonWorks >> doActionLeft [

	"self arguments 
		ifNil: ["self anObject perform: self actionLeft"]
		ifNotNil: [self anObject perform: self actionLeft withArguments: self arguments]"
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 5/24/2024 23:25'
}
PEButtonWorks >> doActionRight [

	"self arguments 
		ifNil: ["self anObject perform: self actionRight"] 
		ifNotNil: [self anObject perform: self actionRight withArguments: self arguments]"
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/17/2024 14:57'
}
PEButtonWorks >> handlesMouseDown: anEvent [

	^ true
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/17/2024 17:44'
}
PEButtonWorks >> initialize [
	
	super initialize.
	self color: Color transparent;
		borderColor: Color black;
		borderWidth: PEButton buttonBorderSize
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 5/24/2024 23:24'
}
PEButtonWorks >> label: aString [

	label := (PEButtonText new contents: aString;
		center: self center;
		yourself).
	self addMorph: label
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 5/24/2024 23:23'
}
PEButtonWorks >> labelText [

	^ labelText
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/17/2024 15:08'
}
PEButtonWorks >> mouseDown: anEvent [

	anEvent redButtonPressed ifTrue: [self doActionLeft].
	anEvent yellowButtonPressed ifTrue: [self doActionRight]
]
