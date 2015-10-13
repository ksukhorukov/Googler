require 'test_helper'

class StatisticTest < ActiveSupport::TestCase
  
    def setup

      params = {
        keyword_id: 1, 
        user_id: 1, 
        adw_top: 1, 
        adw_right: 1,
        adw_total: 2, 
        top_urls: 'http://www.booking.com', 
        right_urls: 'http//www.hostel.com', 
        non_adw: 10, 
        urls_non_adw: 10, 
        links_total: 70, 
        total_results: 200000000,
        word: 'booking'
      }

      @stats =   Statistic.new(params)

    end

    test "stats should be valid" do 
      assert @stats.save
    end

    test "stats should be connected with keywords set" do 
      @stats.keyword_id = nil
      assert_not @stats.save
    end

    test "stats should be connected with a user" do 
      @stats.user_id = nil
      assert_not @stats.save
    end

    test "stats should have not nil top adwords urls" do 
      @stats.adw_top = nil
      assert_not @stats.save
    end  

    test "stats should have not nil right adwords urls" do 
      @stats.adw_top = nil
      assert_not @stats.save
    end  

    test "stats should have not nil adwords total number" do 
      @stats.adw_right = nil
      assert_not @stats.save
    end  

    test "stats should have not nil top adw urls" do 
      @stats.top_urls = nil
      assert_not @stats.save
    end

    test "stats should have not nil right adw urls" do 
      @stats.right_urls = nil
      assert_not @stats.save
    end  

    test "SERP should not be empty" do 
      @stats.non_adw = nil
      assert_not @stats.save
    end 

    test "SERP should have some links" do 
      @stats.urls_non_adw = nil
      assert_not @stats.save
    end  

    test "Total number of links should not be empty" do 
      @stats.links_total = nil
      assert_not @stats.save
    end    

    test "Total number of results should not be empty" do 
      @stats.total_results = nil
      assert_not @stats.save
    end  

    test "Keyword should not be empty" do 
      @stats.total_results = nil
      assert_not @stats.save
    end            

end
