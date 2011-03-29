class Post < ActiveRecord::Base
	include Lolita::Configuration

  has_many :files, :class_name=>"Lolita::Upload::File", :as=>:fileable 
	lolita do
    tabs do
      default
      tab(:files) do

      end
    end
  end
end