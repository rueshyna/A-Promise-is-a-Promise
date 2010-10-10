class GroupsController < ApplicationController
  before_filter :authenticate

  def index
    @title = "Group"
    @groups = Group.all
    @relation = Relationship.new
  end

  def show
    @group = Group.find(params[:id])
    @title = "Add Group "+@group.group
    @relationship = current_user.relationship.build(:group_id => @group.id);
    if @relationship.save
      flash[:success] = "Add Group Success!!!"
      redirect_to gindex_path
    else
      flash[:error] = "Add Group Fail!!!"
      redirect_to gindex_path
    end
  end

  def new
    @group = Group.new
    @title = "Group"
  end

  def create
    @group = current_user.group.build(params[:group])
    if @group.save
      flash[:success] = "Group creat!!!"
      redirect_to gindex_path
    else
      redirect_to gindex_path
    end
  end
end
