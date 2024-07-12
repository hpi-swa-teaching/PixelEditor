"
A PERezisingAgent is comparing the previous saved size of the PixelEditor's window to the current size. If it has changed it sends the update method to PixelEditor which in turn sends it to the PEButtonRows which then layout their submorphs accordingly.

Instance Variables
	model:						type: PixelEditor new
	systemWindow:			type: PluggableSystemWindow new
	systemWindowBounds:	type:  Bounds new

model
	- We save the PixelEditor to send the update method to.

systemWindow
	- We save the systemWindow to get the windows bounds.

systemWindowBounds
	- We save the old bounds to compare it to the current bounds.

"
Class {
	#name : #PERezisingAgent,
	#superclass : #Morph,
	#instVars : [
		'model',
		'systemWindow',
		'systemWindowBounds'
	],
	#category : #PixelEditor,
	#'squeak_changestamp' : 'GLE 7/12/2024 11:45'
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
	#'squeak_changestamp' : 'GLE 7/7/2024 18:12'
}
PERezisingAgent >> step [

	self systemWindowBounds = self systemWindow bounds
		ifFalse: [ self model update ].
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
	#'squeak_changestamp' : 'GLE 7/7/2024 18:13'
}
PERezisingAgent >> systemWindowBounds: windowBounds [

	systemWindowBounds := windowBounds
]
