require 'csv'

class KeywordsController < ApplicationController

  def index
    @keywords = Keyword.all 
  end

  def show
    keywords_set = Keyword.find(params[:id])
    @words = File.read(keywords_set.keys.path).split(',')
  end

  def new
    @keyword = Keyword.new
  end

  def create
    puts "Keyword params"
    pp keyword_params
    @keyword = Keyword.new(keyword_params)
    if @keyword.save
      words = File.read(@keyword.keys.file.path).split(',')
      words.each_slice(50) do |slice|
        AdwordsWorker.perform_async(@keyword.id, slice)
      end
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
