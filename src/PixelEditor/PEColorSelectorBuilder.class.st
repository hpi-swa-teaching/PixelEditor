Class {
	#name : #PEColorSelectorBuilder,
	#superclass : #PEBuilder,
	#category : #PixelEditor
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/18/2024 10:54'
}
PEColorSelectorBuilder >> addButtonsTo: aColorPalette [

	| buttonBuilder |
	
	buttonBuilder := PEButtonBuilder new.
	aColorPalette addMorphNext: (buttonBuilder buildAcceptButton: aColorPalette);
		addMorphNext: (buttonBuilder buildCloseButton: aColorPalette) 

	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/18/2024 10:49'
}
PEColorSelectorBuilder >> addHSVMorphTo: aColorPalette [

	aColorPalette addMorphNext: HSVColorSelectorMorph new. 

	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/18/2024 10:50'
}
PEColorSelectorBuilder >> createColorPalette [

	self addHSVMorphTo: PEColorPalette new
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/17/2024 20:26'
}
PEColorSelectorBuilder >> createColorSelector [

	^ PEColorPalette new colorButton: PEColorButton selectedButton
]
