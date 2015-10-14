module GoogleParser

  require 'securerandom'

  def generate_url(word)
    rnd = SecureRandom.urlsafe_base64(22)
   "https://www.google.com/search?q=#{word}&gfe_rd=cr&ei=#{rnd}"
  end

  def random_agent 
    aliases = 
     {
      'Windows IE 6' => 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1)',
      'Windows IE 7' => 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727)',
      'Windows Mozilla' => 'Mozilla/5.0 (Windows; U; Windows NT 5.0; en-US; rv:1.4b) Gecko/20030516 Mozilla Firebird/0.6',
      'Mac Safari' => 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_2; de-at) AppleWebKit/531.21.8 (KHTML, like Gecko) Version/4.0.4 Safari/531.21.10',
      'Mac FireFox' => 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US; rv:1.9.2) Gecko/20100115 Firefox/3.6',
      'Mac Mozilla' => 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X Mach-O; en-US; rv:1.4a) Gecko/20030401',
      'Linux Mozilla' => 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.4) Gecko/20030624',
      'Linux Firefox' => 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.2.1) Gecko/20100122 firefox/3.6.1',
      'Linux Konqueror' => 'Mozilla/5.0 (compatible; Konqueror/3; Linux)',
      'iPhone' => 'Mozilla/5.0 (iPhone; U; CPU like Mac OS X; en) AppleWebKit/420+ (KHTML, like Gecko) Version/3.0 Mobile/1C28 Safari/419.3',
      'Mechanize' => "WWW-Mechanize (http://rubyforge.org/projects/mechanize/)"
    }

    aliases.keys.sample
  end


  def totoal_results(page_body)
    doc = page_body 
    result = doc.search("#resultStats").text
    if result 
      total_number_of_results = result.split(' ')[1]
    else
      0
    end
  end

  def number_of_top_adwords_blocks(page_body)
    #id: _Ltg
    doc = page_body 
    result = doc.search("#_Ltg")
    if result 
      result.search(".ads-ad").count
    else
      0
    end
  end

  def number_of_right_adwords_blocks(page_body)
    #id: _Stg
    doc = page_body 
    result = doc.search("#_Stg")
    if result 
      result.search(".ads-ad").count
    else
      0
    end
  end

  def total_number_of_adwords_blocks(page_body)
    number_of_top_adwords_blocks(page_body) + number_of_right_adwords_blocks(page_body)
  end

  def green_urls_on_top_adwords(page_body)
    #<cite> text inside div with class ads-visurl
    doc = page_body 
    result = doc.search("#_Ltg")
    if result 
      urls = []
      result.search(".ads-visurl").each do |block|
        urls << block.search("cite").text
      end
      urls
    else
      []
    end
  end

  def green_urls_on_right_adwords(page_body)
    #<cite> text inside div with class ads-visurl
    doc = page_body 
    result = doc.search("#_Stg")
    if result 
      urls = []
      result.search(".ads-visurl").each do |block|
        urls << block.search("cite").text
      end
      urls
    else
      []
    end
  end

  def number_of_non_adwords_results(page_body)
    #links inside div with id #ires
    doc = page_body 
    result = doc.search("#ires")
    if result 
      result.search(".g").count
    else
      0
    end
  end

  def urls_of_non_adwords(page_body)
    #urls inside .g class of the page
    doc = page_body 
    result = doc.search("#ires")
    if result 
      urls = []
      result.search(".kv").each do |block|
        urls << block.search("cite").text
      end
      urls
    else
      []
    end
  end

  def total_number_of_links(page_body)
    doc = page_body 
    links = doc.search('a')
    if links 
      hrefs = links.map {|link| link.attribute('href').to_s}.uniq.sort.delete_if {|href| href.empty?}
      hrefs.count
    else
      0
    end
  end
  
end