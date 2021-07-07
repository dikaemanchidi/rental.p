class PropertiesController < ApplicationController
  before_action :set_properties, only: %i(show edit update destroy)

  def index
    @propertiess = Properties.all
  end

  def show
    @depots = @properties.depots
  end

  def new
    @properties = Properties.new
    2.times{@properties.depots.build}
  end

  def edit
    @properties.depots.build
  end

  def create
    @properties = Properties.new(Properties_params)

    respond_to do |format|
      if @properties.save
        format.html { redirect_to @properties, notice: 'properties was successfully created.' }
        format.json { render :show, status: :created, location: @properties }
      else
        format.html { render :new }
        format.json { render json: @properties.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @properties.update(Properties_params)
        format.html { redirect_to @properties, notice: 'properties was successfully updated.' }
        format.json { render :show, status: :ok, location: @properties }
      else
        format.html { render :edit }
        format.json { render json: @properties.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @properties.destroy
    respond_to do |format|
      format.html { redirect_to Properties_url, notice: 'properties was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_properties
    @properties = Properties.find(params[:id])
  end

  def properties_params
    params.require(:properties).permit(:name, :rent, :address, :age, :feedback,
                                  depots_attributes: %i(id route station walking_distance properties_id _destroy]))
  end
end
