---
title: Relationships and Context for Assignment of Attributes
---



## Introduction

It is useful for research to have access to historical information, such as which artist was previously believed to be the creator of a work, or previous valuations of an object.  The majority of use cases, however, are to get the current information.  The assignment of attributes model allows for this additional information to be associated, without making every property a list of historical values.

This pattern is also used for context-specific assertions, such as when an object is given a label or description for the purposes of an exhibition or other event.  This exhibition label does not replace the owning museum's title, but is useful for historical comparison and research purposes.

The use of context specific assertions or other attribute assignments should be kept to a minimum if possible. The data structure is significantly more complex than other patterns, which reduces the likelihood of implementation and increases the difficult of search queries. This pattern should only be used if there is no other way to express the knowledge, and it is important to capture with all of the details.

## Assigning Attributes

The `AttributeAssignment` class is an `Activity`, typically carried out by curators or researchers rather than by artists or collectors, that assigns information to resources in the model. This can be used to assign any property or relationship on any resource that can be the _subject_ of such a property.  The general Activity properties of `carried_out_by`, `timespan` and `took_place_at` are available for when and where the assignment happened, and who made it.  The `timespan` is the moment when the assignment took place, rather than the length of time that the assignment was held to be true by some audience.

This pattern is useful when you do not want to assert the relationship directly, such as for a name that was previously given to the object but is no longer actively used. Or an attribution of an artist that is possibly true, but might only be an informed guess.

The value of the assignment is given using `assigned`, and it can be any resource or value. The resource that the value is assigned to is given using the `attributed_by` property on that resource, and the relationship between them is given using `assigned_property`. Thus an `AttributeAssignment` can assign an `Actor` to a `Production` with the `carried_out_by` relationship or a `Material` to an object with the `made_of` property.  In terms of the relationship that the `AttributeAssignment` expresses, the resource with the `attributed_by` property is the subject of the relationship, the relationship itself is given in `assigned_property`, and the object of the relationship is given in `assigned`, thereby making up a regular 'triple' of subject, predicate, object.

__Example:__

It is asserted in 2015 that "Spring" has a material of canvas.

```crom
top = vocab.Painting(ident="spring/21", label="Spring")
aa = model.AttributeAssignment()
aa.assigned_property = "made_of"
mat = model.Material(ident="http://vocab.getty.edu/aat/300014078", _label="canvas")
aa.assigned = mat
top.attributed_by = aa
ts = model.TimeSpan()
ts.begin_of_the_begin = "2015-01-01T00:00:00Z"
ts.end_of_the_end = "2015-12-31T23:59:59Z"
aa.timespan = ts
```

### Assigned Value as Resource

In other situations the assigned value is the appropriate resource with which to associate the `AttributeAssignment`. In this case we flip the `AttributeAssignment` around and use `assigned_by` on the value of the assignment (the object of the relationship), and do not specify the subject of the relationship as it's the resource which refers to the value. For example, it is very useful to be able to assert which organization created and assigned an identifier to an object of a given type in order to disambiguate that organization's identifier from another organization's identifier of the same type, such as accession numbers.  Another use case is giving further information about a particular `Dimension` associated with the object, such as who measured it, when, with which instrument, and so on.

In this case, the subject of the relationship is the resource which refers to the value, the predicate is that relationship, and the object is the resource with the `assigned_by` property which refers to the AttributeAssignment.

__Example:__

The Kehinde Wiley painting "Portrait of Lynette Yiadom-Boakye, Jacob Morland of Capplethwaite" is jointly owned by the Yale University Art Gallery and the Yale Center for British Art. Both organizations have assigned their own accession numbers to the painting, and both are correct simultaneously.

```crom
top = vocab.Painting(ident="yiadom-boakye/1", label="Portrait of Lynette Yiadom-Boakye")
acc1 = vocab.AccessionNumber(value="2021.25.1")
acc2 = vocab.AccessionNumber(value="B2021.5")
aa1 = model.AttributeAssignment()
aa1.carried_out_by = vocab.MuseumOrg(ident="yuag", label="Yale University Art Gallery")
aa2 = model.AttributeAssignment()
aa2.carried_out_by = vocab.MuseumOrg(ident="ycba", label="Yale Center for British Art")
acc1.assigned_by = aa1
acc2.assigned_by = aa2
top.identified_by = acc1
top.identified_by = acc2
```

### Source of Knowledge

It is useful to be able to assert the source of information, such as the text which provides an authority or witness for a particular form of a name of an entity. This is modeled using the attribute assignment pattern, with a reference to the entity that provided the information in the `used_specific_object` field. This could be a database, or the text of a book, a physical object or other entity types. The requirement, however, is that it is a reference to this entity, rather than a string citation.

For citations as strings, the regular Statement pattern can be used with `referred_to_by`, again on the attribute assignment. 

__Example:__

The name form "Rembrandt van Rijn" was added from Gardner's "Art through the Ages".

```crom
top = model.Person(ident="rembrandt/10", label="Rembrandt")
name = model.Name(content="Rembrandt van Rijn")
aa1 = model.AttributeAssignment()
aa1.used_specific_object = model.LinguisticObject(ident="gardner-art", label="Art through the Ages")
name.assigned_by = aa1
top.identified_by = name
```

