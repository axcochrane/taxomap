class ForceCreateDocUuidConstraint < Neo4j::Migrations::Base
  def up
    add_constraint :Doc, :uuid, force: true
  end

  def down
    drop_constraint :Doc, :uuid
  end
end
