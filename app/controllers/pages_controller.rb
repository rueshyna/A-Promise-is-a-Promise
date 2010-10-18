class PagesController < ApplicationController
  before_filter :authenticate, :except => [:home]
  def home
    if signed_in?
      @title="Home"
      if !Relationship.find_by_user_id(current_user.id).nil?
        @partner = Relationship.find_all_by_group_id(Relationship.find_by_user_id(current_user).group_id)
      end
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
    @promise = Promise.find(params[:id])
    render :json => [@promise.title, @promise.when, @promise.howlong, @promise.score, @promise.happen, @promise.improvement,@promise.evaluation].to_json
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

  def pevent
    @partner = Promise.find_all_by_user_id(params[:id])
    render :json => @partner.to_json(:only=>[:id, :title, :start, :end, :allDay, :className])
  end

  def pcomm
    @promise = Promise.find(params[:id])
    @name = User.find(@promise.user_id).name

    if @promise.evaluation.nil?
      @promise.update_attributes(:evaluation => "")
    end

    @evaluations = @promise.evaluation+ params[:evaluation]+" --<i>"+ @name +"</i><br/>"

    @promise = @promise.update_attributes(:evaluation => @evaluations)
    render :json => @promise.to_json
  end

  def cload
    @promise = Promise.find(params[:id])
    render :json => [@promise.evaluation].to_json
  end
end
