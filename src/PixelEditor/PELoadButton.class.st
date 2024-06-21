Class {
	#name : #PELoadButton,
	#superclass : #PESettingsButton,
	#category : #PixelEditor
}

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
	#'squeak_changestamp' : 'GLE 6/19/2024 21:33'
}
PELoadButton >> load [
	
	| fileName |
	
	fileName := self openFileSaverDialog getUserResponse.
	fileName isNil ifFalse: [
		PixelEditor openWithJson: (self loadFile: fileName).
		self target systemWindow abandon]
	
	
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
