class Ad < ActiveRecord::Base

  # Callbacks Markdown gem Redcarpet
  before_save :md_to_html

  # Associações
  belongs_to :category
  belongs_to :member

  # Validates
  validates :title, :description, :description_md, :description_short, :category, :finish_date, :picture, presence: true
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

  # Markdown gem Redcarpet
  # Para saber mais, ver doc no github
  def md_to_html
   options = {
     filter_html: true,
     link_attributes: {
       rel: "nofollow",
       target: "_blank"
     }
   }
   extensions = {
     space_after_headers: true,
     autolink: true
   }
   renderer = Redcarpet::Render::HTML.new(options)
   markdown = Redcarpet::Markdown.new(renderer, extensions)
   self.description = markdown.render(self.description_md)
  end
end
