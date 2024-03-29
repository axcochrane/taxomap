class Concept
  include Neo4j::ActiveNode
  property :title, type: String
  property :created_at, type: DateTime
  property :updated_at, type: DateTime

  has_one :in, :parent, model_class: :Concept, rel_class: :IsParent
  has_many :out, :properties, model_class: :Property, rel_class: :HasProperties 
  has_many :out, :concepts, model_class: :Concept, rel_class: :HasConcepts 
  has_many :out, :instances, model_class: :Instance, rel_class: :HasInstances 
end
