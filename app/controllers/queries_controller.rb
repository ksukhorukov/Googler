require 'pp'

class QueriesController < ApplicationController

  include StatisticsQueries

  def create
    type = params['type']
    unless %w[query1 query2 query3].include? type
      render :index
    else
      result  = ''
      if type == 'query1'
        result = how_many_urls_contain_the_word_in_adwords(params['word'])
      elsif type == 'query2'
        result = how_many_times_specific_url_shows_up_in_seo(params['url']) 
      elsif type == 'query3'
        result = 'test result'
      end
      render 'result', locals: { result: result  }
    end
  end

end
