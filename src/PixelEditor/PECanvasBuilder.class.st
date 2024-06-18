Class {
	#name : #PECanvasBuilder,
	#superclass : #PEBuilder,
	#category : #PixelEditor
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/3/2024 10:27'
}
PECanvasBuilder >> buildCanvas [

	| layer brush canvas |
	
	canvas := PECanvas new .
	layer := PELayer new createPixels; position: canvas topLeft.
	brush := PEBrush new pixelCollection: layer submorphs;
		changeSelectedColor: Color black.
	^ canvas addMorph: layer; 
		addMorphBack: brush
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/4/2024 01:01'
}
PECanvasBuilder >> buildCanvasFromJson: aJson [

	| layer brush canvas |
	
	canvas := PECanvas new.
	layer := PELayer new createPixelsFromJson: aJson; 
		position: canvas topLeft.
	brush := PEBrush new pixelCollection: layer submorphs;
		changeSelectedColor: Color black.
	^ canvas addMorph: layer; 
		addMorphBack: brush
]
