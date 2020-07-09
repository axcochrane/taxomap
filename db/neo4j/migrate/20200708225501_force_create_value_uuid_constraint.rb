class ForceCreateValueUuidConstraint < Neo4j::Migrations::Base
  def up
    add_constraint :Value, :uuid, force: true
  end

  def down
    drop_constraint :Value, :uuid
  end
end
