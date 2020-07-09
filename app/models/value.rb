class Value
  include Neo4j::ActiveNode
  property :data, type: String
  property :created_at, type: DateTime
  property :updated_at, type: DateTime
  has_one :in, :type, model_class: :Property, rel_class: :IsAValueOf
end

class StringValue < Value
  property :data, type: String
end

class DateTimeValue < Value
  property :data, type: DateTime
end

class IntegerValue < Value
  property :data, type: Integer
end

class ArrayValue < Value
  property :data, type: Array
end

class TextValue < Value
  property :data, type: Text
end

