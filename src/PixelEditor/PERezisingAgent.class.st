Class {
	#name : #PERezisingAgent,
	#superclass : #Morph,
	#instVars : [
		'model',
		'systemWindow',
		'systemWindowBounds'
	],
	#category : #PixelEditor
}

{
	#category : #initialization,
	#'squeak_changestamp' : 'GLE 6/17/2024 19:13'
}
PERezisingAgent >> initialize [

	super initialize.
	self beTransparent
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/10/2024 16:53'
}
PERezisingAgent >> model [

	^ model
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/19/2024 22:51'
}
PERezisingAgent >> model: aModel [

	self systemWindow: aModel systemWindow.
	model := aModel.
	self startStepping
]

{
	#category : #step,
	#'squeak_changestamp' : 'GLE 6/10/2024 17:56'
}
PERezisingAgent >> step [

	self systemWindowBounds = self systemWindow bounds
		ifFalse: [self model update].
	self systemWindowBounds: self systemWindow bounds
]

{
	#category : #step,
	#'squeak_changestamp' : 'GLE 6/10/2024 18:05'
}
PERezisingAgent >> stepTime [

	^ 50
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/10/2024 16:54'
}
PERezisingAgent >> systemWindow [

	^ systemWindow
]

{
	#category : #accessing,
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
