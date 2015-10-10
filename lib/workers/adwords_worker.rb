require 'securerandom'
require 'curl'

class AdwordsWorker
  include Sidekiq:Worker 

  def get_page(keyword)
    rnd = SecureRandom.urlsafe_base64(22)
    page = curl.get("https://www.google.ru/search?q=#{keyword}&gfe_rd=cr&ei=#{rnd}")
  end

  def process_page(keywords_set_id, keywords = [])

  end

end