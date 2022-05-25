1. Find all Authors

PREFIX ns1: <http://exampleDb.org/>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
SELECT ?authorName
WHERE {
?author rdf:type ns1:author .
?author ns1:personName ?authorName .
}  ORDER BY ?authorName

2.1 Find all properties whose domain is Author without the properties inherited from it superclass

PREFIX ns1: <http://exampleDb.org/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
SELECT *
WHERE {
?propertiesOfAuthor rdfs:domain ns1:author .
}

2.2 Find all properties whose domain is Author with the properties inherited from it superclass

PREFIX ns1: <http://exampleDb.org/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
SELECT ?propertiesOfAuthor
WHERE {
        {
   ?propertiesOfAuthor rdfs:domain ns1:author .
        }
UNION
{
        ns1:author rdfs:subClassOf ?base .
        ?propertiesOfAuthor rdfs:domain ?base .
        }
}

3. Find all properties whose domain is either Conference or Journal.

PREFIX ns1: <http://exampleDb.org/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
SELECT  *
WHERE {{
?properties rdfs:domain ns1:journal .
}
UNION{
?properties rdfs:domain ns1:conference .
}
}

4. Find all the papers written by a given author that was published in the database conferences.

PREFIX ns1: <http://exampleDb.org/>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
SELECT distinct ?title ?authorName ?conferenceName
WHERE {
     ?paper rdf:type ns1:Paper .
?author rdf:type ns1:author .
?conference rdf:type ns1:conference.
?author ns1:personName ?authorName.
FILTER ( ?authorName = "Fullwood D." ) .
?author ns1:wrote ?paper .
?paper ns1:paperName ?title .
?paper ns1:relatedto ns1:db .
?paper ns1:submittedIn ?conference .
?conference ns1:venueName ?conferenceName .
}



