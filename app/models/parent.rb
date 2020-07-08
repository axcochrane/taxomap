class Parent
  include Neo4j::ActiveRel
  from_class :concept
  to_class :concept
  type :HAS_PARENT

  property :created_at, type: DateTime
  property :updated_at, type: DateTime
end
