class StatisticsController < ApplicationController

  def index
    @keywords = Keyword.all 
  end

  def show
    @statistics = Keyword.find(params[:id]).statistics.order(:word).paginate :per_page => 10, :page => params[:page]
  end

end
