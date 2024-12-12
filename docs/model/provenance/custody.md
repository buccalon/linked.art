---
title: Loans, Thefts, Losses and other Changes of Custody
up_href: "/model/provenance/"
up_label: "Provenance"
---



## Introduction

When there is a change of who has physical possession of an object, but not who the legal owner of it is, that constitutes a change of custody rather than a change of ownership.  This pattern includes use cases such as lending an object to another party for some amount of time, the theft of an object (as the legal owner does not change), and losing track of the location of an object. 

## Loans

The model makes a distinction between the [transfer of legal ownership](../acquisition) and the transfer of custody of an object (e.g. by losing the object or loaning it out for an exhibition). If the possession of the object is temporary, such that the object would be given back to the real owner at the end of that possession without what might be considered a sale or exchange, then it is a transfer of custody.  Note that the provenance activity here does not represent the entire duration of the change in custody, only the transfer of it.  Just like acquisitions, there would be a second provenance activity that would transfer the custody back to the original custodian or on to some other party.

Long term loans or even "permanent" loans are just open ended pairs of activities -- the object has had its custody transferred, and the object has not been returned yet.

In the model, these transfers of custody use a different class, `TransferOfCustody` instead of `Acquisition`. The properties that capture the parties and object involved are also different, although equivalent, to those of `Acquisition`: `transferred_custody_of` the object, `transferred_custody_from` the previous custodian, and `transferred_custody_to` the new custodian.

__Example:__

Spring is lent by the Getty to the Art Institute of Chicago.

```crom
top = vocab.ProvenanceEntry(ident="spring_aic/1", label="Loan of Spring to AIC")
loan = vocab.Loan()
top.part = loan
loan.transferred_custody_of = model.HumanMadeObject(ident="spring", label="Spring")
loan.transferred_custody_from = model.Group(ident="getty", label="Getty Museum")
loan.transferred_custody_to = model.Group(ident="aic", label="Art Institute of Chicago")
```

Which would typically be followed by a later return with the same form:

```crom
top = vocab.ProvenanceEntry(ident="spring_getty/1", label="Return of Spring to Getty")
loan = vocab.ReturnOfLoan(label="Return")
top.part = loan
loan.transferred_custody_of = model.HumanMadeObject(ident="spring", label="Spring")
loan.transferred_custody_to = model.Group(ident="getty", label="Getty Museum")
loan.transferred_custody_from = model.Group(ident="aic", label="Art Institute of Chicago")
```

## Institutional Ownership, Departmental Custody

Objects are owned by legal entities, such as museum organizations or individual people. However there may be more information about which department is responsible within a museum for the curation of the object. This is the division between acquisitions (the legal ownership of the object) and custody (the responsibility for looking after the object). If the department is known, then it should be either part of the Provenance Event in which the object is acquired, or a separate provenance event if the object was not accessioned by a department and later came under their care, or was transferred between departments. In these latter cases, the ownership does not change, only the custody of the object.

The department becomes the `current_keeper` of the object, whereas the institution is the `current_owner`, as described in the [object section](/model/object/ownership/). The transfer model is otherwise identical to other transfers of custody.

__Example:__

Spring is acquired by the Getty, and custody given to the Paintings department.

```crom
top = vocab.ProvenanceEntry(ident="payneheirs_getty/2", label="Purchase of Spring")
buyer = model.Group(ident="getty", label="J. Paul Getty Museum")
seller = model.Group(ident="payne_heirs", label="Family of Oliver Payne")
dept = model.Group(ident="getty_ptgs", label="Paintings Department")
what = model.HumanMadeObject(ident="spring", label="Spring")
acq = model.Acquisition(label="Acquisition of Painting")
top.part = acq
acq.transferred_title_of = what
acq.transferred_title_from = seller
acq.transferred_title_to = buyer
cust = model.TransferOfCustody(label="Custody by Department")
top.part = cust
cust.transferred_custody_of = what
cust.transferred_custody_from = seller
cust.transferred_custody_to = dept
```

## Theft and Loss

The theft of an object is also the (illegal) transfer of custody of the object, rather than a transfer of ownership. If the stolen object were recovered, then it would be restored to its owner. Stolen, or looted as a special case of theft, objects and their repatriation are an interesting and important part of the provenance of a work and frequently contested. A single theft event might involve stealing multiple objects, in the same way that the purchase of an auction lot might involve the acquisition of multiple objects for a combined payment.

An object being lost (as opposed to stolen) is the transfer of custody away from its current owner, without stating a recipient.  In the future, if the object is discovered, the recipient might be able to be filled in.  If the object is then returned to the owner, there would be the reverse transfer of custody from the party that found it.  It might be that the owner simply loses track of it, and although it is still in their possession, they are not aware of it ... it has no custodian, but it has not moved and the owner still owns it.

__Example:__

The Mona Lisa was stolen from the Louvre in 1911 by Vincenzo Peruggia.

```crom
top = vocab.ProvenanceEntry(ident="mona_lisa_theft/1", label="Theft of Mona Lisa")
ts = model.TimeSpan()
ts.begin_of_the_begin = "1911-08-21T00:00:00Z"
ts.end_of_the_end = "1911-08-21T23:59:59Z"
own = model.Group(ident="louvre", label="Louvre")
thf = model.Person(ident="peruggia", label="Vincenzo Peruggia")
what = model.HumanMadeObject(ident="monalisa", label="Mona Lisa")
xfer = vocab.Theft()
xfer.transferred_custody_of = what
xfer.transferred_custody_from = own
xfer.transferred_custody_to = thf
top.part = xfer
```

### Sale of Stolen or Looted Objects

If a stolen object is sold, then that purchase is actually just a transfer of custody in exchange for money (or other payment). Typically, of course, the nature of that transaction is not discovered until long after the fact. This can then have many effects on the provenance record for the object as suddenly many acquisitions would be retroactively changed to being transfers of custody. This updating of the historical record is necessary without going to great lengths to model the belief that an acquisition is legal for the vast majority of cases when it is, just to allow that belief to be incorrect for the few times when it is not.

__Example:__

A painting by Joseph Henry Sharp, "Cheyenne Oklahoma", was stolen from the Harwood Museum in Taos, New Mexico and then sold (at auction) for $52,650 to an undisclosed buyer.

```crom
top = vocab.ProvenanceEntry(ident="sharp_sale/1", label="Purchase of Stolen Painting")
thf = model.Person(ident="alter", label="Jerry Alter")
what = model.HumanMadeObject(ident="cheyenne", label="Cheyenne Oklahoma")
xfer = model.TransferOfCustody(label="Sale of Painting")
xfer.classified_as = model.Type(ident="http://vocab.getty.edu/aat/300438484", label="sale of stolen goods")
top.part = xfer
xfer.transferred_custody_of = what
xfer.transferred_custody_from = thf
pay = model.Payment()
pay.paid_to = thf
amnt = model.MonetaryAmount(label="Payment to Thief")
amnt.value = 52650
amnt.currency = vocab.instances['us dollars']
pay.paid_amount = amnt
top.part = pay
```

## Exhibitions

Exhibitions are a common way that the custody of an object changes, while the ownership remains the same.  Exhibitions are described in more detail [here](/model/exhibition/).
