---
title: "Linked Art API: Name Structure"
up_href: "/api/1.0/shared/"
up_label: "Linked Art API 1.0 Shared Data Structures"
---




## Introduction

Names are linguistic labels given to some entity, and represented as a common JSON structure in all endpoints. 

Names are described in the [base patterns](/model/base/#types-and-classifications) of the model documentation, and examples are present for practically every class.

## Property Definitions

### Properties of Names

| Property Name     | Datatype      | Requirement | Description | 
|-------------------|---------------|-------------|-------------|
| `id`              | string        | Optional    | If present, the value MUST be a URI identifying the name, from which a representation of the name can be retrieved | 
| `type`            | string        | Required    | The class for the name, which MUST be the value `"Name"` | 
| `_label`          | string        | Optional    | A human readable label, intended for developers | <!-- LAF.4 -->
| `_complete`       | boolean       | Optional    | Non-Semantic. If there is an `id` property with a URI, and there is more information about the name available from the representation at that URI, then `_complete` MUST be present with a value of `false` to inform the consuming application that it might want to retrieve it |
| `content`         | string        | Required    | The string form of the Name | <!-- LAF.6 -->
| `classified_as`   | array         | Recommended | An array of json objects, each of which is a further classification of the name and MUST follow the requirements for [Type](../type/) | <!-- LAF.5 -->
| `language`        | array         | Recommended | An array of json objects, each of which is a language present in the content of the name and MUST follow the requirements for [Language](../type/)| <!-- LAF.7 -->
| `part`            | array         | Optional    | An array of json objects, each of which is a part of the current name, and MUST follow these requirements for Names| <!-- -->
| `identified_by`   | array         | Optional    | An array of json objects, each of which is a name for this Name and follows the Name pattern |
| `referred_to_by`  | array         | Optional    | An array of json objects, each of which is either a reference to a [textual work](../../endpoint/textual_work/) that refers to the name, or an embedded [statement](../statement/) about the Name. | <!-- -->
| `assigned_by`     | array         | Optional    | An array of json objects, each of which is an assignment of the Name, and MUST follow the requirements for [Assignments](../assignment/) |

### Property Diagram

> ![diagram](name_properties.png){:.diagram_img width="600px"}


### Incoming Properties

Name instances are typically found as the object of the following properties.  This list is not exhaustive, but is intended to cover the likely cases.

| Property Name   | Source Class      | Description |
|-----------------|-------------------|-------------|
| `identified_by` | All               | Names are used to provide an identifying label to the entity via identified_by. |

(And that's all!)

## Example

An object is given the name "Hacha (Ceremonial Axe)", with a note that the original form was 'hacha'.

* It has a URI given in `id` (that identifies the Name itself, not the object)
* It has a `type` of "Name"
* It is `classified_as` a primary name, with `id` of _aat:300404670_ and a `type` of "Type"
* It has `content` of "Hacha (Ceremonial Axe)"
* It has a display label of "Assigned Title"
* It is `referred_to_by` a statement, with a `type` of "LinguisticObject", `classified_as` a note with `id` of _aat:300027200_ and with `content` of "Title was originally ..."
* It has languages of English, with an `id` of _aat:300388277_ and `type` of "Language", and Spanish, with an `id` of _aat:300389311_ and `type` of "Language"
* It has a specific `part`, which ...
    * ... also has a `type` of "Name"
    * ... is `classified_as` a subtitle, with an `id` of _aat:300312006_
    * ... has `content` of "Ceremonial Axe"
    * ... and a language of English, as above. 

```crom
top = model.HumanMadeObject(ident="auto int-per-segment")
n = vocab.PrimaryName(content="Hacha (Ceremonial Axe)")
n.language = vocab.instances['spanish']
n.language = vocab.instances['english']
top.identified_by = n
st = vocab.Subtitle(content="Ceremonial Axe")
st.language = vocab.instances['english']
n.part = st
n.identified_by = vocab.DisplayName(content="Assigned Title")
n.referred_to_by = vocab.Note(content="Title was originally given as 'hacha'")
```


## Future Considerations

* Assignments, as described for [Identifiers](../identifier/), could easily be added for Names, but there has not been a use case proposed.

