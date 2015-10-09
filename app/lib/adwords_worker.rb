require 'securerandom'
require 'curl'
require 'pp'

class AdwordsWorker
  include Sidekiq::Worker 
  sidekiq_options queue: "high"

  def generate_url(word)
    rnd = SecureRandom.urlsafe_base64(22)
    "https://www.google.com/search?q=#{word}&gfe_rd=cr&ei=#{rnd}"
  end

  def process_page(keywords_set_id)
     words = File.read(Keyword.find(keywords_set_id).keys.path).split(',')
     pp words
    # rnd = SecureRandom.urlsafe_base64(22)
    # page = curl.get("https://www.google.ru/search?q=#{keyword}&gfe_rd=cr&ei=#{rnd}")
    # puts page
  end

end