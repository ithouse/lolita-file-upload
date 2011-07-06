module Lolita
  module Configuration
    module Tab
      # FileTab extend Lolita default tab with new lolita accessors.
      # * <tt>extensions</tt> - Array of extension white list
      # * <tt>maxfilesize</tt> - uploaded file maximums size
    	class Files < Lolita::Configuration::Tab::Base
    	
  	  	lolita_accessor :extensions, :maxfilesize, :filters
        attr_reader :association, :uploader, :association_type, :editable_fields

        # As any other Lolita::Configuration::Tab this should receive _dbi_ object.
        # Additional _args_ that may represent methods, for details see Lolita::Configuration::Tab.
        # And block.
  	  	def initialize(dbi,*args,&block)
          @type=:files
  	  		@filters=[]
          @dbi=dbi
          @editable_fields=[]
          set_default_uploader
  	  		super
  	  	end

        # NOTE: Filters only limit frontend, backend limit is set in Uploader
        #
        # Add another filter or just title for uploader's extension_white_list
        # ====Example
        #     # using in lolita configuration definition
        #     lolita do
        #       tab(:file) do
        #         title "Pictures"
        #         filters "Images", "png,jpg"
        #         # OR
        #         filters "Pictures"
        #       end
        #     end
        #     
  	  	def filters(title=nil, extensions=nil)
  	  		@filters << {:title => title, :extensions => extensions || self.extension_white_list} if title
          (@filters.empty? && self.extension_white_list) ? [{:title => self.title, :extensions => self.extension_white_list}] : @filters
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

        def association_dbi
          Lolita::DBI::Base.new self.association.klass
        end

        def editable_fields *names
          @editable_fields = names unless names.empty?
          @editable_fields.empty? ? all_text_fields : @editable_fields
        end

        def extension_white_list
          self.association.klass.uploaders[self.uploader].new.extension_white_list
        end

        private

        def all_text_fields
          self.association_dbi.fields.collect{|field| field[:name] if field[:type] == "string"}.compact
        end

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