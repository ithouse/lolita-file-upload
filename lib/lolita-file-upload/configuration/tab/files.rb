module Lolita
  module Configuration
    module Tab
      # FileTab extend Lolita default tab with new lolita accessors.
      # * <tt>extensions</tt> - Array of extension white list
      # * <tt>maxfilesize</tt> - uploaded file maximums size
    	class Files < Lolita::Configuration::Tab::Base
    	
  	  	lolita_accessor :extensions, :maxfilesize, :filters
        attr_reader :association, :uploader, :association_type

        # As any other Lolita::Configuration::Tab this should receive _dbi_ object.
        # Additional _args_ that may represent methods, for details see Lolita::Configuration::Tab.
        # And block.
  	  	def initialize(dbi, *args, &block)
          @type=:files
          @dissociate = true
  	  		@filters=[]
          @dbi=dbi
          set_default_association
  	  		super(dbi, @type, *args, &block)
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
          @uploader = name.to_sym if name
          @uploader
        end

        def association name=nil
          if name
            @association = self.dbi.associations[name.to_s]
            @association_type = @association.macro
            @uploader = @association.klass.uploaders.keys.first
          end
          @association
        end

        def association_dbi
          Lolita::DBI::Base.new self.association.klass
        end

        def field *args, &block
          if association
            field = Lolita::Configuration::Factory::Field.add(association_dbi,*args,&block)
            @fields << field
            field
          end
        end

        def default_fields
          if association
            association_dbi.fields.each{|db_field|
              self.field(:name => db_field.name, :type => db_field.type, :dbi_field => db_field) if db_field.content?
            }
          end
        end

        def editable_fields
          if association
            self.default_fields if self.fields.empty?
            self.fields
          end
        end

        def extension_white_list
          self.association.klass.uploaders[self.uploader].new.extension_white_list
        end

        private

        def all_text_fields
          adapter = Lolita::DBI::Base.create(self.association.klass)
          @text_fields ||=adapter.fields.collect{|field| 
            if field.type == "string"
              field.name
            end
          }.compact
        end

        def set_default_association
          @association=self.dbi.associations.detect{|name,assoc| 
            !assoc.polymorphic? && !assoc.klass.uploaders.empty?
          }
          if @association
            @association = @association.last
            @association_type = @association.macro
            @uploader = @association.klass.uploaders.keys.first #FIXME what to do when there is more than one uploader
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
