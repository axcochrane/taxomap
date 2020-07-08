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

  def edit 
    @concept = Concept.find(params[:id])
  end

  def update
    @concept = Concept.find(params[:id])
    @parent = Concept.find(concept_params[:parent])
    # @parent_rel = Parent.new(from_node: @concept, to_node: @parent)
    # @property = Property.find(concept_params[:properties])
    # @concept.properties << @property
    p "paramz = #{params[:concept]}"
    p "paramz2 = #{concept_params}"
    p "paramz3 = #{concept_params[:properties]}"
    # p "paramz4 = #{@property.title}"
    p "paramz5 = #{concept_params[:parent]}"

    p "parent = #{@parent.title}"
    # p "concept = #{@concept.inspect}"
    # p "property = #{@property.inspect}"
    # p "parent rel = #{@parent_rel.inspect}"
    @concept.parent = @parent
    
    if @concept.save
      flash.notice = 'Concept updated successfully'
      redirect_to concepts_path
    else
      flash.alert = 'Error updating Concept'
      redirect_to concepts_path
    end
  end

  private

  def concept_params
    params.require(:concept).permit(
      :title,
      :parent,
      :has_properties
    )
  end
end
