class InstancesController < ApplicationController
  def index
    @instances = Instance.all
  end

  def create
    @instance = Instance.create()
    @concept = Concept.find(instance_params[:concept])
    p "instance = #{@instance.inspect}"
    p "concept = #{@concept.inspect}"
    if IsInstanceOf.create(from_node: @instance, to_node: @concept)
      flash.notice = 'Instance created successfully'
      redirect_to instances_path
    else
      flash.alert = 'Error creating Instance'
      redirect_to new_instance_path
    end
  end

  def edit 
    @instance = Instance.find(params[:id])
    @properties = @instance.concept_type.properties
  end

  def update
    @instance = Instance.find(params[:id])
    if !values_params.blank?
      values_params.each do |key, value|
        prop = Property.find(key)
        value = Value.create(data: value)
        value.property_type = prop
        HasValue.create(from_node: @instance, to_node: value)
        # IsAValueOf.create(from_node: value, to_node: prop)
      end
      redirect_to instances_path
    else
      p 'instance value updates did not run'
      redirect_to instances_path
    end

    # if @instance.save
    #   flash.notice = 'Instance updated successfully'
    #   redirect_to instances_path
    # else
    #   flash.alert = 'Error updating Instance'
    #   redirect_to instances_path
    # end
  end

  def destroy 
    @instance = Instance.find(params[:id])
    if @instance.destroy
      flash.notice = 'Instance deleted successfully'
      redirect_to instances_path
    else
      flash.alert = 'Error deleting Instance'
      redirect_to instances_path
    end
  end

  private

  def instance_params
    params.require(:instance).permit(
      :uuid,
      :concept,
    )
  end

  def values_params
    params.require(:values).permit(
      property_fields
    )
  end

  def property_fields
    Property.all.pluck(:uuid)
  end
end
