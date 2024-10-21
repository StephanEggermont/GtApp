Class {
	#name : #GAModel,
	#superclass : #Object,
	#instVars : [
		'announcer'
	],
	#classInstVars : [
		'default'
	],
	#category : #GtApp
}

{ #category : #accessing }
GAModel class >> default [
	^default ifNil: [default := self new]
]

{ #category : #'as yet unclassified' }
GAModel class >> reset [
	default := nil
]

{ #category : #accessing }
GAModel >> announcer [
	^ announcer
]

{ #category : #accessing }
GAModel >> announcer: anObject [
	announcer := anObject
]

{ #category : #'as yet unclassified' }
GAModel >> initialize [
	announcer := Announcer new
]
