Class {
	#name : #PECanvasBuilder,
	#superclass : #PEBuilder,
	#category : #PixelEditor
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/17/2024 21:07'
}
PECanvasBuilder >> buildScreen [

	| layer brush |
	PECanvas pixelGridWidth: 10 andHeight: 10.
	layer := PELayer new createPixels.
	brush := PEBrush new pixelCollection: layer submorphs;
		changeSelectedColor: Color black.
	^ PEScreen new addMorph: layer; 
		addMorphBack: brush
]
