require 'test_helper'

class SliderObjectsControllerTest < ActionController::TestCase
  setup do
    @slider_object = slider_objects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:slider_objects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create slider_object" do
    assert_difference('SliderObject.count') do
      post :create, slider_object: {  }
    end

    assert_redirected_to slider_object_path(assigns(:slider_object))
  end

  test "should show slider_object" do
    get :show, id: @slider_object
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @slider_object
    assert_response :success
  end

  test "should update slider_object" do
    patch :update, id: @slider_object, slider_object: {  }
    assert_redirected_to slider_object_path(assigns(:slider_object))
  end

  test "should destroy slider_object" do
    assert_difference('SliderObject.count', -1) do
      delete :destroy, id: @slider_object
    end

    assert_redirected_to slider_objects_path
  end
end
