module Api
 class StatisticsController < ApplicationController

  def index
    render json: Statistic.all.to_json
  end

  def show
    @statistics = Statistic.find_by_id(params[:id])
    render json: @statistics.to_json
  end 

 end
end