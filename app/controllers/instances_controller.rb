class InstancesController < ApplicationController
  def index
    @instances = Instance.all
  end

  def create
    @instance = Instance.new(instance_params)
    if @instance.save
      flash.notice = 'Instance created successfully'
      redirect_to instances_path
    else
      flash.alert = 'Error creating Instance'
      redirect_to new_instance_path
    end
  end

  def edit 
    @instance = Instance.find(params[:id])
  end

  def update
    @instance = Instance.find(params[:id])
    @type = Concept.find(concept_params[:type])
    @properties = concept_params[:properties]
    @values = concept_params[:values]

    if @instance.save
      flash.notice = 'Instance updated successfully'
      redirect_to instances_path
    else
      flash.alert = 'Error updating Instance'
      redirect_to instances_path
    end
  end

  private

  def instance_params
    params.require(:instance).permit(
      :uuid,
      :type
    )
  end
end
