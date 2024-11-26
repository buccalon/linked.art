---
title: "Linked Art API: Digital Object"
up_href: "/api/1.0/endpoint/"
up_label: "Linked Art API 1.0 Endpoints"
---




## Introduction

The Digital Object API is a method of getting access to **descriptions of** digital content, such as images, documents or other electronic media, regardless of whether that file is accessible over the network at all. Access to the digital content itself, when it is available online, is provided through the `access_point` property within the description. The Digital Object API is of average complexity with many familiar properties and patterns, plus several additions to describe the object's relationship to other entities.  

For more information about the usage of Digital Object records, please see the [Digital model](/model/digital/) description.

## Property Definitions

Dereferencing an entity via the Digital Object endpoint would result in a JSON-LD document containing a single JSON object with the following properties.

### Properties of Digital Objects

| Property Name     | Datatype      | Requirement | Description | 
|-------------------|---------------|-------------|-------------|
| `@context`        | string, array | Required    | The value MUST be the URI of the [Linked Art context](../../json-ld/) as a string, `"https://linked.art/ns/v1/linked-art.json"` or an array in which the URI is the last entry to allow for [extensions](../../json-ld/extensions) | 
| `id`              | string        | Required    | The value MUST be the HTTP(S) URI at which the digital object's description can be [dereferenced](../../protocol/) |  
| `type`            | string        | Required    | The class for the digital object, which MUST be the value `"DigitalObject"` |
| `_label`          | string        | Recommended | A human readable label for the digital object, intended for developers |
| `classified_as`   | array         | Recommended | An array of json objects, each of which is a classification of the digital object and MUST follow the requirements for [Type](../../shared/type/) |
| `identified_by`   | array         | Recommended | An array of json objects, each of which is a name/title of the digital and MUST follow the requirements for [Name](../../shared/name/), or an identifier for the digital object and MUST follow the requirements for [Identifier](../../shared/identifier/) |
| `referred_to_by`  | array         | Optional    | An array of json objects, each of which is a human readable statement about the digital object and MUST follow the requirements for [Statement](../../shared/statement/) |
| `equivalent`      | array         | Optional    | An array of json objects, each of which is a [reference](../../shared/reference) to an external identity of the current digital object |
| `member_of`       | array         | Optional    | An array of json objects, each of which is a Set that the current digital object is a member of and MUST follow the requirements for a [reference](../../shared/reference/) to a Set |
| `subject_of`      | array         | Optional    | An array of json objects, each of which is a reference to a [Textual Work](../textual_work/), the content of which focuses on the current object, and MUST follow the requirements for an [reference](../../shared/reference/) |
| `representation`  | array         | Optional    | An array of json objects, each of which is a reference to a [Visual Work](../visual_work) that represents the current object, and MUST follow the requirements for an [reference](../../shared/reference/) |
| `attributed_by`   | array         | Optional    | An array of json objects, each of which is a [Relationship Assignment](../../shared/assignment/) that relates the current digital object to another entity |
| `dimension` | array | Optional | An array of json objects, each of which is a [Dimension](../../shared/dimension), such as height, width or total number of bytes, of the described digital object |
| `part_of` | array | Optional | An array of json objects, each of which is a [reference](../../shared/reference/) to another Digital Object that the current digital object is a part of. |
| `format` | string | Optional | The media type of the described digital object, for example "image/jpeg" |
| `conforms_to` | array | Optional | An array of json objects, each of which is a [reference](../../shared/reference/) to an external specification that the current digital object conforms to. The `type` value of the reference MUST be `"InformationObject"` |
| `digitally_carries` | array | Optional | An array of json objects, each of which is a [reference](../../shared/reference/) to a [Textual Work](../textual_work/) that is carried by this digital object |
| `digitally_shows` | array | Optional | An array of json objects, each of which is a [reference](../../shared/reference/) to a [Visual Work](../visual_work/) that is shown by this digital object |
| `digitally_available_via` | array | Optional| An array of json objects, each of which is a Digital Service structure, defined below |
| `access_point` | array | Optional | An array of json objects, each of which is a [reference](../../shared/reference/) to a URI from which a representation of the digital object can be retrieved |
| `created_by` | json object | Optional | A json object representing the creation of the digital object, which follows the requirements for a [Creation](../../shared/activity) | 
| `used_for` | array | Optional | An array of json objects, each of which is a Publication Activity, which follows the requirements for an [Activity](../../shared/activity) |

### Properties of Digital Services

