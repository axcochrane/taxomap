class Relationship
  include Neo4j::ActiveRel
  from_class :any
  to_class :any

  property :created_at, type: DateTime
  property :updated_at, type: DateTime
end

