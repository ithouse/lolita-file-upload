class CreateFiles < ActiveRecord::Migration
  class << self
    
    def up
      create_table :lolita_files, :force=>true do |f|
        f.string :asset
        f.string :name
        f.string  :fileable_type
        f.string  :fileable_id
      end
    end

    def down

    end
  end
end