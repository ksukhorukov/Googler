require 'test_helper'

class KeywordTest < ActiveSupport::TestCase

  def setup
    @keywords = Keyword.new(user_id: 1, name: 'test_set', description: 'test_set', keys: File.open(Rails.root.join("test/files/test.csv")))
  end

  test "keywords set should be valid" do
    assert @keywords.valid?
  end

  test "keywords should not be valid when user_id is empty" do
    @keywords.user_id = nil
    assert_not @keywords.valid?
  end

  test "keywords should not be valid when name is empty" do
    @keywords.name = nil
    assert_not @keywords.valid?
  end

  test "keywords should not be valid when description is empty" do
    @keywords.description = nil
    assert_not @keywords.valid?
  end


end
