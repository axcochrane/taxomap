class RelationshipsController < ApplicationController
  def index
    @relationships = Relationship.all
  end

  def create
    @relationship = Relationship.new(relationship_params)
    if @relationship.save
      flash.notice = 'Relationship created successfully'
      redirect_to relationships_path
    else
      flash.alert = 'Error creating Relationship'
      redirect_to new_relationship_path
    end
  end

  private

  def relationship_params
    params.require(:relationship).permit(
      :title
    )
  end
end
