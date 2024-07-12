"
A PEFileSaver is a FileSaverDialog with a custom title.

Instance Variables
	windowTitle:		String new

windowTitle
	- Is used to set the title of the FileSaverDialog.

"
Class {
	#name : #PEFileSaver,
	#superclass : #FileSaverDialog,
	#instVars : [
		'windowTitle'
	],
	#category : #PixelEditor,
	#'squeak_changestamp' : 'GLE 7/12/2024 11:12'
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
