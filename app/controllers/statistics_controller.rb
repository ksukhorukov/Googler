class StatisticsController < ApplicationController

  def index
    @keywords = Keyword.where(:user_id => current_user.id) 
  end

  def show
    #@statistics = Keyword.find(params[:id]).statistics.order(:word).paginate :per_page => 10, :page => params[:page]
    @keyword = Keyword.where(:user_id => current_user.id).find(params[:id])
    @statistics = @keyword.statistics.includes(:cache).order("statistics.word").paginate :per_page => 10, :page => params[:page]
  end

end
