class News < ActiveRecord::Base
  self.table_name = "lolita_news"
  include Lolita::Configuration
  has_many :tags

  mount_uploader :main_image, MainImageUploader
  mount_uploader :list_image, ListImageUploader

   lolita do
    tab(:images, :main_image)
  end
end