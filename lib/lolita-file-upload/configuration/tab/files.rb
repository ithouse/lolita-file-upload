module Lolita
  module Configuration
    # FileTab extend Lolita default tab with new lolita accessors.
    # * <tt>extensions</tt> - Array of extension white list
    # * <tt>maxfilesize</tt> - uploaded file maximums size
  	class FilesTab < Lolita::Configuration::Tab
  	
	  	lolita_accessor :extensions,:maxfilesize
      attr_reader :association

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
      #         extension :pdf
      #       end
      #     end
      #     
      #     # using for object
      #     Lolita::Configuration.FileTab.new(dbi).extension("pdf")
	  	def extension(value)
	  		@extensions << value
	  	end
	  	
      private

      def set_association
        @association=self.dbi.associations.detect{|k,assoc| assoc.class_name=="Lolita::Upload::File"}
        @association=@association.last if @association
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