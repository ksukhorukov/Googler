require 'pp'

class QueriesController < ApplicationController

  include StatisticsQueries

  def create
    type = params['type']
    unless %w[query1 query2 query3 query4].include? type
      render :index
    else
      result  = ''
      if type == 'query1'
        result = how_many_urls_contain_the_word_in_adwords(params['word'])
      elsif type == 'query2'
        result = how_many_times_specific_url_shows_up_in_seo(params['url']) 
      elsif type == 'query3'
        result = how_many_urls_have_two_or_more_slash_characters
      elsif type == 'query4'
        result = how_many_urls_have_one_or_more_caret_charecter
        pp how_many_urls_have_one_or_more_caret_charecter
        puts "Result: #{how_many_urls_have_one_or_more_caret_charecter}"
      end
      render 'result', locals: { result: result }
    end
  end

end
