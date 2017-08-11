class Ad < ActiveRecord::Base
  belongs_to :category
  belongs_to :member

  # Validates
  validates :title, :description, :category, :finish_date, :picture, presence: true
  validates :price, numericality: { greater_than: 0 }

  # gem money-rails
  monetize :price_cents

  scope :to_the, -> (member) { where(member: member) }
  scope :descending_order, -> (quantity = 10) { limit(quantity).order(created_at: :desc) }

  # méthod paperclip, picture is name by column in table Ad
  has_attached_file :picture, styles: { large: "800x300#", medium: "320x150#",
                                        thumb: "100x100>" },
                                        default_url: "/images/:style/missing.png"

  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
end
