require 'test_helper'

class CacheTest < ActiveSupport::TestCase
 
  def setup
    @cache = Cache.new(statistic_id: 1, cache: '<html><head><title>test_document</title></head></html>')
  end

  test "cache should be valid" do 
    assert @cache.valid?
  end

  test "cache invalid when has no cached pafe" do 
    @cache.cache = nil
    pp @cache
    assert_not @cache.valid?
  end


end
