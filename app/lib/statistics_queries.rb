module StatisticsQueries

  def how_many_urls_contain_the_word_in_adwords(word)
    counter = 0
    statistics = Statistic.all
    statistics.each do |stats|
      counter += stats.top_urls.scan(/#{word}/i).count
      counter += stats.right_urls.scan(/#{word}/i).count
    end
    counter
  end

  def how_many_times_specific_url_shows_up_in_seo(url)
    counter = 0
    statistics = Statistic.all
    statistics.each do |stats|
      counter += stats.top_urls.scan(/#{url}/i).count
      counter += stats.right_urls.scan(/#{url}/i).count
    end
    counter
  end

  def how_many_urls_have_two_or_more_slash_characters
    counter = 0
    urls = ''
    statistics = Statistic.all
    statistics.each do |stats|
      urls = stats.top_urls.gsub("http:\/\/",'') + ',' + urls
      urls = stats.right_urls.gsub("http:\/\/",'') + ',' + urls
      urls = stats.urls_non_adw.gsub("http:\/\/",'') + ',' + urls
    end
    urls.split(',').each do |url|
      counter += 1 if url.scan(/\//).count >= 2  unless url.nil?   
    end
    counter
  end

  def how_many_urls_have_one_or_more_caret_charecter
    counter = 0
    urls = ''
    statistics = Statistic.all
    statistics.each do |stats|
      urls = stats.top_urls + ',' + urls
      urls = stats.right_urls + ',' + urls
    end
    urls.split(',').each do |url|
      counter += 1 if url.scan(/>/).count >= 1 unless url.nil?
    end
    counter
  end

end
