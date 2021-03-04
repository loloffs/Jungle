class Admin::DashboardController < ApplicationController
  def show
    @prod = Product.count
    @categories = Category.count
  end
end


