"
A PEGridButton is triggering the toggleGrid method in the PEPixel class.

"
Class {
	#name : #PEGridButton,
	#superclass : #PESettingsButton,
	#category : #PixelEditor,
	#'squeak_changestamp' : 'GLE 7/12/2024 11:50'
}

{
	#category : #'on click',
	#'squeak_changestamp' : 'GLE 6/7/2024 20:40'
}
PEGridButton >> doAction [

	PEPixel toggleBorderSize
]
