---
title: "LUX Linked.Art Mapping"
---



## Introduction


## Sample Book Record

```crom

vocab.register_vocab_class("AttributionStatement", {"parent": model.LinguisticObject, "id": "300056109", "label": "Attribution Statement", "metatype": "brief text"})
vocab.register_vocab_class("CallNumber", {"parent": model.Identifier, "id": "300311706", "label": "Call Number"})
lccn_t = model.Type(ident="urn:uuid:5616ac0c-0dc1-4d61-ad8c-268171a1f13a", label="Library of Congress Control Number")
oclc_t = model.Type(ident="urn:uuid:4da773fa-3789-46cc-8d3e-70b8c5908471", label="OCLC Number")

top = model.LinguisticObject(ident="ils:yul:404593", label="Geschiedenis van Kalilah en Daminah")
top.classified_as = model.Type(ident="http://vocab.getty.edu/aat/300028051", label="Books")
top.identified_by = vocab.PrimaryName(content="Geschiedenis van Kalilah en Daminah : uit het Maleisch in het Madureesch")
top.identified_by = vocab.SortName(content="Geschiedenis van Kalilah en Daminah : uit het Maleisch in het Madureesch")

i1 = model.Identifier(content="98162582")
i1.classified_as = lccn_t
top.identified_by = i1
i2 = model.Identifier(content="(OCoLC)ocm39380652")
i2.classified_as = oclc_t
top.identified_by = i2
i3 = model.Identifier(content="404593")
i3.classified_as = oclc_t
top.identified_by = i3
i4 = vocab.CallNumber(content="PL5354 K25 1879")
aa = model.AttributeAssignment()
aa.carried_out_by = model.Group(ident="urn:uuid:ddedee1a-1159-467c-87f1-55d7fd10558e", label="Yale University Library")
i4.assigned_by = aa
top.identified_by = i4

top.referred_to_by = vocab.ProductionStatement(content="Batavia : Landsdrukkerij, 1879")
ps  = vocab.PhysicalStatement(content="329 pages ; 23 cm")
ps.identified_by = vocab.DisplayName(content="Physical Description")
top.referred_to_by = ps

#ls = vocab.LanguageStatement(content="In Madurese; text in Javanese script.")
#ls.identified_by = vocab.DisplayName(content="Language Note")
#top.referred_to_by = ls
#att = vocab.AttributionStatement(content="door Raden Pandji Adi Koro")
#att.identified_by = vocab.DisplayName(content="Attribution")
#top.referred_to_by = att
#dim1 = vocab.DimensionStatement(content="329 pages")
#dim1.identified_by = vocab.DisplayName(content="Extent")
#top.referred_to_by = dim1
#dim2 = vocab.DimensionStatement(content="23 cm")
#dim2.identified_by = vocab.DisplayName(content="Dimensions")
#top.referred_to_by = dim2

top.subject_of = vocab.WebPage(ident="https://search.library.yale.edu/catalog/404593")

sc = vocab.CollectionSet(ident="urn:uuid:26ab5fab-ba08-4cf6-9ea8-bcaad7270a29")
sc.identified_by = model.Name(content="Special Collections (YUL)")
top.member_of = sc
ms = vocab.CollectionSet(ident="urn:uuid:61c51d88-c9e1-46d9-b187-0945255e30e8")
ms.identified_by = model.Name(content="Holdings of Manuscripts and Archives")
top.member_of = ms

mad = model.Language(ident="http://id.loc.gov/vocabulary/languages/mad", label="Madurese")
mad.identified_by = model.Identifier(content="mad")
mal = model.Language(ident="http://id.loc.gov/vocabulary/languages/may", label="Malay")
mal.identified_by = model.Identifier(content="may")
ar = model.Language(ident="http://id.loc.gov/vocabulary/languages/ara", label="Arabic")
ar.identified_by = model.Identifier(content="ara")
top.language = mad
top.language = mal
top.language = ar

cre = model.Creation()
top.created_by = cre
part = model.Creation()
cre.part = part
who = model.Person(ident="urn:uuid:e0be51c3-0916-446d-a4ac-bef9c5771dda")
who.identified_by = model.Name(content="Adi Koro, Raden Pandji")
part.carried_out_by = who
part.classified_as = model.Type(ident="http://vocab.getty.edu/aat/300386174", label="Creator")

pub = vocab.Publishing()
top.used_for = pub
where = model.Place(ident="urn:uuid:51af0400-62c6-4e17-a0c8-7cbf8a3d57b0")
where.identified_by = model.Name(content="Indonesia")
where.equivalent = model.Place(ident="http://id.loc.gov/vocabulary/countries/io")
pub.took_place_at = where
ts = model.TimeSpan()
ts.begin_of_the_begin = "1879-01-01T00:00:00Z"
ts.identified_by = vocab.DisplayName(content="1879-")
pub.timespan = ts


lo = model.LinguisticObject()
lo.identified_by = model.Name(content=u"Kalilah wa-Dimnah")
top.about = lo
t = model.Type()
t.identified_by = model.Name(content="Fables, Arabic--Adaptations")
t.created_by = model.Creation()
f = model.Type()
f.identified_by = model.Name(content="Fables, Arabic")
t.created_by.influenced_by = f
f2 = model.Type()
f2.classified_as = model.Type(ident="http://vocab.getty.edu/aat/300226816", label="Form")
f2.identified_by = model.Name(content="Adaptions")
t.created_by.influenced_by = f2
top.about = t

```