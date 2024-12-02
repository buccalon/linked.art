---
title: Recommended Vocabulary Terms
up_href: "/model/vocab/"
up_label: "Vocabulary Terms"
---

[TOC]

## Introduction

These terms are recommended to be used in order to facilitate interoperability between datasets where possible. Please think carefully before choosing another concept for one in the lists below as it will be much harder to compare your data with others', however it will still be valid Linked Art if you do pick a different concept.

We are aware that unfortunately some of the lists here can be biased towards the needs of the first Linked Art implementers, and welcome any help in mitigating such biases. If you have suggestions for new terms or any other type of feedback, please do not hesitate to [reach out](https://linked.art/community/)!

<style>
	table {width: 100% ; table-layout: fixed}
	tr th:first-child {width: 18em}
	tr th:nth-child(2) {width: 10em}
	tr th:nth-child(3) {text-align: left}
</style>

## Types

### Name Types

See the [name documentation](/model/base/#names).

| Name                  | URI           | Description |
|-----------------------|---------------|-------------|
| Alternate Name        | aat:300264273 | An alternate name, as opposed to the primary name, of an entity |
| Given Name            | aat:300404651 | The given or first name of a Person |
| Middle Name           | aat:300404654 | The middle name of a Person |
| Family Name           | aat:300404652 | The family or sirname of a Person |
| Former Name           | aat:300435719 | A former name, for any reason, of a Person |


### Identifier Types

See the [identifier documentation](/model/base/#identifiers).

| Name                  | URI           | Description |
|-----------------------|---------------|-------------|
| Accession Number      | aat:300312355 | An accession number for the object |
| Local Number          | aat:300404621 | An identifier assigned by the institution but not an accession or system number |
| System Number         | aat:300435704 | An identifier assigned by an automated system, such as a collection management system |
| Call Number           | aat:300311706 | An identifier for where the object is physically in the repository, typically used in libraries |


### Statement Types 

These are embedded Linguistic Objects within other records. See the [statement documentation](/model/base/#statements-about-an-entity). The ["meta-type"](/model/base/#types-of-types) for these classifications is aat:300418049.


| Name                  | URI           | Description |
|-----------------------|---------------|-------------|
| Note                  | aat:300027200 | A general note about the entity  |
| Description           | aat:300435416 | A description of the entity  |
| Access Statement      | aat:300133046 | A statement about how to get access to the entity  |
| Bibliography Statement| aat:300026497 | A list of citations of the entity, typically in a consistent format  |
| Condition Statement   | aat:300435425 | A description of the physical condition of the object  |
| Credit Line           | aat:300026687 | A short statement of who should be acknowledged for the object   |
| Dimensions Statement  | aat:300435430 | A description of the dimensions of the object  |
| Exhibition Statement  | aat:300435424 | A statement or citation list about exhibitions that the object has been in  |
| Inscription Statement | aat:300435414 | A description of inscriptions on the object  |
| Markings Statement    | aat:300435420 | A description of non-inscription markings on the object  |
| Materials Statement   | aat:300435429 | A description or list of the materials the object is made of  |
| Production Statement  | aat:300435436 | A description of the production or creation of the object  |
| Provenance Statement  | aat:300435438 | A description or semi-structured value describing the ownership history of the object  |
| Rights Statement      | aat:300435434 | A description of copyright or other licenses pertaining to the object |
| Signature Statement   | aat:300028705 | A description of the artist's signature which is on the object, often part of the artwork |
| Summary               | aat:300026032 | A summary of the intellectual content of the object, as opposed to a Description of the object as a whole |


### Object Types

See the [object documentation](/model/object/) and base [classification documentation](/model/base/#types-and-classifications). The ["meta-type"](/model/base/#types-of-types) for these classifications is aat:300435443.

| Name                  | URI           | Description |
|-----------------------|---------------|-------------|
| Architecture          | aat:300263552 | Structure or part of a structure which is the result of conscious construction  |
| Armor                 | aat:300036745 | Clothing designed to protect the body in combat  |
| Book                  | aat:300028051 | Object comprised of a sequence of leaves of paper or other material, typically carrying language or image, and bound together into a codex  |
| Clothing              | aat:300266639 | Object made for the purpose of covering the body, excluding jewelry and accessories  |
| Coin                  | aat:300037222 | Object typically made of metal, used as currency |
| Decorative Arts       | aat:300411641 | Objects that are primarily utilitarian in form or function but have aesthetic value, including ceramics, furniture, textiles, glass, clocks and so on |
| Drawing               | aat:300033973 | Object created by application of lines on a surface  |
| Frame                 | aat:300404391 | Part of an object which surrounds a generally two dimensional artwork such as a painting  |
| Furniture             | aat:300037680 | Objects used for sitting, reclining, or storage, such as a chair or cabinet  |
| Jewelry               | aat:300209286 | Objects worn on the body for adornment rather than function typically of precious materials |
| Lithograph            | aat:300041379 | Prints created using the process of lithography  |
| Manuscript            | aat:300265483 | Handwritten books, typically decorated and illustrated  |
| Map                   | aat:300028094 | Flat object which depicts a representation of the Earth's surface, including physical and/or political features  |
| Miniature             | aat:300033936 | A painting on a very small scale, often excised from an illuminated Manuscript  |
| Mosaic                | aat:300015342 | Objects created by arrangement of small pieces of durable material, such as stone or colored glass  |
| Musical Instrument    | aat:300041620 | Object whose primary function is to enable the user to create music  |
| Painting              | aat:300033618 | Object created by application of colored liquid onto a surface  |
| Photograph            | aat:300046300 | Object produced by chemical action of light on a sensitive film  |
| Print                 | aat:300041273 | Objects created by transferring an image using a printing process  |
| Sculpture             | aat:300047090 | Object created by carving or engraving a hard material or molding a malleable material  |
| Stained Glass         | aat:300263722 | Objects made of colored glass, often in the form of a window, meant to be observed through refracted light |
| Tapestry              | aat:300205002 | A woven textile object, typically hung on a wall  |


### Place Types

See the [place documentation](/model/place/)

| Name                  | URI           | Description |
|-----------------------|---------------|-------------|
| Continent             | aat:300128176 | The Place is a continent (Europe, Asia, North America, etc)  |
| Country               | aat:300128207 | The Place is a country or Nation (France, Japan, USA, etc) |
| State                 | aat:300000776 | The Place is a state (New York, California, etc) |
| Province              | aat:300000774 | The Place is a province or similar region (Ontario, Yorkshire, etc) |
| County                | aat:300000771 | The Place is a county (New Haven county, etc) |
| City                  | aat:300008389 | The Place is a city (Paris, Chicago, Tokyo, etc) |
| Museum (as Place)     | aat:300005768 | The Place is a museum location |
| Gallery               | aat:300240057 | The Place is a (museum) gallery room in which art is displayed |


### Group Types

See the person and [group documentation](/model/actor/)

| Name                  | URI           | Description |
|-----------------------|---------------|-------------|
| Company               | aat:300160084 | The Group is a commercial company or business |
| Department            | aat:300263534 | The Group is a department of another organization  |
| Family                | aat:300055474 | The Group is an (extended) family related by blood and/or marriage |
| Museum                | aat:300312281 | The Group is a museum |
| Organization          | aat:300025948 | The Group is an organization or society of some sort |


### Digital Types
 
See the [digital objects documentation](/model/digital/) 

| Name                  | URI           | Description |
|-----------------------|---------------|-------------|
| Digital Image         | aat:300215302 | The Digital Object is an image |
| Web Page              | aat:300264578 | The Digital Object is a web page |


### Set Types

See the [collection documentation](model/collection/)

| Name                  | URI           | Description |
|-----------------------|---------------|-------------|
| Archive               | aat:300375748 | The Set is a top level Archive |
| Archival Grouping     | aat:300404022 | The Set is some grouping within an archive |
| Archival Sub-Grouping | aat:300404023 | The Set is some grouping within an archival grouping |
| Collection            | aat:300025976 | The Set is a collection of things, typically physical objects and managed by an organization |


### Dimension Types

See the [dimensions documentation](/model/object/physical/#dimensions)

| Name                  | URI           | Description |
|-----------------------|---------------|-------------|
| Depth                 | aat:300072633 | The Dimension measures the depth of the entity, from the front to the back |
| Height                | aat:300055644 | The Dimension measures the height of the entity, from the top to the bottom |
| Unknown Physical Dimension | aat:300055642 | The Dimension measures some unknown physical dimension of the entity |
| Weight                | aat:300056240 | The Dimension measures the weight of the entity |
| Width                 | aat:300055647 | The Dimension measures the width of the object, from left to right |

## Instances

### Languages

Below is a short list of common languages. Please see the table for [languages](languages) for a more complete list.

| Name                  | URI           | Description |
|-----------------------|---------------|-------------|
|ancient greek          | aat:300387827 |Ancient Greek |
|arabic                 | aat:300387843 |Arabic |
|chinese                | aat:300388113 |Chinese |
|danish                 | aat:300388204 |Danish |
|dutch                  | aat:300388256 |Dutch |
|english                | aat:300388277 |English |
|farsi                  | aat:300388296 |Farsi |
|finnish                | aat:300388299 |Finnish |
|french                 | aat:300388306 |French |
|german                 | aat:300388344 |German |
|greek                  | aat:300388361 |Greek |
|hebrew                 | aat:300388401 |Hebrew |
|hindi                  | aat:300388412 |Hindi |
|icelandic              | aat:300388449 |Icelandic |
|irish                  | aat:300388467 |Irish |
|italian                | aat:300388474 |Italian |
|japanese               | aat:300388486 |Japanese |
|korean                 | aat:300388633 |Korean |
|latin                  | aat:300388693 |Latin |
|norwegian              | aat:300388992 |Norwegian |
|polish                 | aat:300389109 |Polish |
|portuguese             | aat:300389115 |Portuguese |
|romanian               | aat:300389157 |Romanian |
|russian                | aat:300389168 |Russian |
|spanish                | aat:300389311 |Spanish |
|swedish                | aat:300389336 |Swedish |
|tamil                  | aat:300389365 |Tamil |
|thai                   | aat:300389405 |Thai |
|turkish                | aat:300389470 |Turkish |
|urdu                   | aat:300389502 |Urdu |
|welsh                  | aat:300389555 |Welsh |

### Measurement Units

| Name                  | URI           | Description |
|-----------------------|---------------|-------------|
|bytes                  | aat:300265869 |bytes |
|centimeters            | aat:300379098 |centimeters |
|days                   | aat:300379242 |days |
|feet                   | aat:300379101 |feet |
|gigabytes              | aat:300265874 |gigabytes |
|grams                  | aat:300379225 |grams |
|hours                  | aat:300379241 |hours |
|inches                 | aat:300379100 |inches |
|kilobytes              | aat:300265870 |kilobytes |
|kilograms              | aat:300379226 |kilograms |
|megabytes              | aat:300265873 |megabytes |
|meters                 | aat:300379099 |meters |
|minutes                | aat:300379240 |minutes |
|millimeters            | aat:300379097 |millimeters |
|months                 | aat:300379245 |months |
|partsUnit              | aat:300404159 |parts |
|percent                | aat:300417377 |percent |
|pounds                 | aat:300379254 |pounds |
|seconds                | aat:300379239 |seconds |
|years                  | aat:300379244 |years |


### Materials

| Name                  | URI           | Description |
|-----------------------|---------------|-------------|
|bone                   | aat:300011798 | bone |
|bronze                 | aat:300010957 | bronze |
|canvas                 | aat:300014078 | canvas |
|chalk                  | aat:300011727 | chalk |
|clay                   | aat:300010439 | clay |
|copper                 | aat:300011020 | copper |
|glass                  | aat:300010797 | glass |
|gold leaf              | aat:300264831 | gold leaf |
|graphite               | aat:300011098 | graphite |
|ink                    | aat:300015012 | ink |
|marble                 | aat:300011443 | marble |
|metal                  | aat:300010900 | metal |
|oak                    | aat:300012264 | oak |
|oil paint              | aat:300015050 | oil |
|paper                  | aat:300014109 | paper |
|plaster                | aat:300014922 | plaster|
|silver                 | aat:300011029 | silver |
|stone                  | aat:300011176 | stone |
|tempera                | aat:300015062 | tempera |
|terracotta             | aat:300010669 | terracotta |
|watercolor             | aat:300015045 | watercolors |
|wood                   | aat:300011914 | wood |

### Currencies

| Name                  | URI           | Description |
|-----------------------|---------------|-------------|
|british pounds         | aat:300411998 | British Pounds |
|canadian dollar        | aat:300412000 | Canadian Dollars |
|euros                  | aat:300411996 | Euros |
|Japanese Yen           | aat:300411997 | Japanese Yen |
|swiss franc            | aat:300412001 | Swiss Francs |
|us dollars             | aat:300411994 | US Dollars |


### Nationalities

The ["meta-type"](/model/base/#types-of-types) for these classifications is aat:300379842.

Below is a short list of common nationalities or cultures. Please see the table for [nationalities and cultures](nationalities) for a more complete list.

| Name                  | URI           | Description |
|-----------------------|---------------|-------------|
|american               | aat:300107956 | American |
|austrian               | aat:300111153 | Austrian |
|australian             | aat:300021861 | Australian |
|belgian                | aat:300111156 | Belgian |
|british                | aat:300111159 | British |
|canadian               | aat:300107962 | Canadian |
|chinese                | aat:300018322 | Chinese |
|czech                  | aat:300111166 | Czech |
|danish                 | aat:300111172 | Danish |
|dutch                  | aat:300111175 | Dutch |
|egyptian               | aat:300020251 | Egyptian |
|flemish                | aat:300111184 | Flemish |
|french                 | aat:300111188 | French |
|german                 | aat:300111192 | German |
|greek                  | aat:300264816 | Greek |
|hungarian              | aat:300111195 | Hungarian |
|indian                 | aat:300018863 | Indian |
|irish                  | aat:300111259 | Irish |
|italian                | aat:300111198 | Italian |
|japanese               | aat:300018519 | Japanese |
|mexican                | aat:300107963 | Mexican |
|new zealand            | aat:300021959 | New Zealander |
|norwegian              | aat:300111201 | Norwegian |
|polish                 | aat:300111204 | Polish |
|portuguese             | aat:300111207 | Portuguese |
|russian                | aat:300111276 | Russian |
|spanish                | aat:300111215 | Spanish |
|swedish                | aat:300111218 | Swedish |
|swiss                  | aat:300111221 | Swiss |


### Occupations

The ["meta-type"](/model/base/#types-of-types) for these classifications is aat:300263369.

| Name                  | URI           | Description |
|-----------------------|---------------|-------------|
|artist                 | aat:300025103 | Artist |
|collector              | aat:300025234 | Art Collector |
|dealer                 | aat:300025236 | Art Dealer |
|architect	            | aat:300024987 | Architect |
|author	                | aat:300025492 | Author |
|composer	            | aat:300025671 | (Music) Composer |
|printer	            | aat:300025732 | Printer |
|publisher	            | aat:300025574 | Publisher |


### Shapes

The ["meta-type"](/model/base/#types-of-types) for these classifications is aat:300056273.

| Name                  | URI           | Description |
|-----------------------|---------------|-------------|
|arched                 | aat:300126995 | Arched |
|circle                 | aat:300263827 | Circle |
|oblong                 | aat:300311843 | Oblong |
|octagonal              | aat:300263824 | Octagonal |
|oval                   | aat:300263817 | Oval |
|rectangular            | aat:300263831 | Rectangular |
|square                 | aat:300263832 | Square |
|upright                | aat:300343370 | Upright |

