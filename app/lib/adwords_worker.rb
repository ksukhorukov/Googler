class AdwordsWorker
  include Sidekiq::Worker 
  include GoogleParser

  def perform(keywords_set_id, user_id, keyword)

     curl = CURL.new
     #agent = Mechanize.new
     
     #words.each do |keyword|
      
      # agent.user_agent_alias = random_agent
      # page = agent.get('http://www.google.com')
      # google_form = page.form('f')
      # google_form.q = keyword
      # page_body = agent.submit(google_form)
      
      page = curl.get(generate_url(keyword))
      page_body = Nokogiri::HTML(page)

      ActiveRecord::Base.transaction do

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
        statistics.user_id = user_id

        statistics.save

        "valid save for keyword #{keyword}: #{statistics.valid?}"

        #cached = curl.get(page_body.uri.to_s)
        cache = Cache.new(:statistic_id => statistics.id)
        cache.cache = page
        cache.save
      
      end

    # end
  end

end