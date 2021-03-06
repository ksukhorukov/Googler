module Api
 class StatisticsController < BaseController

  def index
    render json: User.find(current_user_doorkeeper).statistics.to_json
  end

  def show
    @statistics = User.find(current_user_doorkeeper.id).statistics.find_by_id(params[:id])
    render json: @statistics.to_json
  end 

 end
end