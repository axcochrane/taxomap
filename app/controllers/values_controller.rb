class ValuesController < ApplicationController
  def index
    @values = Value.all
  end

  def new
  end

  def create
    @value = Value.new(value_params)
    if @value.save
      flash.notice = 'Value created successfully'
      redirect_to values_path
    else
      flash.alert = 'Error creating Value'
      redirect_to new_value_path
    end
  end

  def edit 
    @value = Value.find(params[:id])
  end

  def update
    @value = Value.find(params[:id])
    @type = Property.find(value_params[:type])

    if @value.save
      flash.notice = 'Value updated successfully'
      redirect_to values_path
    else
      flash.alert = 'Error updating Value'
      redirect_to values_path
    end
  end

  def destroy 
    @value = Value.find(params[:id])
    if @value.destroy
      flash.notice = 'Value deleted successfully'
      redirect_to values_path
    else
      flash.alert = 'Error deleting Value'
      redirect_to values_path
    end
  end

  private

  def values_params
    params.require(:values).permit(
      property_fields
    )
  end

  def property_fields
    Property.all.pluck(:uuid)
  end

end
