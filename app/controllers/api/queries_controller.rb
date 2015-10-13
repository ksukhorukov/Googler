module Api
 class QueriesController < BaseController
  
  include StatisticsQueries

  def index
    type = params['type']
    result = 'Error! Check the params for your query'
    unless %w[query1 query2 query3 query4].include? type
      render json: '{ "Error": "Incorrect query type" }'
    else
      if type == 'query1' and not params['word'].nil?
        result = how_many_urls_contain_the_word_in_adwords(params['word']).to_s
      elsif type == 'query2' and not params['url'].nil?
        result = how_many_times_specific_url_shows_up_in_seo(params['url']).to_s
      elsif type == 'query3'
        result = how_many_urls_have_two_or_more_slash_characters.to_s
      elsif type == 'query4'
        result = how_many_urls_have_one_or_more_caret_charecter.to_s
      end
      render json: "{ 'Result': '#{result}' }"
    end
  end

 end
end