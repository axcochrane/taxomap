class Instance
  include Neo4j::ActiveNode
  property :created_at, type: DateTime
  property :updated_at, type: DateTime

  has_one :in, :concept_type, model_class: :Concept, rel_class: :IsInstanceOf
  has_many :out, :values, model_class: :Value, rel_class: :HasValue
end

