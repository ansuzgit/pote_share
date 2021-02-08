class ReservationsController < ApplicationController
  
  def index
    @reservations = Reservation.all
  end
  
  def show
  end
  
  def new
    @reservation = current_user.reservations.build
  end
  
  def create
    @post = Post.find(params[:id])
    @reservation = current_user.reservations.build(reservation_params)
    if @reservation.save
      flash[:success] = "reservation created!"
      redirect_to "/reservations/show"
    else
      render "/reservations/new"
    end
  end

  private

    def reservation_params
      params.permit(:start_date, :end_date, :person_num, :confirming)
    end
end