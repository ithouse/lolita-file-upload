class CreateNews < ActiveRecord::Migration
  class << self
    
    def up
      create_table :lolita_news, :force=>true do |f|
        f.string :body
        f.string :main_image
        f.string  :list_image
        f.timestamps
      end
    end

    def down

    end
  end
end