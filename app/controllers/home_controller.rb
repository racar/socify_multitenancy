# Copyright (c) 2015, @sudharti(Sudharsanan Muralidharan)
# Socify is an Open source Social network written in Ruby on Rails This file is licensed
# under GNU GPL v2 or later. See the LICENSE.

class HomeController < ApplicationController
  before_action :set_user, except: :front
  respond_to :html, :js

  def index

  if  (Apartment::Tenant.current == 'public')
    redirect_to controller: 'tenants', action: 'new'
  end

    @post = Post.new
    @friends = @user.all_following.unshift(@user)
    @activities = PublicActivity::Activity.where(owner_id: @friends).order(created_at: :desc).paginate(page: params[:page], per_page: 10)

  end

  def front
    if  (Apartment::Tenant.current == 'public')
      redirect_to controller: 'tenants', action: 'new'
    end
    
    @posts = Post.where(privacity: 'P')
    @activities = PublicActivity::Activity.where(trackable_id: @posts).order(created_at: :desc).paginate(page: params[:page], per_page: 10)
  end

  def find_friends
    @friends = @user.all_following
    @users =  User.where.not(id: @friends.unshift(@user)).paginate(page: params[:page])
  end

  private
  def set_user
    @user = current_user
  end

end
