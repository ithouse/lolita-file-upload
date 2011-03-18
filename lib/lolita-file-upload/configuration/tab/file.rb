module Lolita
  module Configuration
  	class FileTab < Lolita::Configuration::Tab
  	
	  	lolita_accessor :extensions,:maxsize

	  	def initialize(dbi,*args,&block)
        @type=:file
	  		@extensions=[]
	  		super
	  	end

	  	def extension(value)
	  		@extensions << value
	  	end
	  	
  	end
  end
end