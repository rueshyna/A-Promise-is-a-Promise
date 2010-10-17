class GroupsController < ApplicationController
  before_filter :authenticate

  def index
    @title = "Group"
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
    @who = Relationship.find_by_user_id(current_user.id)

    if !@who.nil? && @who.group_id == @group.id
      if @who.destroy
        flash[:success] = "Leave Group Success!!!"
        redirect_to gindex_path
      else
        flash[:error] = "Leave Group Fail!!!"
        redirect_to gindex_path
      end
    else
      @relationship = current_user.relationship.build(:group_id => @group.id)
        if @relationship.save
          flash[:success] = "Add Group Success!!!"
          redirect_to gindex_path
        else
          flash[:error] = "Add Group Fail!!!"
          redirect_to gindex_path
        end
    end
  end

  def new
    @group = Group.new
    @title = "Group"
  end

  def create
    @group = current_user.group.build(params[:group])
    @check = Relationship.find_by_user_id(current_user.id)

    if @check.nil? && @group.save
      @relationship = current_user.relationship.build(:group_id => @group.id)
      @relationship.save
      flash[:success] = "Group has been created and added to group"
      redirect_to gindex_path
    else
      flash[:error] = "You can't create group"
      redirect_to gindex_path
    end
  end

  def destroy
    @group = Group.find_by_user_id(current_user.id)
    @relationship = Relationship.find_all_by_group_id(@group.id)

    @relationship.each do |r|
      r.destroy
    end
    @group.destroy
  end
end
