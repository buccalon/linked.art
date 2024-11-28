---
title: "Linked Art API: Physical Object Representation"
---

[TOC]

## Introduction

The Physical Object API is a method of getting access to descriptions of physical objects, such as paintings, sculptures, manuscripts or other tangible artworks. The physical objects that carry the artwork content are a core part of any Linked Art information system, and thus the descriptions are likely to have a substantial amount of fields and data. This results in a relatively long set of relationships and properties, but they follow the typical patterns and constructions.

For more information about the Physical Object data, please see the [Object model](/model/object/) description.


### Properties of Physical Objects


| Property Name     | Datatype      | Requirement | Description | 
|-------------------|---------------|-------------|-------------|
| `@context`        | string, array | Required    | The value MUST be the URI of the [Linked Art context](../../json-ld/) as a string, `"https://linked.art/ns/v1/linked-art.json"` or an array in which the URI is the last entry to allow for [extensions](../../json-ld/extensions) | 
| `id`              | string        | Required    | The value MUST be the HTTP(S) URI at which the object's representation can be [dereferenced](../../protocol/) |  
| `type`            | string        | Required    | The class for the object, which MUST be the value `"HumanMadeObject"` |
| `_label`          | string        | Recommended | A human readable label for the object, intended for developers |
| `classified_as`   | array         | Recommended | An array of json objects, each of which is a classification of the object and MUST follow the requirements for [Type](../../shared/type/) |
| `identified_by`   | array         | Recommended | An array of json objects, each of which is a name/title of the object and MUST follow the requirements for [Name](../../shared/name/), or an identifier for the object and MUST follow the requirements for [Identifier](../../shared/identifier/) |
| `referred_to_by`  | array         | Optional    | An array of json objects, each of which is a human readable statement about the object and MUST follow the requirements for [Statement](../../shared/statement/) |
| `equivalent`      | array         | Optional    | An array of json objects, each of which is an [reference](../../shared/reference) to an external identity and description of the current object |
| `representation`  | array         | Optional    | An array of json objects, each of which is a reference to a [Visual Work](../visual_work) that represents the current object, and MUST follow the requirements for an [reference](../../shared/reference/) |
| `member_of`       | array         | Optional    | An array of json objects, each of which is a Set that the current object is a member of and MUST follow the requirements for an [reference](../../shared/reference/) to a Set |
| `subject_of`      | array         | Optional    | An array of json objects, each of which is a reference to a [Textual Work](../textual_work/), the content of which focuses on the current object, and MUST follow the requirements for an [reference](../../shared/reference/) |
| `attributed_by`   | array         | Optional    | An array of json objects, each of which is a [Relationship Assignment](../../shared/assignment/) that relates the current object to another entity |
| `part_of` | array | Optional | An array of json objects, each of which is a [reference](../../shared/reference/) to another Physical Object that the current object is a part of. |
| `dimension` | array | Optional | An array of json objects, each of which is a [Dimension](../../shared/dimension), such as height or width, of the current object |
| `made_of` | array | Optional | An array of json objects, each of which is a [reference](../../shared/reference) to a material that the object is made_of and MUST follow the requirements for [Material](../../shared/type) |
| `current_owner` | array | Optional | An array of json, objects each of which a [reference](../../shared/reference/) to a [Person](../person/) or [Group](../group/) that currently owns the object |
| `current_custodian` | array | Optional | An array of json, objects each of which a [reference](../../shared/reference/) to a [Person](../person/) or [Group](../group/) that currently has custody of the object|
| `current_permanent_custodian` | array | Optional | An array of json, objects each of which a [reference](../../shared/reference/) to a [Person](../person/) or [Group](../group/) that normally has custody of the object, but might not at the present time |
| `current_location` | json object | Optional | A json object which is a [reference](../../shared/reference/) to the [Place](../place/) where the object is currently located |
| `current_permanent_location` | json object | Optional | A json object which is a [reference](../../shared/reference/) to the [Place](../place/) where the object is normally located, but might not be at the present time |
| `contained_or_supported_by` | json object | Optional | A json object which is a [reference](../../shared/reference) to another Physical Object that holds, contains or supports the current object |
| `carries` | array | Optional | An array of json objects, each of which is a [reference](../../shared/reference/) to a [Textual Work](../textual_work/) that this object carries the text of |
| `shows` | array | Optional | An array of json objects, each of which is a [reference](../../shared/reference/) to a [Visual Work](../visual_work/) that this object shows a rendition of |
| `used_for`    | array | Optional | An array of json objects, each of which represents an activity that the object was instumental in, but does not have its own identity, and follows the requirements for an [Activity](../../shared/activity) |
| `produced_by` | json object | Optional | A json object representing the production of the object, which follows the requirements for a [Production](../../shared/activity) | 
| `destroyed_by` | json object | Optional | A json object representing the destruction of the object, which follows the requirements for a [Destruction](../../shared/activity) | 
| `removed_by` | array | Optional | An array of json objects, each of which represents the removal of the current object from a larger one it was previously part of, which follows the requirements for a [PartRemoval](../../shared/activity) | 
| `modified_by` | array | Optional | An array of json objects, each of which represents a physical modification to the object, such as conservation treatment, which follows the requirements for a [Modification](../../shared/activity) |
| `encountered_by` | array | Optional | An array of json objects, each of which represents an encounter by some actor with the current object, typically when a collector "discovered" the object, which follow the requirements for an [Encounter](../../shared/activity) |
| `changed_ownership_through` | array | Optional | An array of json objects, each of which represents the Acquisition of the object by some actor from another, and follows the requirements for an `Acquisition` as given in the [Provenance Activity](../provenance_activity/) endpoint description, as also summarized below|


