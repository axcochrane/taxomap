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
    @properties = concept_params[:properties]

    p "paramz = #{params[:concept]}"
    p "paramz2 = #{concept_params}"
    p "paramz3 = #{concept_params[:properties]}"
    p "paramz4 = #{concept_params[:parent]}"

    p "parent = #{@parent.title}"
    p "concept = #{@concept.inspect}"
    p "properties = #{@properties.inspect}"
    p "parent rel = #{@parent_rel.inspect}"

    @concept.parent = @parent
    @properties.reject(&:blank?).each do |prop_id|
      prop = Property.find(prop_id)
      p "adding property = #{prop.inspect}"
      @concept.properties << prop 
    end
    
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
      :properties,
      properties: {},
      properties: [] 
    )
  end
end
