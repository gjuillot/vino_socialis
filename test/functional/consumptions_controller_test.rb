require 'test_helper'

class ConsumptionsControllerTest < ActionController::TestCase
  setup do
    @consumption = consumptions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:consumptions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create consumption" do
    assert_difference('Consumption.count') do
      post :create, consumption: @consumption.attributes
    end

    assert_redirected_to consumption_path(assigns(:consumption))
  end

  test "should show consumption" do
    get :show, id: @consumption
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @consumption
    assert_response :success
  end

  test "should update consumption" do
    put :update, id: @consumption, consumption: @consumption.attributes
    assert_redirected_to consumption_path(assigns(:consumption))
  end

  test "should destroy consumption" do
    assert_difference('Consumption.count', -1) do
      delete :destroy, id: @consumption
    end

    assert_redirected_to consumptions_path
  end
end
