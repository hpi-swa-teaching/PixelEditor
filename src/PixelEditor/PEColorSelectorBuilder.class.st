Class {
	#name : #PEColorSelectorBuilder,
	#superclass : #PEBuilder,
	#category : #PixelEditor
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/18/2024 11:12'
}
PEColorSelectorBuilder >> addButtonsTo: aColorPalette [

	aColorPalette addMorphBelow: (PEButtonBuilder new buildColorSelectorButtonRow: aColorPalette)

	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/18/2024 11:05'
}
PEColorSelectorBuilder >> addHSVMorphTo: aColorPalette [

	aColorPalette hsvMorph: HSVColorSelectorMorph new;
		addMorphNext: aColorPalette hsvMorph

	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/18/2024 11:02'
}
PEColorSelectorBuilder >> createColorPalette [

	^ self createColorSelector: PEColorPalette new
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/18/2024 11:03'
}
PEColorSelectorBuilder >> createColorSelector: aColorPalette [

	self addHSVMorphTo: aColorPalette;
		addButtonsTo: aColorPalette.
	^ aColorPalette colorButton: PEColorButton selectedButton
]
