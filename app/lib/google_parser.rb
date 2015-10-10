module GoogleParser

  require 'securerandom'

  def generate_url(word)
    rnd = SecureRandom.urlsafe_base64(22)
    "https://www.google.com/search?q=#{word}&gfe_rd=cr&ei=#{rnd}"
  end

  def totoal_results(page_body)
    doc = page_body 
    result = doc.css("#resultStats").text
    if result 
      #total_number_of_results = result.split(' ')[1].gsub(',','').to_i
      total_number_of_results = result.split(' ')[1]
      # unless total_number_of_results
      #   total_number_of_results.gsub(',','').to_i
      # else
      #   0
      # end
    else
      0
    end
  end

  def number_of_top_adwords_blocks(page_body)
    #id: _Ltg
    doc = page_body 
    result = doc.css("#_Ltg")
    if result 
      result.css(".ads-ad").count
    else
      0
    end
  end

  def number_of_right_adwords_blocks(page_body)
    #id: _Stg
    doc = page_body 
    result = doc.css("#_Stg")
    if result 
      result.css(".ads-ad").count
    else
      0
    end
  end

  def total_number_of_adwords_blocks(page_body)
    doc = page_body 
    result = doc.css("._Ak")
    if result 
      result.count
    else
      0
    end
  end

  def green_urls_on_top_adwords(page_body)
    #<cite> text inside div with class ads-visurl
    doc = page_body 
    result = doc.css("#_Ltg")
    if result 
      urls = []
      result.css(".ads-visurl").each do |block|
        urls << block.css("cite").text
      end
      urls
    else
      []
    end
  end

  def green_urls_on_right_adwords(page_body)
    #<cite> text inside div with class ads-visurl
    doc = page_body 
    result = doc.css("#_Stg")
    if result 
      urls = []
      result.css(".ads-visurl").each do |block|
        urls << block.css("cite").text
      end
      urls
    else
      []
    end
  end

  def number_of_non_adwords_results(page_body)
    #links inside div with id #ires
    doc = page_body 
    result = doc.css("#ires")
    if result 
      result.css(".g").count
    else
      0
    end
  end

  def urls_of_non_adwords(page_body)
    #urls inside .g class of the page
    doc = page_body 
    result = doc.css("#ires")
    if result 
      urls = []
      result.css(".kv").each do |block|
        urls << block.css("cite").text
      end
      urls
    else
      []
    end
  end

  def total_number_of_links(page_body)
    doc = page_body 
    links = doc.css('a')
    if links 
      hrefs = links.map {|link| link.attribute('href').to_s}.uniq.sort.delete_if {|href| href.empty?}
      hrefs.count
    else
      0
    end
  end
  
end