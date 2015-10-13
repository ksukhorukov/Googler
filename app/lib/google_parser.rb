module GoogleParser

  require 'securerandom'

  def random_agent 
    aliases = {
      'Windows IE 6' => 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1)',
      'Windows IE 7' => 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727)',
      'Windows Mozilla' => 'Mozilla/5.0 Windows; U; Windows NT 5.0; en-US; rv:1.4b Gecko/20030516 Mozilla Firebird/0.6',
      'Windows Mozilla 2' => 'Mozilla/5.0 Windows; U; Windows NT 5.0; ru-US; rv:1.4b Gecko/20030516',
      'Windows Mozilla 3' => 'Mozilla/5.0 Windows; U; Windows NT 5.0; en-UK; rv:1.4b Gecko/20060516',
      'Mac Safari' => 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit/418 (KHTML, like Gecko) Safari/417.9.3',
      'Mac FireFox' => 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X Mach-O; en-US; rv:1.8.0.3) Gecko/20060426 Firefox/1.5.0.3',
      'Mac Mozilla' => 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X Mach-O; en-US; rv:1.4a) Gecko/20030401',
      'Linux Mozilla' => 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.4) Gecko/20030624',
      'Linux Konqueror' => 'Mozilla/5.0 (compatible; Konqueror/3; Linux)',
      'IPhone' => 'Mozilla/5.0 (iPhone; U; CPU like Mac OS X; en) AppleWebKit/420+ (KHTML, like Gecko) Version/3.0 Mobile/1A543a Safari/419.3',
      'IPhone Vkontakt' => 'VKontakte/1.1.8 CFNetwork/342.1 Darwin/9.4.1',
      'Google'=>"Googlebot/2.1 (+http://www.google.com/bot.html)",
      "Yahoo-Slurp"=>"Mozilla/5.0 (compatible; Yahoo! Slurp; http://help.yahoo.com/help/us/ysearch/slurp)"
    }

    aliases[aliases.keys.sample]
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
    doc = page_body 
    result = doc.search("._Ak")
    if result 
      result.count
    else
      0
    end
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