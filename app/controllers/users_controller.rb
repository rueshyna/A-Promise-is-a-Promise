class UsersController < ApplicationController
  before_filter :authenticate, :only => [:edit, :update, :show, :index]
  before_filter :correct_user, :only => [:edit, :update, :show, :index]

  def index
    @title = "All users"
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])
    @title = @user.name
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    if !signed_in?
      @user = User.new
      @title = "Sign up"
    else
      redirect_to root_path
    end
  end

  # GET /users/1/edit
  def edit
    @title= "Edit user"
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.xml
  def create
    #@user = User.create(params[:user])
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Success to sign up."
      redirect_to @user
    else
      @title = "Sign up"
      render 'new'
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated."
      redirect_to @user
    else
      @title = "Edit user"
      render 'edit'
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
  end

  private

    def authenticate
      deny_access unless signed_in?
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
end
