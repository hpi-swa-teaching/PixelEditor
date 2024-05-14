Class {
	#name : #PECanvasBuilder,
	#superclass : #PEBuilder,
	#category : #PixelEditor
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/13/2024 19:03'
}
PECanvasBuilder >> buildBrushAndCanvas [

	| layer brush |
	
	layer := PELayer new createPixelsWidth: 10 andHeight: 10.
	brush := PEBrush new pixelCollection: layer submorphs.
	brush changeSelectedColor: Color black
]
