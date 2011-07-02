module Lolita
  module Configuration
    module Tab
      # FileTab extend Lolita default tab with new lolita accessors.
      # * <tt>extensions</tt> - Array of extension white list
      # * <tt>maxfilesize</tt> - uploaded file maximums size
    	class Files < Lolita::Configuration::Tab::Base
    	
  	  	lolita_accessor :extensions,:maxfilesize
        attr_reader :association, :uploader, :association_type

        # As any other Lolita::Configuration::Tab this should receive _dbi_ object.
        # Additional _args_ that may represent methods, for details see Lolita::Configuration::Tab.
        # And block.
  	  	def initialize(dbi,*args,&block)
          @type=:files
  	  		@extensions=[]
          @dbi=dbi
          set_default_uploader
  	  		super
  	  	end

        # NOTE: Extensions only limit frontend, backend limit is set in Uploader
        #
        # Add another extension to #extensions white list.
        # ====Example
        #     # using in lolita configuration definition
        #     lolita do
        #       tab(:file) do
        #         title "Pictures"
        #         extensions "Images", "png,jpg"
        #       end
        #     end
        #     
  	  	def extensions(title=nil, extensions=nil)
  	  		@extensions << {:title => title, :extensions => extensions} if title && extensions
          @extensions
  	  	end
  	  	
        def extensions_title title
          #@extensions << {:title => title, :extensions => self.uploader.extension_white_list}
        end

        def uploader name=nil
          if name
            @uploader = name.to_sym
            @association = self.dbi.klass
            @association_type = :self
          end
          @uploader
        end

        def association name=nil
          if name
            @association = self.dbi.associations[name]
            @association_type = self.dbi.association_macro(@association)
            @uploader = @association.klass.uploaders.keys.first
          end
          @association
        end

        private

        def set_default_uploader
          unless self.dbi.klass.uploaders.empty?
            @uploader = self.dbi.klass.uploaders.keys.first
            @association = self.dbi.klass
            @association_type = :self
          else
            set_default_association
          end
        end

        def set_default_association
          @association=self.dbi.associations.detect{|k,assoc| !assoc.klass.uploaders.empty? }
          if @association
            @association=@association.last
            @association_type = self.dbi.association_macro(@association)
            @uploader = @association.klass.uploaders.keys.first
          end
        end

        def validate
          super
          unless self.uploader
            raise "#{self.dbi.klass} has no uploader. Add your custom uploader or use Lolita's built in `has_many :files, :class_name=>'Lolita::Upload::File'`."
          end
        end

      end
  	end
  end
end