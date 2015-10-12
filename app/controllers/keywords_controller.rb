require 'csv'

class KeywordsController < ApplicationController

  def index
    @keywords = Keyword.where(user_id: current_user.id)
  end

  def show
    keywords_set = Keyword.find(params[:id])
    @words = File.read(keywords_set.keys.path).split(',')
  end

  def new
    @keyword = Keyword.new
  end

  def create
    @keyword = Keyword.new(keyword_params)
    @keyword.user_id = current_user.id
    if @keyword.save
      words = File.read(@keyword.keys.file.path).split(',')
      puts "Words: #{words}"
      AdwordsWorker.perform_async(@keyword.id, words)
      flash[:success] = "New keywords set created! Performing statistics collection on the background."
      redirect_to keywords_path
    else
      render 'new'
    end
  end

  def destroy
    Keyword.find(params[:id]).destroy
    flash[:success] = "Keyword set deleted"
    redirect_to keywords_path
  end

  private

 def keyword_params
    params.require(:keyword).permit(:name, :description, :keys)
  end 


end
