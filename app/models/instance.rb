class Instance
  include Neo4j::ActiveNode
  property :created_at, type: DateTime
  property :updated_at, type: DateTime

  has_one :in, :type, model_class: :Concept, rel_class: :IsInstanceOf
end

