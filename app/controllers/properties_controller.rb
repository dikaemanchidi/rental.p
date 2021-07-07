class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]

  # GET /properties
  # GET /properties.json
  def index
    @properties = Property.all
  end

  # GET /properties/1
  # GET /properties/1.json
  def show
  end

  # GET /properties/new
  def new
    @property = Property.new
    1.times { @property.stations.build }
  end

  # GET /properties/1/edit
  def edit
    @property.stations.build
  end

  # POST /properties
  # POST /properties.json
  def create
    	@property = Property.new(property_params)
    	if params[:back]
        render :new
      else
  	    if @property.save
  	      redirect_to properties_path, notice: "'Property was successfully created!"
  	    else
  	      render :new
  	    end
  	  end
    end
  # PATCH/PUT /properties/1
  # PATCH/PUT /properties/1.json
  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to @property, notice: 'Property was successfully updated.' }
        format.json { render :show, status: :ok, location: @property }
      else
        format.html { render :edit }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /properties/1
  # DELETE /properties/1.json
  def destroy
    @property.destroy
    respond_to do |format|
      format.html { redirect_to properties_url, notice: 'Property was successfully destroyed.' }

    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_property
  @property = Property.find(params[:id])
  end

    # Only allow a list of trusted parameters through.
  def property_params
  params.require(:property).permit(:property_name, :rent, :address, :age, :remark, stations_attributes: [:id, :line, :station, :time])
  end
  end
