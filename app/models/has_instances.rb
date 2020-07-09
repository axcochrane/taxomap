class HasInstances
  include Neo4j::ActiveRel
  from_class :Instance
  to_class :Concept
  type 'HAS_INSTANCES'

  property :created_at, type: DateTime
  property :updated_at, type: DateTime
end


