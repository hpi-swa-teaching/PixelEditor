"
A PEBuilder is used for setting up the directories for saving/exporting and resets the builders.

Instance Variables

"
Class {
	#name : #PEBuilder,
	#superclass : #Object,
	#category : #PixelEditor,
	#'squeak_changestamp' : 'GLE 7/12/2024 10:56'
}

{
	#category : #initialize,
	#'squeak_changestamp' : 'GLE 7/12/2024 13:59'
}
PEBuilder class >> reset [

	self subclasses do: [:each | each reset ].
	self new
]

{
	#category : #initialize,
	#'squeak_changestamp' : 'GLE 6/19/2024 21:57'
}
PEBuilder >> initialize [

	super initialize.
	self setUpDirectories
]

{
	#category : #initialize,
	#'squeak_changestamp' : 'GLE 7/12/2024 14:45'
}
PEBuilder >> setUpDirectories [
	
	Smalltalk platformName = 'Win32'
		ifTrue: [ self setUpWindowsDirectories ]
		ifFalse: [ self setUpMacDirectories ]
]

{
	#category : #initialize,
	#'squeak_changestamp' : 'GLE 7/12/2024 14:20'
}
PEBuilder >> setUpMacDirectories [
	
	| fileDirectory |
	
	fileDirectory := FileDirectory default.
	(fileDirectory directoryExists:  (fileDirectory fullPathFor: 'Saved-Images'))
		ifFalse: [ fileDirectory createDirectory: './Saved-Images' ].
	(fileDirectory directoryExists:  (fileDirectory fullPathFor: 'Exported-Images'))
		ifFalse: [ fileDirectory createDirectory: './Exported-Images' ]
]

{
	#category : #initialize,
	#'squeak_changestamp' : 'GLE 7/12/2024 13:56'
}
PEBuilder >> setUpWindowsDirectories [
	
	| fileDirectory |
	
	fileDirectory := FileDirectory default.
	(fileDirectory directoryExists:  (FileDirectory fullPathForURI: '\Saved-Images\'))
		ifFalse: [ fileDirectory createDirectory: '.\Saved-Images' ].
	(fileDirectory directoryExists:  (FileDirectory  fullPathForURI: '\Exported-Images\'))
		ifFalse: [ fileDirectory createDirectory: '.\Exported-Images' ]
]
