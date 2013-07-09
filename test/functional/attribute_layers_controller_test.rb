require 'test_helper'

class AttributeLayersControllerTest < ActionController::TestCase
  setup do
    @attribute_layer = attribute_layers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:attribute_layers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create attribute_layer" do
    assert_difference('AttributeLayer.count') do
      post :create, attribute_layer: {  }
    end

    assert_redirected_to attribute_layer_path(assigns(:attribute_layer))
  end

  test "should show attribute_layer" do
    get :show, id: @attribute_layer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @attribute_layer
    assert_response :success
  end

  test "should update attribute_layer" do
    put :update, id: @attribute_layer, attribute_layer: {  }
    assert_redirected_to attribute_layer_path(assigns(:attribute_layer))
  end

  test "should destroy attribute_layer" do
    assert_difference('AttributeLayer.count', -1) do
      delete :destroy, id: @attribute_layer
    end

    assert_redirected_to attribute_layers_path
  end
end
