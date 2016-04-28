class Admin::UsersController < Admin::ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :archive]
  before_action :set_projects, only: [:new, :create, :edit, :update]

  def archive
    if @user == current_user
      flash[:alert] = "You cannot archive yourself!"
    else
      @user.archive
      flash[:notice] = "User has been archived."
    end

    redirect_to admin_users_path
  end

  # GET /admin/users
  # GET /admin/users.json
  def index
    @users = User.excluding_archived.includes(:roles, {roles: :project}).order(id: "desc")
  end

  # GET /admin/users/1
  # GET /admin/users/1.json
  def show
  end

  # GET /admin/users/new
  def new
    @user = User.new
  end

  # GET /admin/users/1/edit
  def edit

  end

  def create
    @user = User.new(user_params)
    build_roles_for(@user)
    if @user.save
      flash[:notice] = "User has been created."
      redirect_to admin_users_path
    else
      flash.now[:alert] = "User has not been created."
      render "new"
    end
  end

  def update
    # Case not edit password
    if params[:user][:password].blank?
      params[:user].delete(:password)
    end
    User.transaction do
      @user.roles.clear
      build_roles_for(@user)
      if @user.update(user_params)
        flash[:notice] = "User has been updated."
        redirect_to admin_users_path
      else
        flash.now[:alert] = "User has not been updated."
        render "edit"
        raise ActiveRecord::Rollback
      end
    end
  end

  private
  def set_projects
    @projects = Project.order(:name)
  end

  def user_params
    params.require(:user).permit(:email, :password, :username, :admin)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def build_roles_for(user)
    role_data = params.fetch(:roles, [])
    role_data.each do |project_id, role_name|
      if role_name.present?
        user.roles.build(project_id: project_id, role: role_name)
      end
    end
  end
end