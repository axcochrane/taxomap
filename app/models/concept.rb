class Concept
  include Neo4j::ActiveNode
  property :title, type: String
  property :created_at, type: DateTime
  property :updated_at, type: DateTime

  has_one :in, :parent, type: :parent, model_class: :Concept
  has_many :in, :properties, type: :Property
end
