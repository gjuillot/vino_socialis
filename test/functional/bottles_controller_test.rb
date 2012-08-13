require 'test_helper'

class BottlesControllerTest < ActionController::TestCase
  setup do
    @bottle = bottles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bottles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bottle" do
    assert_difference('Bottle.count') do
      post :create, bottle: @bottle.attributes
    end

    assert_redirected_to bottle_path(assigns(:bottle))
  end

  test "should show bottle" do
    get :show, id: @bottle
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bottle
    assert_response :success
  end

  test "should update bottle" do
    put :update, id: @bottle, bottle: @bottle.attributes
    assert_redirected_to bottle_path(assigns(:bottle))
  end

  test "should destroy bottle" do
    assert_difference('Bottle.count', -1) do
      delete :destroy, id: @bottle
    end

    assert_redirected_to bottles_path
  end
end
