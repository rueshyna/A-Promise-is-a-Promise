class PagesController < ApplicationController
  before_filter :authenticate, :except => [:home]
  def home
    if signed_in?
      @title="Home"
    else
      redirect_to signin_path
    end
  end

  def promise
    if params[:score].nil?
      @title = params[:title]
      @className = "goal"
    else
      @title = params[:title] + " --OK"
      @className = "finish"
    end
    @promise = current_user.promise.build(:title => @title, :when => params[:when], :howlong => params[:howlong], :start => params[:start], :end => params[:end], :allDay => params[:allDay], :score => params[:score], :happen => params[:happen],:improvement => params[:improvement], :className => @className)
    if @promise.save
      render :json => [@promise.id, @promise.title, @promise.start, @promise.end, @promise.allDay, @promise.className].to_json
    end
  end

  def load
    @promise = current_user.promise.all.to_json(:only=>[:id, :title, :start, :end, :allDay, :className])
    render :json =>@promise
  end

  def tips
    @promise = current_user.promise.find(params[:id])
    render :json => [@promise.title, @promise.when, @promise.howlong, @promise.score, @promise.happen, @promise.improvement].to_json
  end

  def edit
    @promise =Promise.find(params[:id])
    render :json => [@promise.title.chomp(" --OK"), @promise.when, @promise.howlong, @promise.score, @promise.happen, @promise.improvement].to_json
  end

  def update
    if params[:score].nil?
      @title = params[:title]
      @css = "goal"
    else
      @title = params[:title] + " --OK"
      @css = "finish"
    end
    @promise = Promise.find(params[:id]).update_attributes(:title =>@title, :when => params[:when], :howlong=> params[:howlong], :score => params[:score], :happen => params[:happen],:improvement => params[:improvement], :className => @css)
    render :json => @promise.to_json
  end

  def destory
    @promise = Promise.find(params[:id]).destroy
    render :json => @promise.to_json
  end
end
