Class {
	#name : #PEBuilder,
	#superclass : #Object,
	#category : #PixelEditor
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/3/2024 10:15'
}
PEBuilder >> buildPixelEditor [

	|  canvas |
	
	self setUpSavingDirectory.
	canvas := PECanvasBuilder new buildCanvas.
	PEButtonBuilder new buildButtonRows: canvas.
	^ canvas
	
	
	 
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/3/2024 13:48'
}
PEBuilder >> buildPixelEditorOld [
	
	self setUpSavingDirectory.
	PEButtonBuilder new buildButtonRows: PECanvasBuilder new buildScreen.
	
	
	 
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/4/2024 01:25'
}
PEBuilder >> buildPixelEditorWithJson: aJson [

	self setUpSavingDirectory.
	PixelEditor openWithCanvas: (PECanvasBuilder new buildCanvasFromJson: aJson)
	
	
	 
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/17/2024 20:39'
}
PEBuilder >> setUpSavingDirectory [
	
	| fileDirectory |
	
	fileDirectory := FileDirectory new.
	(fileDirectory directoryExists:  (FileDirectory  fullPathForURI: '\Saved-Images\'))
		ifFalse:[fileDirectory createDirectory: '.\Saved-Images']
]
