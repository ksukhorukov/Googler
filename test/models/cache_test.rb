require 'test_helper'

class CacheTest < ActiveSupport::TestCase
 
  def setup
    @cache = Cache.new(statistic_id: 1, cache: '<html><head><title>test_document</title></head></html>')
  end

  test "cache should be valid" do 
    assert @cache.valid?
  end

  test "cache invalid when has no cached page" do 
    @cache.cache = nil
    assert_not @cache.valid?
  end

  test "cache invalid when not attached to statistics" do 
    @cache.statistic_id = nil
    assert_not @cache.valid?
  end


end
