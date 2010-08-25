class TasksController < ApplicationController
  def promise
    @title = 'promise'
    @promise = Promise.new
  end

  def recoder
    @title = 'My Recoder'
  end

  def communicate
    @title = 'Partner\'s State'
  end

  def test_action
      render :json => [params[:name] , params[:what] , 3 , 4].to_json
  end
end
