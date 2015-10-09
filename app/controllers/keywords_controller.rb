class KeywordsController < ApplicationController

  def index
    @keywords = Keyword.all 
  end

  def new
    @keyword = Keyword.new
  end

  def create
    puts "Keyword params"
    pp keyword_params
    @keyword = Keyword.new(keyword_params)
    if @keyword.save
      flash[:success] = "New keyword set created!"
      redirect_to @keyword
    else
      render 'new'
    end
  end

  private

 def keyword_params
    params[:keyword]
  end 


end
