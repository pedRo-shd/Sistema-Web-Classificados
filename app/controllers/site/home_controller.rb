class Site::HomeController < SiteController

  def index
    @categories = Category.order_by_description
    @ads = Ad.limit_six_order_desc
  end
end
