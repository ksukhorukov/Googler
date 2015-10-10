class StatisticsController < ApplicationController

  def index
    @keywords = Keyword.all || []
  end

  def show
    @statistics = Keyword.find(params[:id]).statistics || []
  end

end
