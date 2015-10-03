require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { about: @user.about, active: @user.active, address: @user.address, age: @user.age, email: @user.email, family_info: @user.family_info, first_name: @user.first_name, gender: @user.gender, last_name: @user.last_name, pet_info: @user.pet_info, phone_number: @user.phone_number, residence_info: @user.residence_info }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    patch :update, id: @user, user: { about: @user.about, active: @user.active, address: @user.address, age: @user.age, email: @user.email, family_info: @user.family_info, first_name: @user.first_name, gender: @user.gender, last_name: @user.last_name, pet_info: @user.pet_info, phone_number: @user.phone_number, residence_info: @user.residence_info }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
