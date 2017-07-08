class Ad < ActiveRecord::Base
  belongs_to :category
  belongs_to :member

  # gem money-rails
  monetize :price_cents

  scope :limit_six_order_desc, -> {limit(6).order(created_at: :desc)}

  # méthod paperclip, picture is name by column in table Ad
  has_attached_file :picture, styles: { medium: "300x150#", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
end
