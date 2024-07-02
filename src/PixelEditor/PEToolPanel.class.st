Class {
	#name : #PEToolPanel,
	#superclass : #PEWidgetToMorphAdapter,
	#instVars : [
		'colorPickerMorph'
	],
	#category : #PixelEditor
}

{
	#category : #initialization,
	#'squeak_changestamp' : 'Corvin 7/2/2024 11:45'
}
PEToolPanel >> colorPickerMorph [
^ colorPickerMorph
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Corvin 7/2/2024 11:45'
}
PEToolPanel >> colorPickerMorph: aMorph [ 
	colorPickerMorph := aMorph
]

{
	#category : #geometry,
	#'squeak_changestamp' : 'Corvin 7/2/2024 11:48'
}
PEToolPanel >> extent: aExtent [ 
	super extent: aExtent.
	self colorPickerMorph width: self width.
	self colorPickerMorph height: self height // 3.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Corvin 7/2/2024 11:46'
}
PEToolPanel >> initialize [
	super initialize.
	self colorPickerMorph: HSVAColorSelectorMorph new.
	self addMorph: self colorPickerMorph
]
