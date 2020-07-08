class Instance
  include Neo4j::ActiveNode
  property :type, type: String
  property :created_at, type: DateTime
  property :updated_at, type: DateTime
end

