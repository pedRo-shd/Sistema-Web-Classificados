class Site::HomeController < ApplicationController
  layout "site"

  def index
    @categories = Category.order_by_description
    @ads = Ad.limit_six_order_desc
  end
end
