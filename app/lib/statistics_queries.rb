module StatisticsQueries

    #   t.integer "keyword_id"
    # t.integer "adw_top"
    # t.integer "adw_right"
    # t.integer "adw_total"
    # t.string  "top_urls"
    # t.string  "right_urls"
    # t.integer "non_adw"
    # t.string  "urls_non_adw"
    # t.integer "links_total"
    # t.string  "total_results"
    # t.string  "word"

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

end
