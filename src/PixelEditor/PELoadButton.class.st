Class {
	#name : #PELoadButton,
	#superclass : #PESettingsButton,
	#category : #PixelEditor
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/21/2024 16:33'
}
PELoadButton >> basicType [

	^ #PELoadButton
]

{
	#category : #loading,
	#'squeak_changestamp' : 'GLE 6/19/2024 21:32'
}
PELoadButton >> directory [ 

	^ 'Saved-Images' 
]

{
	#category : #'on click',
	#'squeak_changestamp' : 'GLE 6/6/2024 19:12'
}
PELoadButton >> doAction [

	self load
]

{
	#category : #loading,
	#'squeak_changestamp' : 'GLE 7/7/2024 18:15'
}
PELoadButton >> load [
	
	| fileName |
	
	fileName := self openFileSaverDialog getUserResponse.
	fileName isNil 
		ifFalse: [
			self target systemWindow abandon.
			PixelEditor openWithJson: (self loadFile: fileName) ] 
	
	
]

{
	#category : #loading,
	#'squeak_changestamp' : 'GLE 6/4/2024 00:43'
}
PELoadButton >> loadFile: afileName [
	
	^ Json readFromString: (self stringFromStream: (StandardFileStream oldFileNamed: afileName))
	
]

{
	#category : #loading,
	#'squeak_changestamp' : 'GLE 7/7/2024 18:15'
}
PELoadButton >> stringFromStream: aStream [

	| string |
	
	string := '{'.
	[ aStream atEnd ] whileFalse: [ string := string, aStream next ].
	^ string, '}'
	
]

{
	#category : #'ui label',
	#'squeak_changestamp' : 'GLE 6/19/2024 21:32'
}
PELoadButton >> windowTitle [

	^ 'Load File'
]
