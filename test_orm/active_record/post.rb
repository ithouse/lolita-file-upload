class Post < ActiveRecord::Base
	include Lolita::Configuration

  has_many :files, :class_name=>"Lolita::Multimedia::File", :as=>:fileable 
	lolita
end