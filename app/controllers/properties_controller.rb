class PropertiesController < ApplicationController
  def index
    @properties = Property.all
  end

  def create
    @property = Property.new(property_params)
    if @property.save
      flash.notice = 'Property created successfully'
      redirect_to properties_path
    else
      flash.alert = 'Error creating Property'
      redirect_to new_property_path
    end
  end

  def edit 
    @property = Property.find(params[:id])
  end

  def destroy 
    @property = Property.find(params[:id])
    if @property.destroy
      flash.notice = 'Property deleted successfully'
      redirect_to properties_path
    else
      flash.alert = 'Error deleting Property'
      redirect_to properties_path
    end
  end


  def update
    @property = Property.find(params[:id])
    @property.update_attributes(property_params)

    if @property.save
      flash.notice = 'Property updated successfully'
      redirect_to properties_path
    else
      flash.alert = 'Error updating Property'
      redirect_to properties_path
    end
  end
  private

  def property_params
    params.require(:property).permit(
      :title,
      :data_type
    )
  end
end
