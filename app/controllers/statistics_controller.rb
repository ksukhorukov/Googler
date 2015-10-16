class StatisticsController < ApplicationController


  before_action :logged_in_user
  before_action :correct_user

  def index
    @keywords = Keyword.where(:user_id => current_user.id) 
  end

  def show
    #@statistics = Keyword.find(params[:id]).statistics.order(:word).paginate :per_page => 10, :page => params[:page]
    @keyword = Keyword.where(:user_id => current_user.id).find(params[:id])
    @statistics = @keyword.statistics.includes(:cache).order("statistics.word").paginate :per_page => 10, :page => params[:page]
  end

  private

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    def correct_user
      @user = User.find(current_user.id)
      redirect_to(root_url) unless current_user?(@user)
    end
    

end
