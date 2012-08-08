require 'test_helper'

class EstatesControllerTest < ActionController::TestCase
  setup do
    @estate = estates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:estates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create estate" do
    assert_difference('Estate.count') do
      post :create, estate: @estate.attributes
    end

    assert_redirected_to estate_path(assigns(:estate))
  end

  test "should show estate" do
    get :show, id: @estate
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @estate
    assert_response :success
  end

  test "should update estate" do
    put :update, id: @estate, estate: @estate.attributes
    assert_redirected_to estate_path(assigns(:estate))
  end

  test "should destroy estate" do
    assert_difference('Estate.count', -1) do
      delete :destroy, id: @estate
    end

    assert_redirected_to estates_path
  end
end
