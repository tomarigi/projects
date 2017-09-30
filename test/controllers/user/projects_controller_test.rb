require 'test_helper'

class User::ProjectsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_projects_index_url
    assert_response :success
  end

  test "should get new" do
    get user_projects_new_url
    assert_response :success
  end

  test "should get edit" do
    get user_projects_edit_url
    assert_response :success
  end

end
