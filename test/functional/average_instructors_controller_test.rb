require 'test_helper'

class AverageInstructorsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:average_instructors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create average_instructor" do
    assert_difference('AverageInstructor.count') do
      post :create, :average_instructor => { }
    end

    assert_redirected_to average_instructor_path(assigns(:average_instructor))
  end

  test "should show average_instructor" do
    get :show, :id => average_instructors(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => average_instructors(:one).to_param
    assert_response :success
  end

  test "should update average_instructor" do
    put :update, :id => average_instructors(:one).to_param, :average_instructor => { }
    assert_redirected_to average_instructor_path(assigns(:average_instructor))
  end

  test "should destroy average_instructor" do
    assert_difference('AverageInstructor.count', -1) do
      delete :destroy, :id => average_instructors(:one).to_param
    end

    assert_redirected_to average_instructors_path
  end
end
