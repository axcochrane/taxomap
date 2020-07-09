class ForceCreatePropertyDataTypeIndex < Neo4j::Migrations::Base
  def up
    add_index :Property, :data_type, force: true
  end

  def down
    drop_index :Property, :data_type
  end
end
