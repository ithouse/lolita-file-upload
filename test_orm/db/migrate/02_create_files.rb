class CreateFiles < ActiveRecord::Migration
  class << self
    
    def up
      create_table :lolita_files, :force=>true do |f|
        f.string :asset
      end
    end

    def down

    end
  end
end