---
title: Encounters with Objects
up_href: "/model/provenance/"
up_label: "Provenance"
---

[TOC]

## Introduction

Objects can be encountered a long time after their production, especially in the realm of archaeology. These encounters are often called "finds" and the locations they take place at "find spots", but the object may have been never lost according to another culture that always knew about it. Encounters are frequently of objects from a long-vanished civilization, such as the Greek or Roman empires, but not necessarily. The object might be buried under the ash of a volcanic eruption, lost at sea, or otherwise pass out of human memory and record as far as the documenting institution is aware.

There might be multiple encounters recorded in a provenance chain, such as when an object is known to have been encountered and subsequently lost by a previous culture, and then rediscovered. 


## Encounters

Objects of cultural significance are often lost to all knowledge, or to the general knowledge of the prevailing culture, and then later rediscovered. This is considered to be part of the provenance of the object, rather than equivalent to its Production, especially as both may be known. There are also ownership considerations that need to be taken into account at the same time, as to whether this find also transfers the ownership of the object to the discoverer, or merely custody of it.

The model uses an `Encounter` activity, which is carried out by the person or group making the discovery. The activity has its own relationship for the object that is rediscovered, `encountered`, to ensure that other objects that are used as part of the discovery can be separated from the "find".
As it is part of a Provenance Event, other parts can describe the changing ownership status of the object.  In all other ways, the `Encounter` is just like a regular `Activity` as described in the [baseline patterns](/model/base/#events-and-activities).

Note that Encounters may also be included directly in the object's description without ownership implications, in the same way as for simple acquistions.

__Example:__

The "Statue of a Victorious Youth" was discovered in 1964 off the coast of Italy by a fishing trawler, thereby taking ownership of it.

```crom
top = vocab.ProvenanceEntry(ident="getty_bronze/1", label="Discovery of Victorious Youth")
what = model.HumanMadeObject(ident="victorious_youth", label="Victorious Youth")
who = model.Group(ident="ferruccio", label="Owners of Ferri Ferruccio")
enc = model.Encounter(label="Encounter of Sculpture")
enc.encountered = what
enc.carried_out_by = who
top.part =  enc
acq = model.Acquisition()
acq.transferred_title_of = what
acq.transferred_title_to = who
top.part = acq
```
