class RentalsController < ApplicationController
  before_action :set_rental, only: %i(show edit update destroy)

  def index
    @rentals = Rental.all
  end

  def show
    @depots = @rental.depots
  end

  def new
    @rental = Rental.new
    2.times{@rental.depots.build}
  end

  def edit
    @rental.depots.build
  end

  def create
    @rental = Rental.new(rental_params)

    respond_to do |format|
      if @rental.save
        format.html { redirect_to @rental, notice: 'Rental was successfully created.' }
        format.json { render :show, status: :created, location: @rental }
      else
        format.html { render :new }
        format.json { render json: @rental.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @rental.update(rental_params)
        format.html { redirect_to @rental, notice: 'Rental was successfully updated.' }
        format.json { render :show, status: :ok, location: @rental }
      else
        format.html { render :edit }
        format.json { render json: @rental.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @rental.destroy
    respond_to do |format|
      format.html { redirect_to rentals_url, notice: 'Rental was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_rental
    @rental = Rental.find(params[:id])
  end

  def rental_params
    params.require(:rental).permit(:name, :rent, :address, :age, :feedback,
                                  depots_attributes: %i(id route station walking_distance rental_id _destroy]))
  end
end
