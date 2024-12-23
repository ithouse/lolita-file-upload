class CreatePosts < ActiveRecord::Migration[4.2]

  class << self
    def up
    	create_table :posts, :force=>true do |t|
			t.string :title
			t.text	 :body
		end
    end

    def down
      drop_table :posts
    end
  end
end
