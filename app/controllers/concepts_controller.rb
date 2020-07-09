class ConceptsController < ApplicationController
  def index
    @concepts = Concept.all.order(title: 'ASC')
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
  
  def destroy 
    @concept = Concept.find(params[:id])
    if @concept.destroy
      flash.notice = 'Concept deleted successfully'
      redirect_to concepts_path
    else
      flash.alert = 'Error deleting Concept'
      redirect_to concepts_path
    end
  end

  def update
    @concept = Concept.find(params[:id])
    @parent = Concept.find(concept_params[:parent])
    @properties = concept_params[:properties]
    @concepts = concept_params[:concepts]
    @instances = concept_params[:instances]

    p "paramz = #{params[:concept]}"
    p "paramz2 = #{concept_params}"
    p "paramz3 = #{concept_params[:properties]}"
    p "paramz4 = #{concept_params[:parent]}"
    p "paramz5 = #{concept_params[:concepts]}"
    p "paramz6 = #{concept_params[:instances]}"

    p "parent = #{@parent.title}"
    p "concept = #{@concept.inspect}"
    p "properties = #{@properties.inspect}"
    p "parent rel = #{@parent_rel.inspect}"

    @concept.parent = @parent
    @concept.properties = []
    @concept.concepts = []

    @properties.reject(&:blank?).each do |prop_id|
      prop = Property.find(prop_id)
      @concept.properties << prop 
    end

    @concepts.reject(&:blank?).each do |concept_id|
      concept = Concept.find(concept_id)
      @concept.concepts << concept 
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
      properties: [],
      concepts: [],
      instances: [] 
    )
  end
end
