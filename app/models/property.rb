class Property
  include Neo4j::ActiveNode
  # enum data_type: {:string => 'string', :integer => 'integer', :datetime => 'datetime', :array => 'array', :text => 'text'}

  property :title, type: String
  property :data_type, type: String
  property :created_at, type: DateTime
  property :updated_at, type: DateTime

  has_many :out, :values, type: :HAS_VALUE, model_class: [:Value, :StringValue, :DateTimeValue]
end

