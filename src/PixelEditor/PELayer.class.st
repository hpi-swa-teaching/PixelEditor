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
	#'squeak_changestamp' : 'GLE 5/13/2024 18:34'
}
PELayer >> initialize [

	super initialize.
	self position: 500 @ 500;
		openInWorld;
		color: Color white
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/13/2024 18:31'
}
PELayer >> insertPixelAt: aPoint [

	self addMorph: (PEPixel new position: self positionInWorld + aPoint; yourself)
]
