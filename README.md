# Taxomap

## Overview
Taxomap (Taxonomy Mapper) is a lightweight rails app that allows you to create custom
taxonomies using a Neo4j graph database.

## Setup
git clone the application then run `bundle` to install the dependencies
run `rake neo4j:install[community-latest]` to install the Neo4j graph DB
then `rake neo4j:start` to start the DB
launch the application using standard `rails server` command

## Core Working
Taxomap has 4 first class concepts:
  - Concepts
  - Instances
  - Values
  - Properties

**Concepts** are the primary containers for any distinct think of which you wish
to make a note or record. They must themselves have a parent concept with the ultimate
parent Concept being _Concept_ itself. Direct children of _Concept_ are _Abstract Concept_
and _Concrete Object_

`Instances` are individual examples of the _Concept_ type. E.g. Isaac Newton would be an
example of instance of the _Concept_ type 'Academic' (we would first have to create this
concept type).

`Properties` are essentially Types of value that we would like be available on a
Concept instance when it is created. E.g. Isaac Newton would be an _Instance_ of the
_Person_ with the _Property_ `DOB` and corresponding _Value_ `04-01-1643`

`Values` are to _Properties_ as _Instances_ are to _Concepts_. In that they are individual
datapoints of the given Property type.

## Usage
Each Concept must have a parent Concept so that we create a heirarchy of Concept. Without
this we aren't able to create a useful working Taxonomy which implies that there is some
sort of heirarchy in our method of categorisation.

Each Concept can be created with any number of Properties e.g. a Book might have the _Properties_ of
'Title', 'ISBN', 'Publiser' etc.

Each Concept can also have any number of links to other Concepts. This is the key feature which
brings a richness to our datamodel. Linking Concepts properly is what will allow us to create queries
that otherwise would not be possible with a typical RDBMS.

head to `localhost:7474` to access the Neo4j viewer to see the graph model of your created concepts.


