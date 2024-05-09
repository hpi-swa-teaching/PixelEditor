Class {
	#name : #PELayer,
	#superclass : #Morph,
	#category : #PixelEditor
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 5/9/2024 16:56'
}
PELayer >> createPixelsWidth: aWidth andHeight: aHeight [

	| pixelSize |

	pixelSize := PEPixel pixelSize.
	self extent: aWidth @ aHeight.
	0 to: aHeight-pixelSize by: pixelSize do: [:eachHeight |
		0 to: aWidth-pixelSize by: pixelSize do: [:eachWidth | 
			self insertPixelAt: eachWidth @ eachHeight]]
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 5/9/2024 16:59'
}
PELayer >> insertPixelAt: aPoint [

	self addMorph: (PEPixel new position: aPoint; yourself)
]
