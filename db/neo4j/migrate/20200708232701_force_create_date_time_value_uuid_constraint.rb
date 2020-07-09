class ForceCreateDateTimeValueUuidConstraint < Neo4j::Migrations::Base
  def up
    add_constraint :DateTimeValue, :uuid, force: true
  end

  def down
    drop_constraint :DateTimeValue, :uuid
  end
end
