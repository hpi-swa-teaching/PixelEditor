Class {
	#name : #PEBuilder,
	#superclass : #Object,
	#category : #PixelEditor
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/11/2024 14:02'
}
PEBuilder class >> setUpDirectories [
	
	| fileDirectory |
	
	fileDirectory := FileDirectory new.
	(fileDirectory directoryExists:  (FileDirectory  fullPathForURI: '\Saved-Images\'))
		ifFalse:[fileDirectory createDirectory: '.\Saved-Images'].
	(fileDirectory directoryExists:  (FileDirectory  fullPathForURI: '\Exported-Images\'))
		ifFalse:[fileDirectory createDirectory: '.\Exported-Images']
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/7/2024 17:26'
}
PEBuilder >> buildPixelEditor [

	|  canvas |
	
	self setUpDirectories.
	canvas := PECanvasBuilder new buildCanvas.
	PEButtonBuilder new buildButtonRows: canvas.
	^ canvas
	
	
	 
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/7/2024 17:27'
}
PEBuilder >> buildPixelEditorOld [
	
	self setUpDirectories.
	PEButtonBuilder new buildButtonRows: PECanvasBuilder new buildScreen.
	
	
	 
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/7/2024 17:27'
}
PEBuilder >> buildPixelEditorWithJson: aJson [

	self setUpDirectories.
	PixelEditor openWithCanvas: (PECanvasBuilder new buildCanvasFromJson: aJson)
	
	
	 
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/7/2024 17:27'
}
PEBuilder >> setUpDirectories [
	
	| fileDirectory |
	
	fileDirectory := FileDirectory new.
	(fileDirectory directoryExists:  (FileDirectory  fullPathForURI: '\Saved-Images\'))
		ifFalse:[fileDirectory createDirectory: '.\Saved-Images'].
	(fileDirectory directoryExists:  (FileDirectory  fullPathForURI: '\Exported-Images\'))
		ifFalse:[fileDirectory createDirectory: '.\Exported-Images']
]
