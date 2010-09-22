class PagesController < ApplicationController
  before_filter :authenticate
  def home
    @title="Home"
  end

  def promise
    if params[:check].nil?
      @title = params[:title]
    else
      @title = params[:title] + " --" +params[:check]
    end
    @promise = current_user.promise.build(:title => @title,:when => params[:when], :howlong => params[:howlong], :start => params[:start], :end => params[:end], :allDay => params[:allDay], :commits => params[:commits])
    if @promise.save
      render :json => [@promise.id, @promise.title, @promise.start, @promise.end, @promise.allDay].to_json
    end
  end

  def load
    @promise = current_user.promise.all.to_json(:only=>[:id, :title, :start, :end, :allDay])
    render :json =>@promise
  end

  def tips
    @promise = current_user.promise.find(params[:id])
    render :json => [@promise.title, @promise.when, @promise.howlong, @promise.commits].to_json
  end

  def edit
    @promise =Promise.find(params[:id])
    render :json => [@promise.title.chomp(" --OK"), @promise.when, @promise.howlong, @promise.commits].to_json
  end

  def update
    if params[:check].nil?
      @title = params[:title]
    else
      @title = params[:title] + " --" +params[:check]
    end
    @promise = Promise.find(params[:id]).update_attributes(:title =>@title, :when => params[:when], :howlong=> params[:howlong])
    render :json => @promise.to_json
  end

  def destory
    @promise = Promise.find(params[:id]).destroy
    render :json => @promise.to_json
  end
end
