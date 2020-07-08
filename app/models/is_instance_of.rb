class IsInstanceOf
  include Neo4j::ActiveRel
  from_class :Instance
  to_class :Concept
  type 'IS_INSTANCE_OF'

  property :created_at, type: DateTime
  property :updated_at, type: DateTime
end

