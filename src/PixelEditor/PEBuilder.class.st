Class {
	#name : #PEBuilder,
	#superclass : #Object,
	#category : #PixelEditor
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 7/6/2024 15:17'
}
PEBuilder class >> reset [

	self subclasses do: [:each | each reset]
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/19/2024 21:57'
}
PEBuilder >> initialize [

	super initialize.
	self setUpDirectories
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/19/2024 21:57'
}
PEBuilder >> setUpDirectories [
	
	| fileDirectory |
	
	fileDirectory := FileDirectory new.
	(fileDirectory directoryExists:  (FileDirectory  fullPathForURI: '\Saved-Images\'))
		ifFalse:[fileDirectory createDirectory: '.\Saved-Images'].
	(fileDirectory directoryExists:  (FileDirectory  fullPathForURI: '\Exported-Images\'))
		ifFalse:[fileDirectory createDirectory: '.\Exported-Images']
]
