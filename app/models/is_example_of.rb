class IsExampleOf
  include Neo4j::ActiveRel
  to_class :Value
  from_class :any
  type 'IS_EXAMPLE_OF'

  property :created_at, type: DateTime
  property :updated_at, type: DateTime
end


