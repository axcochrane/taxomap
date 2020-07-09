class HasValue
  include Neo4j::ActiveRel
  from_class :any
  to_class :Value
  type 'HAS_VALUE'

  property :created_at, type: DateTime
  property :updated_at, type: DateTime
end


