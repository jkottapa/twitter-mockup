class IndexController < ApplicationController
  def home
  	@micropost = []
  	if signed_in?
  		@micropost = current_user.microposts.build
  		@feed_items = current_user.feed.paginate(page: params[:page])
  	end
  end

  def about
  end

  def contact
  end
end
