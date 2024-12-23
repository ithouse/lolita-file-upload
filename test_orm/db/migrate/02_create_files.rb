class CreateFiles < ActiveRecord::Migration[4.2]
  class << self
    
    def up
      create_table :lolita_files, :force=>true do |f|
        f.string :asset
        f.string :name
        f.string  :fileable_type
        f.string  :fileable_id
        f.integer :asset_size
        f.string  :asset_extension
        f.timestamps
      end
    end

    def down

    end
  end
end
