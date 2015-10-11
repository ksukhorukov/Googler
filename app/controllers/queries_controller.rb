require 'pp'

class QueriesController < ApplicationController

  include StatisticsQueries

  def create
    pp params
    type = params['type']
    if type == 'query1'
      puts "Result:" + how_many_urls_contain_the_word_in_adwords(params['word']).to_s
      render 'result', locals: { result: how_many_urls_contain_the_word_in_adwords(params['word']) }
    elsif type == 'query2'
      render 'result', locals: { result: how_many_times_specific_url_shows_up_in_seo(params['url']) }
    elsif type == 'query3'
      render 'result', locals: { result: 'test result' }
    else
      render :new
    end
  end

end
