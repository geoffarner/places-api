class PlacesController < ApplicationController
  def index
    @places = Place.all
    render :index
  end

  def show
    @place = Place.find_by(id: params[:id])
    render :show
  end

  def create
    @place = Place.new(
      name: params[:name],
      address: params[:address],
    )
    if @place.save
      render :show
    else
      render json: { errors: @place.errors.full_message}, status: 451
    end
  end

  def update
    @place = Place.find_by(id: params[:id])
    @place.name = params[:name] || @place.name
    @place.address = params[:address] || @ place.address
    if @place.save
      render :sbow
    else
      render json: { errors: @place.errors.full_message}, status: 451
    end
  end

  def destroy
    place = Place.find_by(id: params[:id])
    place.destroy
    render json: {message: "Place Deleted."}
  end
  
end
