require 'test_helper'

class BackersControllerTest < ActionController::TestCase
  setup do
    @backer = backers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:backers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create backer" do
    assert_difference('Backer.count') do
      post :create, backer: { confirmed: @backer.confirmed, project_id: @backer.project_id, reward_id: @backer.reward_id, user_id: @backer.user_id, value: @backer.value }
    end

    assert_redirected_to backer_path(assigns(:backer))
  end

  test "should show backer" do
    get :show, id: @backer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @backer
    assert_response :success
  end

  test "should update backer" do
    put :update, id: @backer, backer: { confirmed: @backer.confirmed, project_id: @backer.project_id, reward_id: @backer.reward_id, user_id: @backer.user_id, value: @backer.value }
    assert_redirected_to backer_path(assigns(:backer))
  end

  test "should destroy backer" do
    assert_difference('Backer.count', -1) do
      delete :destroy, id: @backer
    end

    assert_redirected_to backers_path
  end
end