### Additional Properties of Acquisitions

The properties of [Activities](../../shared/activity) are available for Acquistion, along with the following:

| Property Name     | Datatype      | Requirement | Description | 
|-------------------|---------------|-------------|-------------|
| `transferred_title_from` | array       | Optional | An array of json objects, each of which is a [reference](../../shared/reference) to a [Person](../person/) or [Group](../group/), each of which was a previous owner of the object, and from whom the object's ownership was transferred. **Only usable when the `type` is `"Acquisition"`** |
| `transferred_title_to`   | array       | Optional | An array of json objects, each of which is a [reference](../../shared/reference) to a [Person](../person/) or [Group](../group/), each of which is one of the new owners to whom the object's ownership was transferred. **Only usable when the `type` is `"Acquisition"`** |

### Property Diagram

> ![diagram](object_properties.png){:.diagram_img width="600px"}

### JSON Schema

See the [schema documentation](../../schema_docs/object) and the [schema itself](../../schema/object.json)


### Incoming Properties

Physical Object instances are typically found as the object of the following properties, other than the self-referential properties above.  This list is not exhaustive, but is intended to cover the likely cases where other endpoints refer to physical objects.

| Property Name              | Source Endpoint | Description |
|----------------------------|-----------------|-------------|
| `used_specific_object`     | All             | Various activities can be carried out using a specific physical object as a instrument, tool or other integral component such as a negative in the printing of a photograph |
| `influenced_by`            | All             | Various activities are influenced by a physical object such as the inspiration for a copy |
| `transferred_title_of`     | [Provenance](../provenance_activity/) | The title of objects can be transferred in provenance activities |
| `transferred_custody_of`   | [Provenance](../provenance_activity/) | The custody of objects can also be transferred |
| `moved`                    | [Provenance](../provenance_activity/) | And the objects can be moved between locations |
| `applies_to`               | [Provenance](../provenance_activity/) | Rights can apply to objects |
| `carried_by`               | [Textual Work](../textual_work/)      | Textual works are carried by objects |
| `shown_by`                 | [Visual Work](../textual_work/)       | And Visual works are shown by objects |

## Example

The JSON for a Physical Object entry for the Mona Lisa could be as below.

* It has the Linked Art context document reference in `@context`
* It self-documents its URI in `id`
* It has a `type` of "HumanMadeObject"
* It has a `_label` with the value "Mona Lisa" for people reading the JSON
* It is `classified_as` ...
    * ... a "Painting", which has an `id` of "aat:300033618", which is in turn classified as a "Type of Work" ("aat:300435443")
    * ... a "Work of Art, which as an `id` of "aat:300111159"
