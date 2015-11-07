require 'test_helper'

class Ec2InstancesControllerTest < ActionController::TestCase
  setup do
    @ec2_instance = ec2_instances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ec2_instances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ec2_instance" do
    assert_difference('Ec2Instance.count') do
      post :create, ec2_instance: {  }
    end

    assert_redirected_to ec2_instance_path(assigns(:ec2_instance))
  end

  test "should show ec2_instance" do
    get :show, id: @ec2_instance
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ec2_instance
    assert_response :success
  end

  test "should update ec2_instance" do
    patch :update, id: @ec2_instance, ec2_instance: {  }
    assert_redirected_to ec2_instance_path(assigns(:ec2_instance))
  end

  test "should destroy ec2_instance" do
    assert_difference('Ec2Instance.count', -1) do
      delete :destroy, id: @ec2_instance
    end

    assert_redirected_to ec2_instances_path
  end
end
