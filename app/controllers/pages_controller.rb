class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def checkout
    @user = current_user
    @order = @user.orders.last
  end
end
