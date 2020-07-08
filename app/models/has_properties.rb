class HasProperties
  include Neo4j::ActiveRel
  from_class :Concept
  to_class :Property
  type 'HAS_PROPERTIES'

  property :created_at, type: DateTime
  property :updated_at, type: DateTime
end