| Property Name     | Datatype      | Requirement | Description | 
|-------------------|---------------|-------------|-------------|
| `@context`        | string, array | Required    | The value MUST be the URI of the [Linked Art context](../../json-ld/) as a string, `"https://linked.art/ns/v1/linked-art.json"` or an array in which the URI is the last entry to allow for [extensions](../../json-ld/extensions) | 
| `id`              | string        | Required    | The value MUST be the HTTP(S) URI at which the digital object's description can be [dereferenced](../../protocol/) |  
| `type`            | string        | Required    | The class for the digital object, which MUST be the value `"DigitalService"` |
| `_label`          | string        | Recommended | A human readable label for the digital object, intended for developers |
| `classified_as`   | array         | Recommended | An array of json objects, each of which is a classification of the digital object and MUST follow the requirements for [Type](../../shared/type/) |
| `identified_by`   | array         | Recommended | An array of json objects, each of which is a name/title of the digital and MUST follow the requirements for [Name](../../shared/name/), or an identifier for the digital object and MUST follow the requirements for [Identifier](../../shared/identifier/) |
| `referred_to_by`  | array         | Optional    | An array of json objects, each of which is a human readable statement about the digital object and MUST follow the requirements for [Statement](../../shared/statement/) |
| `access_point` | array | Optional | An array of json objects, each of which is a [reference](../../shared/reference/) to a URI at which the service can be interacted with |
| `conforms_to` | array | Optional | An array of json objects, each of which is a [reference](../../shared/reference/) to an external specification that the digital service conforms to. The `type` value of the reference MUST be `"InformationObject"` |

### Property Diagram

> ![diagram](digital_properties.png){:.diagram_img width="600px"}

### JSON Schema

See the [schema documentation](../../schema_docs/digital) and the [schema itself](../../schema/digital.json)

### Incoming Properties

Digital Object instances are typically found as the object of the following properties, other than the self-referential properties above.  This list is not exhaustive, but is intended to cover the likely cases where other endpoints refer to digital objects.

| Property Name              | Source Endpoint | Description |
|----------------------------|-----------------|-------------|
| `digitally_carried_by`     | [Textual Work](../textual_work/) | Texts can be carried by physical objects, or digitally carried by digital objects |
| `digitally_shown_by`       | [Visual Work](../visual_work/)   | Similarly, Image content can be digitally shown by digital objects |


## Example

The JSON for a Digital Object entry for a digital image of a self-portrait by Van Gogh could be as below.

* It has the Linked Art context document reference in `@context`
* It self-documents its URI in `id`
* It has a `type` of "DigitalObject"
* It has a `_label` with the value "Digital Image of Self-Portrait of Van Gogh" for people reading the JSON
* It is `classified_as` a "Digital Image", which has an `id` of "aat:300215302"
* It is `identified_by` ...
    * ... a `Name`, with the content "Self-Portrait Dedicated to Paul Gauguin"
    * ... and an `Identifier`, with the content "47174896", which is `classified_as` an Owner-Assigned number
* It has two `Dimension` entries ...
    * ... a height ("aat:300055644") of 2550 pixels ("aat:300266190")
    * ... a width ("aat:300055647") of 2087 pixels ("aat:300266190")
* It is a `member_of` a Set of Van Gogh self-portraits (possibly both digital and physical)
* It is available to be retrieved from the URI in `access_point` 
* It has a media type (or MIME type) of "image/jpeg"
* It `digitally_shows` the same visual content as the physical painting
* It is `part_of` another Digital Object, in this case a IIIF Manifest
* It is `digitally_available_via` a Digital Service which ...
    * ... `conforms_to` the IIIF Image API
    * ... is available to be interacted with at the URI in `access_point`
* It was `created_by` a Creation which ...
    * ... was `carried_out_by` the Harvard Art Museums
    * ... `used_specific_object` of the physical painting

```crom
top = vocab.DigitalImage(ident="auto int-per-segment", label="Digital Image of Self-Portrait of Van Gogh")
top.identified_by = model.Name(content="Self-Portrait Dedicated to Paul Gauguin")
top.identified_by = vocab.LocalNumber(content="47174896")

top.access_point = model.DigitalObject(ident="https://ids.lib.harvard.edu/ids/iiif/47174896/full/full/0/default.jpg")
top.digitally_shows = model.VisualItem(ident="", label="Visual Content of Self-Portrait of Van Gogh")
top.format = "image/jpeg"
h = vocab.Height(value=2550)
w = vocab.Width(value=2087)
h.unit = vocab.instances['pixels']
w.unit = vocab.instances['pixels']
top.dimension = h
top.dimension = w
svc = model.DigitalService(label="IIIF Service")
svc.access_point = model.DigitalObject(ident="https://ids.lib.harvard.edu/ids/iiif/47174896")
svc.conforms_to = model.InformationObject(ident="https://iiif.io/api/image/2/context.json")
top.digitally_available_via = svc
cre = model.Creation()
cre.carried_out_by = model.Group(ident="harvardartmuseums.org", label="Harvard Art Museums")
cre.used_specific_object = model.HumanMadeObject(ident="https://harvardartmuseums.org/collections/object/299843", label="Self-Portrait of Van Gogh")
top.created_by = cre
top.member_of = model.Set(ident="auto int-per-segment", label="Images of Self-Portraits of Van Gogh")
top.part_of = model.DigitalObject(ident="https://iiif.harvardartmuseums.org/manifests/object/299843", label="IIIF Manifest")

```
