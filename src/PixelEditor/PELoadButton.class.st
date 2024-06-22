Class {
	#name : #PELoadButton,
	#superclass : #PESettingsButton,
	#category : #PixelEditor
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/21/2024 16:33'
}
PELoadButton >> basicType [

	^ #PELoadButton
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/19/2024 21:32'
}
PELoadButton >> directory [ 

	^ 'Saved-Images' 
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/6/2024 19:12'
}
PELoadButton >> doAction [

	self load
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/21/2024 16:36'
}
PELoadButton >> load [
	
	| fileName |
	
	fileName := self openFileSaverDialog getUserResponse.
	fileName isNil ifFalse: [
		self target systemWindow abandon.
		PixelEditor openWithJson: (self loadFile: fileName)]
	
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/4/2024 00:43'
}
PELoadButton >> loadFile: afileName [
	
	^ Json readFromString: (self stringFromStream: (StandardFileStream oldFileNamed: afileName))
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/21/2024 16:37'
}
PELoadButton >> loadWith: aFileName [
	
	"for testing purposes"
	
	aFileName isNil ifFalse: [
		self target systemWindow abandon.
		^ PixelEditor openWithJson: (self loadFile: aFileName)]
	
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/4/2024 00:43'
}
PELoadButton >> stringFromStream: aStream [

	| string |
	
	string := '{'.
	[aStream atEnd] whileFalse: [string := string, aStream next].
	^ string, '}'
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/19/2024 21:32'
}
PELoadButton >> windowTitle [

	^ 'Load File'
]
