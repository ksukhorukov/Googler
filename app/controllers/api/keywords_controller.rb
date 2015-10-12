module Api
 class KeywordsController < ApplicationController
  

  def create
    @keyword = Keyword.new(keyword_params)
    @keyword.user_id = current_user.id
    if @keyword.save
      words = File.read(@keyword.keys.file.path).split(',')
      AdwordsWorker.perform_async(@keyword.id, words)
      
      render json: '{ "Status": "OK", "keyword_id":"' + keyword.id + '"}'
    else
      render json: '{ "Status: "Error", "Message":"' + keyword.errors + '"}'
    end
  end

  def index
    render json: Keyword.all
  end

   private 
    def keyword_params
      params.require(:keyword).permit(:name, :description, :keys)
    end 
 end
end