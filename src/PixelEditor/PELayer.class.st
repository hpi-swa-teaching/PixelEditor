Class {
	#name : #PELayer,
	#superclass : #Morph,
	#category : #PixelEditor
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/13/2024 19:05'
}
PELayer >> createPixelsWidth: aWidth andHeight: aHeight [

	| pixelSize |

	pixelSize := PEPixel pixelSize.
	self extent: (aWidth * pixelSize) @ (aHeight * pixelSize).
	0 to: (aHeight * pixelSize)-pixelSize by: pixelSize do: [:eachHeight | 
		0 to: (aWidth * pixelSize) - pixelSize by: pixelSize do: [:eachWidth | 
			self insertPixelAt: eachWidth @ eachHeight]].
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/14/2024 14:16'
}
PELayer >> initialize [

	super initialize.
	self position: 500 @ 300;
		openInWorld;
		color: Color white;
		borderWidth: 5;
		borderColor: Color black
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/14/2024 13:57'
}
PELayer >> insertPixelAt: aPoint [

	self addMorphFront: (PEPixel new position: self positionInWorld + aPoint; yourself)
]
