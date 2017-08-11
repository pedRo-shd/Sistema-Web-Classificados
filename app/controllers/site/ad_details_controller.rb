class Site::AdDetailsController < SiteController
  before_action :set_id, only: [:show]

  def show
    #
  end

  private

  def set_id
    @ad = Ad.find(params[:id])
  end
end
