require 'test_helper'

module AdminManagement
  class AdminManagementUsersControllerTest < ActionController::TestCase
    setup do
      @admin_management_user = admin_management_users(:one)
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:admin_management_users)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create admin_management_user" do
      assert_difference('AdminManagementUser.count') do
        post :create, admin_management_user: { admin: @admin_management_user.admin, email: @admin_management_user.email, name: @admin_management_user.name, password: @admin_management_user.password, phone: @admin_management_user.phone }
      end

      assert_redirected_to admin_management_user_path(assigns(:admin_management_user))
    end

    test "should show admin_management_user" do
      get :show, id: @admin_management_user
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @admin_management_user
      assert_response :success
    end

    test "should update admin_management_user" do
      patch :update, id: @admin_management_user, admin_management_user: { admin: @admin_management_user.admin, email: @admin_management_user.email, name: @admin_management_user.name, password: @admin_management_user.password, phone: @admin_management_user.phone }
      assert_redirected_to admin_management_user_path(assigns(:admin_management_user))
    end

    test "should destroy admin_management_user" do
      assert_difference('AdminManagementUser.count', -1) do
        delete :destroy, id: @admin_management_user
      end

      assert_redirected_to admin_management_users_path
    end
  end
end
