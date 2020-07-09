class ForceCreateStringValueUuidConstraint < Neo4j::Migrations::Base
  def up
    add_constraint :StringValue, :uuid, force: true
  end

  def down
    drop_constraint :StringValue, :uuid
  end
end
