class AdwordsWorker
  include Sidekiq::Worker 
  include GoogleParser
  
  #sidekiq_options queue: "high"

 

  def perform(keywords_set_id, words)

     curl = CURL.new
     
     words.each do |keyword|

      agent = Mechanize.new 
      page = agent.get('http://www.google.com')
      google_form = page.form('f')
      google_form.q = keyword
      page_body = agent.submit(google_form)

      statistics = Statistic.new

      statistics.word  = keyword
      statistics.keyword_id = keywords_set_id
      statistics.adw_top = number_of_top_adwords_blocks(page_body)
      statistics.adw_right = number_of_right_adwords_blocks(page_body)
      statistics.adw_total = total_number_of_adwords_blocks(page_body)
      statistics.top_urls = green_urls_on_top_adwords(page_body).join(',')
      statistics.right_urls = green_urls_on_right_adwords(page_body).join(',')
      statistics.non_adw = number_of_non_adwords_results(page_body)
      statistics.urls_non_adw = urls_of_non_adwords(page_body).join(',')
      statistics.links_total = total_number_of_links(page_body)
      statistics.total_results = totoal_results(page_body)

      statistics.save

      cache = Cache.create(:statistic_id => statistics.id, :cache => curl.get(page_body.uri.to_s))


    end
  end

end