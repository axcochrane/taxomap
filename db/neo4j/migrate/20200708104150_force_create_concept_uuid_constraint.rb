class ForceCreateConceptUuidConstraint < Neo4j::Migrations::Base
  def up
    add_constraint :Concept, :uuid, force: true
  end

  def down
    drop_constraint :Concept, :uuid
  end
end