* It is `identified_by` ...
    * ... a `Name`, with the content "Mona Lisa", `language` of English ("aat:300388277"), and `classified_as` a Primary Name (for English)
    * ... a `Name`, with the content "La Joconde", and `language` of French ("aat:300388306"), and `classified_as` a Primary Name (for French)
    * ... a `Name`, with the content "La Gioconda", and `language` of Italian ("aat:300388474"), and again `classified_as` a Primary Name (for Italian)
    * ... an `Identifier`, with the content "INV. 779", and `classified_as` an Accession Number ("aat:300312355") 
* It is `referred_to_by` a statement which ...
    * ... has `content` of "This portrait was doubtless started in Florence around 1503 ..."
    * ... is `classified_as` a Description ("aat:300435416")
* It has two `dimension` entries ...
    * ... a Height ("aat:300055644") of 0.77 meters ("aat:300379099")
    * ... a Width ("aat:300055647") of 0.53 meters ("aat:300379099")
* It is `made_of` two Materials ...
    * ... Poplar ("aat:300012363")
    * ... and Oil Paint ("aat:300015050")
* It is `equivalent` to the Wikidata entity "Q12418"
* It has a `current_owner` of The Louvre museum (a Group)
* It has a `current_location` of the gallery (a Place) in the museum (which would be another Place, not the same entity as the Group)
* It `shows` the very famous visual content
* It was `produced_by` a Production which ...
    * ... was `carried_out_by` Leonardo da Vinci
    * ... `took_place_at` Florence, Italy
    * ... occured in a `timespan` between "1503-01-01" and "1506-12-31"

```crom
top = vocab.Painting(ident="auto int-per-segment", label="Mona Lisa", art=1)
en = vocab.PrimaryName(value="Mona Lisa")
en.language = vocab.instances['english']
it = vocab.PrimaryName(value="La Gioconda")
it.language = vocab.instances['italian']
fr = vocab.PrimaryName(value="La Joconde")
fr.language = vocab.instances['french']
top.identified_by = en
top.identified_by = fr
top.identified_by = it
top.identified_by = vocab.AccessionNumber(content="INV. 779")
top.referred_to_by = vocab.Description(content="This portrait was doubtless started in Florence around 1503. It is thought to be of Lisa Gherardini, wife of a Florentine cloth merchant ...")
top.equivalent = model.HumanMadeObject(ident="http://wikidata.org/entity/Q12418", label="Mona Lisa")
top.member_of = model.Set(ident="", label="Most expensive paintings in the world")
top.member_of = model.Set(ident="http://data.louvre.example/all_holdings", label="Holdings of the Louvre")

h = vocab.Height(value=0.77)
h.unit = vocab.instances['meters']
w = vocab.Width(value=0.53)
w.unit = vocab.instances['meters']
top.dimension = h
top.dimension = w
top.made_of = model.Material(ident="http://vocab.getty.edu/aat/300012363", label="Poplar (wood)")
top.made_of = model.Material(ident="http://vocab.getty.edu/aat/300015050", label="Oil Paint")

top.current_owner = model.Group(ident="http://louvre.fr/", label="The Louvre")
top.current_location = model.Place(ident="http://galleries.example/louvre/711", label="Room 711, Denon Wing, The Louvre, Paris")
top.shows = model.VisualItem(ident="http://data.louvre.example/visual/mona_lisa", label="Visual Work of the Mona Lisa")

prod = model.Production()
prod.carried_out_by = model.Person(ident="http://vocab.getty.edu/ulan/500010879", label="Leonardo da Vinci")
ts = model.TimeSpan()
ts.begin_of_the_begin = "1503-01-01T00:00:00Z"
ts.end_of_the_end = "1506-12-31T23:59:59Z"
ts.identified_by = vocab.DisplayName(content="1503-1506")
prod.timespan = ts
prod.took_place_at = model.Place(ident="http://vocab.getty.edu/tgn/7000457", label="Florence, Italy")
top.produced_by = prod
```

