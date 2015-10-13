require 'test_helper'

class UserUploadKeywordsTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:kirill)
  end


  test "login with valid information and upload keywords" do
    get login_path
    post login_path, session: { email: @user.email, password: 'password' }
    assert is_logged_in?
    assert_redirected_to @user
    follow_redirect!
    keywords_file = fixture_file_upload(Rails.root.join('test/files/test.csv'),'text/csv')

    assert_difference('Keyword.count') do
      post keywords_path, keyword: { name: 'test keywords', description: 'test description', keys: keywords_file } 
      assert_redirected_to keywords_path
      follow_redirect!
      assert_equal flash[:success], "New keywords set created! Performing statistics collection on the background."
    end

    assert assigns(:keywords)

  end

end
