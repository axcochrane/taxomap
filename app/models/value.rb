class Value
  include Neo4j::ActiveNode

  property :data, type: String
  property :created_at, type: DateTime
  property :updated_at, type: DateTime

  has_one :in, :property_type, model_class: :Property, rel_class: :IsExampleOf
  has_one :in, :instance, model_class: :Instance, rel_class: :HasValue
end

class StringValue < Value
  property :data, type: :string
end

class DateTimeValue < Value
  property :data, type: :datetime
end

class IntegerValue < Value
  property :data, type: :integer
end

class ArrayValue < Value
  property :data, type: :array
end

class TextValue < Value
  property :data, type: :text
end

