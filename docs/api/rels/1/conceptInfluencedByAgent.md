---
title: "HAL Link: conceptInfluencedByAgent"
---

## conceptInfluencedByAgent

Return the concepts that were influenced by the person or group.

See the related [model documentation](/model/concept/#creation-and-influences)

### Example

From the record for Rembrandt, the record for the concept 'Rembrandt -- Aesthetics' would be in the response


### Details

* Class Given: Agent
* Returns Class: Concept
* Relationship: influencedBy


### SPARQL
```
SELECT DISTINCT ?concept WHERE {
   ?concept crm:P94i_was_created_by ?creation .
   ?creation crm:P15_was_influenced_by <%current%>. }
```

