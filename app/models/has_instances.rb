class HasInstances
  include Neo4j::ActiveRel
  from_class :Concept
  to_class :Instance
  type 'HAS_INSTANCES'

  property :created_at, type: DateTime
  property :updated_at, type: DateTime
end


