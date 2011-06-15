class CreateTags < ActiveRecord::Migration
  class << self
    
    def up
      create_table :lolita_tags, :force=>true do |f|
        f.string :name
        f.integer :news_id
      end
    end

    def down

    end
  end
end