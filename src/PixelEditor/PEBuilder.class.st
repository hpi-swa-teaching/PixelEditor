Class {
	#name : #PEBuilder,
	#superclass : #Object,
	#category : #PixelEditor
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/17/2024 20:28'
}
PEBuilder >> buildPixelEditor [

	| buttonBuilder canvasBuilder |
	
	self setUpSavingDirectory.
	buttonBuilder := PEButtonBuilder new.
	canvasBuilder := PECanvasBuilder new.
	buttonBuilder buildButtonRows: canvasBuilder buildScreen
	
	
	 
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
