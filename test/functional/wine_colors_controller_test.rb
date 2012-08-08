require 'test_helper'

class WineColorsControllerTest < ActionController::TestCase
  setup do
    @wine_color = wine_colors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wine_colors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wine_color" do
    assert_difference('WineColor.count') do
      post :create, wine_color: @wine_color.attributes
    end

    assert_redirected_to wine_color_path(assigns(:wine_color))
  end

  test "should show wine_color" do
    get :show, id: @wine_color
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @wine_color
    assert_response :success
  end

  test "should update wine_color" do
    put :update, id: @wine_color, wine_color: @wine_color.attributes
    assert_redirected_to wine_color_path(assigns(:wine_color))
  end

  test "should destroy wine_color" do
    assert_difference('WineColor.count', -1) do
      delete :destroy, id: @wine_color
    end

    assert_redirected_to wine_colors_path
  end
end
