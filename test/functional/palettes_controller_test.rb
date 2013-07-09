require 'test_helper'

class PalettesControllerTest < ActionController::TestCase
  setup do
    @palette = palettes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:palettes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create palette" do
    assert_difference('Palette.count') do
      post :create, palette: {  }
    end

    assert_redirected_to palette_path(assigns(:palette))
  end

  test "should show palette" do
    get :show, id: @palette
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @palette
    assert_response :success
  end

  test "should update palette" do
    put :update, id: @palette, palette: {  }
    assert_redirected_to palette_path(assigns(:palette))
  end

  test "should destroy palette" do
    assert_difference('Palette.count', -1) do
      delete :destroy, id: @palette
    end

    assert_redirected_to palettes_path
  end
end
