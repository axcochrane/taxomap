class ConceptsController < ApplicationController
  def index
    @concepts = Concept.all
  end

  def create
    @concept = Concept.new(concept_params)
    if @concept.save
      flash.notice = 'Concept created successfully'
      redirect_to concepts_path
    else
      flash.alert = 'Error creating Concept'
      redirect_to new_concept_path
    end
  end

  private

  def concept_params
    params.require(:concept).permit(
      :title
    )
  end
end
