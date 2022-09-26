class AccommodationsController < ApplicationController
  before_action :authorize_request, except: :login

  def index
    render json: {
      status: { code: 200, message: 'Accommodations were fetched sucessfully.' },
      data: Accommodation.all
    }
  end

  def show
    accommodation = Accommodation.find_by(id: params[:id])
    if accommodation.nil?
      render json: {
        status: { code: 404, message: 'Accommodation not found.' }
      }
    else
      render json: {
        status: { code: 200, message: 'The Accommodation was fetched sucessfully.' },
        data: house
      }
    end
  end

  def create
    @accommodation = current_user.accommodations.new(accommodation_params)

    if @accommodation.save
      render json: {
        status: { code: 200, message: 'Accommodation created sucessfully.' },
        data: @accommodation
      }
    else
      render json: {
        status: { code: 404, message: 'The Accommodation could not be created!' }
      }
    end
  end

  def update
    @accommodation = Accommodation.find(params[:id])

    if @accommodation.nil?
      render json: {
        status: { code: 404, message: 'The Accommodation not found' }
      }
      return
    end

    if @accommodation.update(accommodation_params)
      render json: {
        status: { code: 200, message: 'Accommodation updated successfully' },
        data: @house
      }
    else
      render json: {
        status: { code: 500, message: 'Bad request, Accommodation could not be updated' }
      }
    end
  end

  def destroy
    @accommodation = Accommodation.find(params[:id])

    if @accommodation.nil?
      render json: {
        status: { code: 404, message: 'Accommodation not found' }
      }
      return
    end
    @accommodation.destroy
    render json: {
      status: { code: 200, message: 'Accommodation was deleted successfully' }
    }
  end

  private

  def accommodation_params
    params.require(:accommodation).permit(:hotel_type, :address, :city, :rooms, :surroundings)
  end
end
