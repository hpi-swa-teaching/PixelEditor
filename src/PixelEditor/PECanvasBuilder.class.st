Class {
	#name : #PECanvasBuilder,
	#superclass : #PEBuilder,
	#category : #PixelEditor
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/16/2024 10:35'
}
PECanvasBuilder >> buildScreen [

	| layer brush screen |
	
	screen := PEScreen new.
	layer := PELayer new createPixelsWidth: 10 andHeight: 10.
	brush := PEBrush new pixelCollection: layer submorphs;
		changeSelectedColor: Color black.
	screen addMorphFront: layer;
		addMorphFront: brush
]
