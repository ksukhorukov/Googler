module Api
 class KeywordsController < BaseController
  
  skip_before_filter :verify_authenticity_token

  def create
    @keyword = Keyword.new(keyword_params)
    @keyword.user_id = current_user_doorkeeper.id
    if @keyword.save
      words = File.read(@keyword.keys.file.path).split(',')
      AdwordsWorker.perform_async(@keyword.id, current_user_doorkeeper.id, words)
      render json: "{ 'Status': 'OK', 'keyword_id': '#{@keyword.id}'}"
    else
      render json: "{ 'Status': 'Error', 'Message': '#{@keyword.errors}'"
    end
  end

  def index
    render json: User.find(current_user_doorkeeper).keywords
  end

  def show
    keywords_set = User.find(current_user_doorkeeper).keywords.find(params[:id])
    @words = File.read(keywords_set.keys.path).split(',')
    render json: @words
  end

   private 
    def keyword_params
      params.require(:keywords).permit(:name, :description, :keys)
    end 

 end
end