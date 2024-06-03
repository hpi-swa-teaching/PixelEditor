Class {
	#name : #PETesting,
	#superclass : #Morph,
	#category : #PixelEditor
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/3/2024 12:16'
}
PETesting >> handlesMouseDown: anEvent [

	
	^ true
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/3/2024 12:16'
}
PETesting >> handlesMouseStillDown: anEvent [

	Transcript showln: anEvent.
	^ true
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/3/2024 12:16'
}
PETesting >> initialize [

	super initialize.
	self extent: 400 @ 400;
		openInWorld
]