### Uncertain or Former Assignments

Similar to the approach taken in the first example above, it is possible to use `attributed_by` on a `Production` node to make either uncertain or previously held to be true claims about it. The assignment then creates another `Production` to encapsulate the information that isn't certain, or was formerly held to be correct, including the artist(s) but also potentially other links such as the place of production, the date, or other influences.

__Example:__ 

The watercolor painting "Forum Romanum" was possibly produced by Salomon Corrodi

```crom
top = vocab.Painting(ident="forum/1", label="Forum Romanum")
top.identified_by = vocab.PrimaryName(content="Forum Romanum")
prod = model.Production()
top.produced_by = prod
aa = model.AttributeAssignment()
aa.classified_as = model.Type(ident="http://vocab.getty.edu/aat/300404272", label="Possibly By")
part = model.Production()
aa.assigned = part
part.carried_out_by = model.Person(ident="corrodi", label="Salomon Corrodi")
aa.assigned_property = "part"
prod.attributed_by = aa
```

### Context-Specific Assignments

Some assertions are only true within a specific context, and the most commonly known case of this is descriptions, names and identifiers assigned for a particular exhibition. In order to record these context-specific assertions, the `attributed_by` pattern should be used, even for Names and Identifiers that might otherwise have the `assigned_by` pattern, as this keeps the Identifer separated from the primary record. 

We use the `caused_by` relationship to connect the attribution to the exhibition.

__Example:__

Spring was exhibited at the National Gallery of Art's exhibition "Post-Impressionism: Cross-Currents in European and American Painting" in 1980, and was assigned a exhibition specific identifier (called a "dexid").

```crom
top = vocab.Painting(ident="spring/31", label="Spring")
top.identified_by = vocab.PrimaryName(content="Jeanne (Spring)")
aa = model.AttributeAssignment()
idt = model.Identifier(content="2497-12")
idt.classified_as = model.Type(ident="http://vocab.getty.edu/aat/300445023", label="Entry Numbers")
aa.assigned = idt
aa.assigned_property = 'identified_by'
aa.carried_out_by = model.Group(ident="nga", label="National Gallery of Art")
aa.caused_by = model.Activity(ident="post_impressionism", label="Post-Impressionism Exhibition")
top.attributed_by = aa
```

## Relationships

### Related Entities

Another use of `AttributeAssignment` is to capture relationships between entities when the nature of that relationship is unknown. This will often appear in human-oriented user interfaces with a label like "Related Place" or "Related Person". The use of AttributeAssignment in this way should be as a last resort for when there isn't any way to be more specific that just "there is a relationship". A scenario in which this might be useful and justified is to explicitly connect "related" objects in a collection, where the related-ness is via some computed similarity measure. Equally, the underlying data format might not be explicit as to the relationship between the entities, and the attribute assignment pattern is as close as can be expressed.

This would also cover the use case of "representative objects" for an artist, or other similar "highlight" reels. There isn't a particular relationship between the artist and the object that isn't already covered by the model, but it's desirable to have some predetermined choices made rather than allowing a system to randomly pick which objects to use. These could have a reference to http://vocab.getty.edu/aat/300028875 in `classified_as` on the `AttributeAssignment` to distinguish them.

__Example:__

The Night Watch is related to another object in the Rijksmuseum collection "Nachtwacht", but the relationship is not captured specifically.

```crom
top = vocab.Painting(ident="nightwatch/57", label="The Night Watch")
top.identified_by = vocab.PrimaryName(content="The Night Watch")
aa = model.AttributeAssignment()
top.attributed_by = aa
aa.identified_by = vocab.DisplayName(content="Related Object")
aa.assigned = model.HumanMadeObject(ident="rppob-28-106", label="Nachtwacht")
```

### Unmodeled Relationships

Conversely, perhaps the relationship is known but there's no way to describe it in the model. For example the student/teacher relationship between people is a social construct that can't be captured easily, but is still of importance for art history. There are far too many such relationships, especially in the social arena, to model them all separately or create extension properties for each, and thus an `AttributeAssignment` for the relationship is the approach taken. Finding appropriate properties to use to describe the relationship, either as `classified_as` or `assigned_property` is up to the implementer. Giving a display name with `identified_by` on the `AttributeAssignment` is recommended.

/// note | Social Constructs as Groups
Note that many social relationships could be modeled as `Joining` and `Leaving` a `Group` with a particular role, via `classified_as` on the `Joining` activity. For example, the Group represents the social bond between the teacher and the student, the teacher joins the group as the teacher, the student as the student. This is possible, but introduces a lot of additional overhead with identity for the "Group" of the relationship.
///


__Example:__

Ferdinand Bol was a student of Rembrandt.

```crom
top = model.Person(ident="bol/1", label="Ferdinand Bol")
top.identified_by = vocab.PrimaryName(content="Ferdinand Bol")
aa = model.AttributeAssignment()
aa.assigned = model.Person(ident="rembrandt", label="Rembrandt")
aa.identified_by = vocab.DisplayName(content="Student Of")
top.attributed_by = aa
```
