class TasksController < ApplicationController
  before_filter :authenticate

  def promise
    @title = 'promise'
  end

  def recoder
    @title = 'My Recoder'
  end

  def communicate
    @title = 'Partner\'s State'
  end

  def do_promise
    @promise = current_user.promise.build(:title => params[:title],:when => params[:when], :howlong => params[:howlong], :start => params[:start], :end => params[:end], :allDay => params[:allDay])
    if @promise.save
      render :json => [@promise.id, @promise.title, @promise.start, @promise.end, @promise.allDay].to_json
    end
  end

  def load_promise
    @promise = current_user.promise.all.to_json(:only=>[:id, :title, :start, :end, :allDay])
    render :json =>@promise
  end

  def promise_tips
    @promise = current_user.promise.find(params[:id])
    render :json => [@promise.title, @promise.when, @promise.howlong].to_json
  end

  def edit_promise
    @promise =Promise.find(params[:id])
    render :json => [@promise.title, @promise.when, @promise.howlong].to_json
  end

  def update_promise
    @promise = Promise.find(params[:id]).update_attributes(:title =>params[:title], :when => params[:when], :howlong=> params[:howlong])
    render :json => @promise.to_json
  end
end
