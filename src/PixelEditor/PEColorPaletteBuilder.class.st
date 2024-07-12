"
A PEColorPaletteBuilder is building the PEColorPalette, which consists of an HSVMorph, an accept button and a cancel button.

Instance Variables

"
Class {
	#name : #PEColorPaletteBuilder,
	#superclass : #PEBuilder,
	#classInstVars : [
		'colorSelectorBuilder'
	],
	#category : #PixelEditor,
	#'squeak_changestamp' : 'GLE 7/12/2024 11:02'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 7/6/2024 15:14'
}
PEColorPaletteBuilder class >> colorSelectorBuilder [

	^ colorSelectorBuilder
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 7/6/2024 15:14'
}
PEColorPaletteBuilder class >> colorSelectorBuilder: aColorSelector [

	^ colorSelectorBuilder := aColorSelector
]

{
	#category : #initialize,
	#'squeak_changestamp' : 'GLE 7/6/2024 15:15'
}
PEColorPaletteBuilder class >> default [

	self colorSelectorBuilder
		ifNil: [ self reset ].
	^ self colorSelectorBuilder
]

{
	#category : #initialize,
	#'squeak_changestamp' : 'GLE 7/6/2024 15:15'
}
PEColorPaletteBuilder class >> reset [

	self colorSelectorBuilder: self new
]

{
	#category : #initialize,
	#'squeak_changestamp' : 'GLE 6/20/2024 11:19'
}
PEColorPaletteBuilder >> addButtonsTo: aColorPalette [

	aColorPalette addMorphBelow: (PEButtonBuilder default buildColorSelectorButtonRow: aColorPalette)

	
]

{
	#category : #initialize,
	#'squeak_changestamp' : 'GLE 6/22/2024 13:45'
}
PEColorPaletteBuilder >> addHSVMorphTo: aColorPalette [

	aColorPalette 
		hsvMorph: HSVColorSelectorMorph new;
		addMorphNext: aColorPalette hsvMorph

	
]

{
	#category : #initialize,
	#'squeak_changestamp' : 'GLE 6/18/2024 11:02'
}
PEColorPaletteBuilder >> createColorPalette [

	^ self createColorSelector: PEColorPalette new
]

{
	#category : #initialize,
	#'squeak_changestamp' : 'GLE 6/22/2024 13:45'
}
PEColorPaletteBuilder >> createColorSelector: aColorPalette [

	self 
		addHSVMorphTo: aColorPalette;
		addButtonsTo: aColorPalette.
	^ aColorPalette
]
