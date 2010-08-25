class SessionsController < ApplicationController
  def new
    if signed_in?
       redirect_to root_path
    else
       @title='Sign in'
    end
  end

  def create
    user = User.authenticate(params[:session][:school_id],
                             params[:session][:password])
    if user.nil?
      flash.now[:error] = "Invalid student ID/password combination."
      @title = "Sign in"
      render 'new'
    else
      sign_in user
      redirect_back_or user
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
