class ForceCreateInstanceUuidConstraint < Neo4j::Migrations::Base
  def up
    add_constraint :Instance, :uuid, force: true
  end

  def down
    drop_constraint :Instance, :uuid
  end
end
