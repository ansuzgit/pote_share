class ReservationsController < ApplicationController
  
  def index
    @reservations = current_user.reservations
  end
  
  def show
    @post = Post.find_by(id: params[:format])
    @reservation = Reservation.find(params[:id])
  end
  
  def new
    @post = Post.find_by(id: params[:post_id])
    @reservation = @post.reservations.build
  end
  
  def create
    @post = Post.find(params[:post_id])
    @reservation = @post.reservations.build(reservation_params)
    if @reservation.save
      flash[:success] = "予約が完了しました。"
      redirect_to reservation_path(@reservation,params[:post_id])
    else
      redirect_back fallback_location: root_path , notice: '#予約の申請に失敗しました。再度お手続きをお願いします。'
    end
  end

  private

    def reservation_params
      params.permit( :post_id ,:start_date, :end_date, :person_num, :confirming)
                   .merge(user_id: current_user.id ,
                          post_id: params[:post_id])
    end
end