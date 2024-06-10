Class {
	#name : #PERezisingAgent,
	#superclass : #PEUI,
	#instVars : [
		'model',
		'systemWindow',
		'systemWindowBounds'
	],
	#category : #PixelEditor
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/10/2024 17:59'
}
PERezisingAgent >> initialize [

	super initialize.
	self beTransparent
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/10/2024 16:53'
}
PERezisingAgent >> model [

	^ model
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/10/2024 17:59'
}
PERezisingAgent >> model: aModel [

	self systemWindow: aModel systemWindow .
	model := aModel.
	self startStepping
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/10/2024 17:56'
}
PERezisingAgent >> step [

	self systemWindowBounds = self systemWindow bounds
		ifFalse: [self model update].
	self systemWindowBounds: self systemWindow bounds
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/10/2024 18:05'
}
PERezisingAgent >> stepTime [

	^ 50
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/10/2024 16:54'
}
PERezisingAgent >> systemWindow [

	^ systemWindow
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/10/2024 16:54'
}
PERezisingAgent >> systemWindow: aSystemWindow [

	systemWindow := aSystemWindow
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/10/2024 16:56'
}
PERezisingAgent >> systemWindowBounds [

	^ systemWindowBounds
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/10/2024 16:56'
}
PERezisingAgent >> systemWindowBounds: anObject [

	systemWindowBounds := anObject
]
