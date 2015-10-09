require 'securerandom'
require 'curl'

class AdwordsWorker
  include Sidekiq:Worker 

  def process_page(keywords_set_id, keyword)
    rnd = SecureRandom.urlsafe_base64(22)
    page = curl.get("https://www.google.ru/search?q=#{keyword}&gfe_rd=cr&ei=#{rnd}")
  end

end