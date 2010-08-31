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
      #render :json => @promise.to_json(:methods=>:permalink, :only=> [:title, :start, :end, :allDay])
    end
  end

  def load_promise
    @promise = current_user.promise.all.to_json(:only=>[:title, :start, :end, :allDay])
    render  :json =>@promise
    #render :json => [:id=>'11', :title=>'title',:start=>'2010-8-1',:end=>'2010-8-1',:allDay=>true ].to_json
  end
end
