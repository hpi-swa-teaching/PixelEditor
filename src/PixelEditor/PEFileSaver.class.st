Class {
	#name : #PEFileSaver,
	#superclass : #FileSaverDialog,
	#instVars : [
		'windowTitle'
	],
	#category : #PixelEditor
}

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
