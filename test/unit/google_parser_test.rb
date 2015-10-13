require 'test_helper'

class GoogleParserTest < ActiveSupport::TestCase

  include GoogleParser

  def setup
    @page_body = Nokogiri::HTML(File.open(Rails.root.join('test/files/result.html')))
  end

  test "correct total results" do
    assert_equal "720,000,000", totoal_results(@page_body)
  end

  test "correct number of top adwords blocks" do 
    assert_equal 2, number_of_top_adwords_blocks(@page_body)
  end
  
  test "correct number of right adwords blocks" do 
    assert_equal 8, number_of_right_adwords_blocks(@page_body)
  end

  test "correct total number of adwords blocks" do
    assert_equal 10, total_number_of_adwords_blocks(@page_body)
  end

  test "green urls on top adwords" do 
    assert_equal ["www.top10bestwebsitehosting.com/", "www.digitalocean.com/Hosting"], green_urls_on_top_adwords(@page_body)
  end

  test "green urls on right adwords" do 
    urls = ["www.adriahost.rs/web-hosting", "www.avahost.ru/", "www.vpb.com/", "www.m2host.com/", "www.hostbuddy.com/", "www.myresellerhome.com/Buy_Now", "www.onlydomains.com/", "www.gogvo.com/Web-Hosting"]
    assert_equal urls, green_urls_on_right_adwords(@page_body)
  end

  test "correct number of non adwords results" do 
    assert_equal 10, number_of_non_adwords_results(@page_body)
  end

  test "correct list of non adwords urls" do 
    urls = ["www.hosting.com/", "https://en.wikipedia.org/wiki/Web_hosting_service", "https://www.godaddy.com/hosting/web-hosting", "www.hostgator.com/", "https://www.inmotionhosting.com/", "https://www.dreamhost.com/", "https://www.siteground.com/", "https://wordpress.org/hosting/", "www.ixwebhosting.com/"]
    assert_equal urls, urls_of_non_adwords(@page_body)
  end

  test "correct total number of links" do 
    assert_equal 109, total_number_of_links(@page_body)
  end

end