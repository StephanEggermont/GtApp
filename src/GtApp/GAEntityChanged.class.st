Class {
	#name : #GAEntityChanged,
	#superclass : #Announcement,
	#instVars : [
		'entity'
	],
	#category : #GtApp
}

{ #category : #accessing }
GAEntityChanged >> entity [
	^ entity
]

{ #category : #accessing }
GAEntityChanged >> entity: anObject [
	entity := anObject
]
