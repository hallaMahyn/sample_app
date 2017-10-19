class StaticPagesController < ApplicationController 
  layout "application"
  def home
    if signed_in?
    @user = current_user
    @micropost = current_user.microposts.build
    @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
