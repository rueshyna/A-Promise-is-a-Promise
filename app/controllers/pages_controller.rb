class PagesController < ApplicationController
  def home
    @title="Home"
    if !signed_in?
      redirect_to signin_path
    end
  end
end
