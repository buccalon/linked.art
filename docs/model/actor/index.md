---
title: "Actors: People and Organizations"
---

[TOC]

## Introduction

All activities are carried out by some actor, either a person (`Person`) or a group of people (`Group`) such as an organization or company.  The identity and description of these actors are very important to record in order to provide the human context for the activities, and their related places and objects. The creators, finders, owners, sellers and curators of objects are all relevant to understanding our cultural heritage.

As far as scope goes, the model currently does not consider that non-humans (such as software or animals) can perform activities, as activities require some notion of intent. Thus the productions of the [infamous monkey selfies from 2011](https://www.cnn.com/2018/04/24/us/monkey-selfie-peta-appeal/index.html) are not carried out by anyone, as the monkey cannot do it and the photographer did not intend for the photographs to be taken. A workaround for this is simply to create a `Person` record for the non-human, until the model can catch up.

This model does not aim to capture all of the possible information about a Person or Group, or all their relationships to other people, objects, places or activities. Instead it attempts to capture sufficient information for a human or machine to distinguish the actor from others and to understand their role in history. Future versions or independent extensions might add additional features.

## Classes

There are two primary classes of acting agent, `Person` and `Group`. `Person` is used for humans, and `Group` is used for any collective set of humans.  Groups typically are able to take action as a coherent whole, but in some cases this is overlooked for simplicity's sake.  For example, it is reasonable to have a Group that represents 18th Century French Impressionist artists, however such a group is an artifical construct and thus could not have acted as a single entity. It is also useful to be able to say that "The Museum" acquired a painting or "The Workshop" produced a sculpture, when in fact it was some very small subset of the members of the group that actually performed the activity and we do not know exactly who. Also, it is not necessary that the Group be aware of the other members, nor take any intentional act to join the Group, members can be added after their deaths. 

If it is not known whether an actor is a Person or a Group, then the safer default is Group. For example, if a sale of an object is listed as being from an art dealer called "Smith", it is unclear whether it refers to a person via their family name, or to an organization named after its owner. The rationale for using `Group` is that it could be a group consisting of a single person, or a group that is otherwise arbitrarily defined. 

__Example:__ 

Rembrandt (a Person) was a member of the Guild of St Luke (a Group).

```crom
top = model.Person(ident="rembrandt/2", label="Rembrandt")
grp = model.Group(ident="stluke", label="Guild of St Luke")
top.member_of = grp
```

## Names

Personal names are described in detail in the [shared patterns section](/model/base.html#names).

__Example:__

Rembrandt's name is Rembrandt Harmenzoon van Rijn

```crom
top = model.Person(ident="rembrandt/3", label="Rembrandt")
top.identified_by = vocab.PrimaryName(content="Rembrandt Harmenzoon van Rijn")
```

### Parts of Names

Personal names can often be broken down into parts, with different types.  The types are given using the `classified_as` property. The name parts are themselves `Name`s, and are included in the `part` set in the same way as other partitioning. The type of name is given using `classified_as`, in the regular fashion. Western name division vocabulary is used in the example below, and other name part types should be [suggested](/model/vocab/).

__Example:__

Rembrandt's name is Rembrandt / Harmenzoon / van Rijn

```crom
top = model.Person(ident="rembrandt/4", label="Rembrandt")
name = vocab.PrimaryName(content="Rembrandt Harmenzoon van Rijn")
top.identified_by = name 
name.part = vocab.GivenName(content="Rembrandt")
name.part = vocab.MiddleName("Harmenzoon")
name.part = vocab.FamilyName(content="van Rijn")
```

## Equivalent Entities

There may be other identifiers for the person available in external systems, such as [ULAN](http://vocab.getty.edu/ulan/) or any of a dozen others.  If all of the information needed about the person is available from that system, then it is recommended to simply use that identifier directly as the URI for the Person.  If there is a need to maintain separate information about the person, then the `equivalent` property should be used to align the two. This might happen when, for example, the local data has additional information about which documents refer to the person, or more detailed biographical information.

__Example:__

The equivalent entity in ULAN for Rembrandt is `http://vocab.getty.edu/ulan/500011051`

```crom
top = model.Person(ident="rembrandt/6", label="Rembrandt")
top.equivalent = model.Person(ident="http://vocab.getty.edu/ulan/500011051", label="Rembrandt")
```

## Addresses

People and Organizations often have addresses, physical or online, via which they can be contacted. This includes mailing addresses, email addresses and so forth.  These are referenced in a separate property from Names and Identifiers called `contact_point`, as many people or groups might have the same contact point, and thus the person is not `identified_by` the address. The address is instead an `Identifier` for a location or service. This means it does not have language information, unlike Names. 

This `Identifier` is related to the actor via the `contact_point` property.  They can be `classified_as` different types, and use the `content` property to capture the address itself.

__Example:__

Rembrandt had an address in Amsterdam.

```crom
top = model.Person(ident="rembrandt/12", label="Rembrandt")
top.contact_point = vocab.StreetAddress(content="Jodenbreestraat 4, 1011 NK Amsterdam")
```

__Example:__

Rembrandt's residence is now a museum at the same address, with a phone number and email address:

```crom
top = model.Group(ident="rembrandthuis/1", label="Rembrandt House Museum")
top.contact_point = vocab.StreetAddress(content="Jodenbreestraat 4, 1011 NK Amsterdam")
top.contact_point = vocab.TelephoneNumber(content="+31-20-520-0400")
top.contact_point = vocab.EmailAddress(content="museum@rembrandthuis.nl")
```

## Residence as a Place

People and Organizations can have a Place as their residence, identified and described as an entity rather than just a street address as a string. That Place might have the address as an identifier, it would have its own Name, could have geographical coordinates, and any other features of the [Place](../place/) model.

__Example:__

Rembrandt resided at a Place which is where his house is.

```crom
top = model.Person(ident="rembrandt/11", label="Rembrandt")
res = model.Place(ident="rembrandthuis", label="Rembrandt's House Place")
top.residence = res
```


## Life Events

There are key events in a person or organization's existence that are often recorded as they contribute core information for determining the identity of the actor.  These include the birth or formation, death or dissolution, and the period in which they carried out the work they are known for.

### Birth and Death / Formation and Dissolution

Like the production of objects or the creation of texts, people and organizations also come into and out of existence through events.  These events can take place at certain Places, happen at certain times, and so on.

People are born in `Birth` events and die in `Death` events, related to the person by the `born` and `died` properties respectively. Groups are formed in `Formation` activities, and dissolved in `Dissolution` activities, referenced via the `formed_by` and `dissolved_by` properties. `Birth` and `Death` are modeled not as Activities, but as Events that are not carried out by anyone. They are the coming into existence instant of the person, not the conception, the labor, or potentially the killing by a murderer. These activities can be modeled as causes, as described below.

Birth and Death do not have any properties of their own that are used in the model, only those inherited from event, such as `timespan` and `took_place_at`.

!!! "note" "Inanimate Thing or Dead Person?"
    After death, people are still instances of `Person` which is a subclass of `Actor`, even though they can no longer carry out activities.  People in comas or otherwise completely incapacitated also cannot carry out activities, but are not temporarily non-Actors. The modeling that death is a transformation from an instance of Person to an instance of Thing adds complexity for the sake of purity, but does not add any actual value. Thus a burial activity (_aat:300263485_) buries a Person, not a Thing-that-used-to-be-a-Person. However if the skeleton is later dug up, it is likely documented as a Physical Thing. There is, therefore, a transition at some undetermined point.

__Example:__

Rembrandt was born on 1606-07-15 and died on 1669-10-04 in Amsterdam.

```crom
top = model.Person(ident="rembrandt/13", label="Rembrandt")
birth = model.Birth()
bts = model.TimeSpan()
bts.begin_of_the_begin = "1606-07-15T00:00:00Z"
bts.end_of_the_end = "1606-07-15T23:59:59Z"
birth.timespan = bts
death = model.Death()
dts = model.TimeSpan()
dts.begin_of_the_begin = "1669-10-04T00:00:00Z"
dts.end_of_the_end = "1669-10-04T23:59:59Z"
death.timespan = dts
dloc = model.Place(ident="http://vocab.getty.edu/tgn/7006952",label="Amsterdam")
death.took_place_at = dloc
top.born = birth
top.died = death 
```

__Example:__

The formation of the Rembrandt House Museum on 1911-06-10.

```crom
top = model.Group(ident="rembrandthuis/2", label = "Rembrandt House Museum")
form = model.Formation()
top.formed_by = form
fts = model.TimeSpan()
fts.begin_of_the_begin = "1911-06-10T00:00:00Z"
fts.end_of_the_end = "1911-06-10T23:59:59Z"
form.timespan = fts
```

### Active Dates

It is often useful to know where and when the person or organization was active in their professional function. For example, an artist might have started painting when they were 20, stopped by 30, and only painted in Italy. This information can be used to help eliminate dubious attributions, for example.

The property for the Person or Group is `carried_out`, the inverse of the more familiar `carried_out_by` from Activities to Actors. The `Activity` must be `classified_as` _aat:300393177_, meaning the time when the actor is actively performing their primary professional function.  The other properties of activities can and should also be used.  

This pattern can be used for other activities that the Person or Group was responsible for by changing the `classified_as` on the Activity to reflect the nature of that activity, however the activity must not have its own identity separate from Person or Group. If it does, then it should have its own record, and use `carried_out_by` in the regular fashion. Activities that are embedded within records in this way cannot be referred to separately from the Person.

A more specific classification can be added to the activity if known, for example that Rembrandt's professional activities were being an artist, rather than being an author. The location can be added with `took_place_at`, along with any other activity based properties. Note that this might end up duplicating occupation information in `classified_as` on the Person or Group.


__Example:__

Rembrandt was professionally active as a painter between 1631 and his death in 1669.

```crom
top = model.Person(ident="rembrandt/7", label="Rembrandt")
active = vocab.Active()
active.classified_as = model.Type(ident="http://vocab.getty.edu/aat/300025136", label="Painter")
ats = model.TimeSpan()
ats.begin_of_the_begin = "1631-01-01T00:00:00Z"
ats.end_of_the_end = "1669-10-04T23:59:59Z"
active.timespan = ats
top.carried_out = active
```

### Participation versus Responsibility

Other core life events are not carried out by the Person or Group, but are still potentially important to capture such as baptisms and burials. As marriages are not unique to the person, they should instead have their own record to capture both parties.

Note that many such events take place in locations only identified by a civic or religious building, however activities take place at a Place, not at a building, which is a Human Made Object. See [documenation](../model/place/#buildings-and-immovable-objects) about "immovable" objects and places.

__Example:__

Rembrandt was buried some time after he died in 1669 at the location of Westerkerk.

```crom
top = model.Person(ident="rembrandt/14", label="Rembrandt")
burial = model.Activity()
burial.classified_as = model.Type(ident="http://vocab.getty.edu/aat/300263485", label="Burial")
ats = model.TimeSpan()
ats.begin_of_the_begin = "1669-10-04T00:00:00Z"
ats.end_of_the_end = "1669-11-01T23:59:59Z"
burial.timespan = ats
burial.took_place_at = model.Place(ident="westerkerk", label="Place of Westerkerk")
top.participated_in = burial
```

## Descriptive Information

### Biography

Biographical descriptions follow the [Statement pattern](/model/base/), with biography _(aat:300080102)_ as the classification.  In all other respects, it is a typical usage of an entity being `referred_to_by` a Statement.

__Example:__

Rembrandt with a biography statement.

```crom
top = model.Person(ident="rembrandt/8", label="Rembrandt")
top.referred_to_by = vocab.BiographyStatement(content="Rembrandt's work is characterized by the Baroque interest in dramatic scenes and strong contrasts of light on a dark stage")
```

### Nationality

Nationality is modeled as a Type that is associated with the Person, rather than as a Group as described in the CIDOC-CRM ontology document.  This is because all of the people, across all time, who have had a particular nationality, cannot take action as a single coherent entity.  As Group is a sub-class of Actor, it is not thought to be an appropriate class for this use. Without proliferating new classes (e.g. sets of people that are not actors), the traditional and perfectly consistent way to describe nationality is as a flag on the person, which is modeled as a Type.

The `Type` resource should have _aat:300379842_ as one of its classifications, such that a consuming application can find all of the nationality types from amongst the person's classifications. The nationality resource should either be from an established vocabulary of nationalities, or have an `exact_match` to an established vocabulary entry if additional local information is necessary to record, such as a particular name for that nationality.

__Example:__

Rembrandt was Dutch.

```crom
top = model.Person(ident="rembrandt/9", label="Rembrandt")
top.classified_as = vocab.instances['dutch nationality']
```

### Ethnicity

Ethnicity is separate from nationality, as it refers to a social group or culture as opposed to a political nation or state. The same rationale as for Nationality being a classification also applies to ethnicity or culture -- it is unlikely to be a coherent collective capable of intentional action.

Please note that it is completely acceptable to list a nationality or ethnicity without a "meta-type" classification if it is unknown which of the two it is. Also, note that different organizations might make different decisions as to whether a particular group or culture is a nationality or an ethnicity.

__Example:__

Kehinde Wiley is African-American.

```crom
top = model.Person(ident="wiley/1", label="Kehinde Wiley")
top.classified_as = vocab.Ethnicity(ident="http://www.wikidata.org/entity/Q3007177", label="African-American")
```

### Gender

Gender is a debated and politically charged topic. The intent of this section is not to take a stand on those debates, but instead to allow the representation of data in museum and other information management systems to be made accessible.

Gender is not specifically discussed in the underlying ontology, in fact it was even deleted from a previous version, and the modeling follows the same classification pattern as for nationality and culture. This allows a diverse set of gender possibilities, and does not make any specific statements about biological versus assigned versus preferred gender roles. The gender must be `classified_as` _aat:300055147_.

__Example:__

Rembrandt was male.

```crom
top = model.Person(ident="rembrandt/32", label="Rembrandt")
top.classified_as = vocab.instances['male']
```

### Occupations

Similar to nationalities, ethnicities and genders, people are also often classified based on their roles or occupations.

__Example:__

Rembrandt was an artist.

```crom
top = model.Person(ident="rembrandt/31", label="Rembrandt")
top.classified_as = vocab.instances["artist occupation"]
```

## Organization Membership

As discussed above, Organizations can be seen as the actor when it comes to their roles in various events. For example, an auction is likely to be carried out by an organization, and they can own and curate objects.

The only significantly new aspect to organizational actors, compared to people, is that they can have members.  These members can be either other groups, such as a department within a museum, or individuals. The `member_of` property is used to connect the member Person or Group to the Group they are a member of.

__Example:__ 

Rembrandt (a Person) was a member of the Guild of St Luke (a Group).

```crom
top = model.Person(ident="rembrandt/2", label="Rembrandt")
grp = model.Group(ident="stluke", label="Guild of St Luke")
top.member_of = grp
```
