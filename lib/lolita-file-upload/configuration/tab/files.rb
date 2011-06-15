module Lolita
  module Configuration
    module Tab
      # FileTab extend Lolita default tab with new lolita accessors.
      # * <tt>extensions</tt> - Array of extension white list
      # * <tt>maxfilesize</tt> - uploaded file maximums size
    	class Files < Lolita::Configuration::Tab::Base
    	
  	  	lolita_accessor :extensions,:maxfilesize
        attr_reader :association, :association_type

        # As any other Lolita::Configuration::Tab this should receive _dbi_ object.
        # Additional _args_ that may represent methods, for details see Lolita::Configuration::Tab.
        # And block.
  	  	def initialize(dbi,*args,&block)
          @type=:files
  	  		@extensions=[]
          @dbi=dbi
          set_association
  	  		super
  	  	end

        # Add another extension to #extensions white list.
        # ====Example
        #     # using in lolita configuration definition
        #     lolita do
        #       tab(:file) do
        #         extension "Images", "png,jpg"
        #       end
        #     end
        #     
        #     # using for object
        #     Lolita::Configuration.FileTab.new(dbi).extension("pdf")
  	  	def extension(title, extensions)
  	  		@extensions << {:title => title, :extensions => extensions}
  	  	end
  	  	
        private

        def set_association
          @association=self.dbi.associations.detect{|k,assoc| assoc.class_name=="Lolita::Upload::File"}
          if @association
            @association=@association.last
            @association_type = self.dbi.association_macro(@association)
          end
        end

        def validate
          super
          unless self.association
            raise Lolita::AssociationError, "#{self.dbi.klass} has no association with Lolita::Upload::File. Put has_many :files, :class_name=>'Lolita::Upload::File' to have one."
          end
        end

      end
  	end
  end
end