Class {
	#name : #PEBuilder,
	#superclass : #Object,
	#category : #PixelEditor
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/17/2024 18:09'
}
PEBuilder >> buildPixelEditor [

	| buttonBuilder canvasBuilder |
	
	buttonBuilder := PEButtonBuilder new.
	canvasBuilder := PECanvasBuilder new.
	buttonBuilder buildButtonRows: canvasBuilder buildScreen
	
	
	 
]
