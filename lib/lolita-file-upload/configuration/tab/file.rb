module Lolita
  module Configuration
    # FileTab extend Lolita default tab with new lolita accessors.
    # * <tt>extensions</tt> - Array of extension white list
    # * <tt>maxfilesize</tt> - uploaded file maximums size
  	class FileTab < Lolita::Configuration::Tab
  	
	  	lolita_accessor :extensions,:maxfilesize

      # As any other Lolita::Configuration::Tab this should receive _dbi_ object.
      # Additional _args_ that may represent methods, for details see Lolita::Configuration::Tab.
      # And block.
	  	def initialize(dbi,*args,&block)
        @type=:file
	  		@extensions=[]
	  		super
	  	end

      # Add another extension to #extensions white list.
      # ====Example
      #     # using in lolita configuration definition
      #     lolita do
      #       tab(:file) do
      #         extension :pdf
      #       end
      #     end
      #     
      #     # using for object
      #     Lolita::Configuration.FileTab.new(dbi).extension("pdf")
	  	def extension(value)
	  		@extensions << value
	  	end
	  	
  	end
  end
end