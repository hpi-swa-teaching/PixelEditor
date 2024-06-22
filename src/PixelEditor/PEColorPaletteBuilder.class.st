Class {
	#name : #PEColorPaletteBuilder,
	#superclass : #PEBuilder,
	#classInstVars : [
		'colorSelectorBuilder'
	],
	#category : #PixelEditor
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/20/2024 17:59'
}
PEColorPaletteBuilder class >> default [

	colorSelectorBuilder
		ifNil: [ colorSelectorBuilder := PEColorPaletteBuilder new ].
	^ colorSelectorBuilder
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/20/2024 11:19'
}
PEColorPaletteBuilder >> addButtonsTo: aColorPalette [

	aColorPalette addMorphBelow: (PEButtonBuilder default buildColorSelectorButtonRow: aColorPalette)

	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/22/2024 13:45'
}
PEColorPaletteBuilder >> addHSVMorphTo: aColorPalette [

	aColorPalette 
		hsvMorph: HSVColorSelectorMorph new;
		addMorphNext: aColorPalette hsvMorph

	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/18/2024 11:02'
}
PEColorPaletteBuilder >> createColorPalette [

	^ self createColorSelector: PEColorPalette new
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/22/2024 13:45'
}
PEColorPaletteBuilder >> createColorSelector: aColorPalette [

	self 
		addHSVMorphTo: aColorPalette;
		addButtonsTo: aColorPalette.
	^ aColorPalette
]
