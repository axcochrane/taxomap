class IsAValueOf
  include Neo4j::ActiveRel
  from_class :Property
  to_class :any
  type 'IS_A_VALUE_OF'

  property :created_at, type: DateTime
  property :updated_at, type: DateTime
end

