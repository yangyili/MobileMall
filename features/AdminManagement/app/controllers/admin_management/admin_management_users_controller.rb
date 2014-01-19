require_dependency "admin_management/application_controller"

module AdminManagement
  class AdminManagementUsersController < ApplicationController
    before_action :set_admin_management_user, only: [:show, :edit, :update, :destroy]

    # GET /admin_management_users
    def index
      @admin_management_users = AdminManagementUser.all
    end

    # GET /admin_management_users/1
    def show
    end

    # GET /admin_management_users/new
    def new
      @admin_management_user = AdminManagementUser.new
    end

    # GET /admin_management_users/1/edit
    def edit
    end

    # POST /admin_management_users
    def create
      @admin_management_user = AdminManagementUser.new(admin_management_user_params)

      if @admin_management_user.save
        redirect_to @admin_management_user, notice: 'Admin management user was successfully created.'
      else
        render action: 'new'
      end
    end

    # PATCH/PUT /admin_management_users/1
    def update
      if @admin_management_user.update(admin_management_user_params)
        redirect_to @admin_management_user, notice: 'Admin management user was successfully updated.'
      else
        render action: 'edit'
      end
    end

    # DELETE /admin_management_users/1
    def destroy
      @admin_management_user.destroy
      redirect_to admin_management_users_url, notice: 'Admin management user was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_admin_management_user
        @admin_management_user = AdminManagementUser.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def admin_management_user_params
        params.require(:admin_management_user).permit(:name, :email, :password, :phone, :admin)
      end
  end
end
