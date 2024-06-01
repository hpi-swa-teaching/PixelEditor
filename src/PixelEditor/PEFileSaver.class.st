Class {
	#name : #PEFileSaver,
	#superclass : #FileSaverDialog,
	#instVars : [
		'windowTitle'
	],
	#category : #PixelEditor
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/1/2024 12:27'
}
PEFileSaver >> initialize [

	super initialize.
	self windowTitle: 'Save File'
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/1/2024 12:27'
}
PEFileSaver >> windowTitle [

	^ windowTitle translated
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/1/2024 12:28'
}
PEFileSaver >> windowTitle: aString [

	windowTitle := aString
]
