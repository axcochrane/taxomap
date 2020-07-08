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

  private

  def property_params
    params.require(:property).permit(
      :title
    )
  end
end
