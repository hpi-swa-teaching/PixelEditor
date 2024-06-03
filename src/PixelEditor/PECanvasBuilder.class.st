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
	#'squeak_changestamp' : 'GLE 5/31/2024 15:24'
}
PECanvasBuilder >> buildScreen [

	| layer brush |

	layer := PELayer new createPixels.
	brush := PEBrush new pixelCollection: layer submorphs;
		changeSelectedColor: Color black.
	^ PEScreen new addMorph: layer; 
		addMorphBack: brush
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/31/2024 15:32'
}
PECanvasBuilder >> buildScreenWithJson: aJson [

	| layer brush |

	layer := PELayer new createPixelsFromJson: aJson.
	brush := PEBrush new pixelCollection: layer submorphs;
		changeSelectedColor: Color black.
	^ PEScreen new addMorph: layer; 
		addMorphBack: brush
]
