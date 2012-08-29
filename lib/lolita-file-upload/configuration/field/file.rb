module Lolita
  module Configuration
    module Field

      class File< Lolita::Configuration::Field::Base
        lolita_accessor :version

        def initialize dbi,name,*args, &block
          super
        end

        def cache_name
          :"#{name}_cache"
        end

        def has_image?(record)
          record.send(:"#{name}?")
        end

        def preview_image(record)
          record.send(name).send(accessible_version).url
        end

        private

        def accessible_version
          @version || :preview
        end

      end

    end
  end
end
