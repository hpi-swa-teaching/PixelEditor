Class {
	#name : #PEJson,
	#superclass : #Json,
	#category : #PixelEditor
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/31/2024 16:06'
}
PEJson >> readDictionary [
	| m k v needComma |
	m := JsonObject new.
	needComma := false.
	[
		self skipWhitespace.
		(stream peekFor: $}) ifTrue: [ ^ m].
		needComma
			ifTrue: [self skipWhitespace]
			ifFalse: [needComma := true].
"		k := self readAny. "
		(stream peekFor: $") ifFalse: [JsonSyntaxError signal: 'Key in dictionary must be string'].
		k := self readString.
		self skipWhitespace.
		(stream peekFor: $:) ifFalse: [JsonSyntaxError signal: 'Missing colon'].
		v := self readAny.
		m at: k put: v.
	] repeat.

]
