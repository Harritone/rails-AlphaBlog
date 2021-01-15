require "test_helper"

class CreateCategoryTest < ActionDispatch::IntegrationTest
  setup do
    @admin_user = User.create(username: 'honk', email: 'honk@mail.com', 
    password: '123456', admin: true)
  end
  test "getting new for and create category" do
    sign_in_as(@admin_user)
    get '/categories/new'
    assert_response :success 
    assert_difference 'Category.count', 1 do
      post categories_path, params: {category: {name: "Sports"}}
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match 'Sports', response.body
  end

  test "getting new for and reject invalid category submission" do
    sign_in_as(@admin_user)
    get '/categories/new'
    assert_response :success 
    assert_no_difference 'Category.count'  do
      post categories_path, params: {category: {name: ' '}}
    end
    assert_match 'errors', response.body
    assert_select 'div.alert'
    assert_select 'h2'
  end

end
