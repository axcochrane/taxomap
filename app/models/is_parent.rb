class IsParent
  include Neo4j::ActiveRel
  from_class :Concept
  to_class :Concept
  type 'IS_PARENT'

  property :created_at, type: DateTime
  property :updated_at, type: DateTime
end
