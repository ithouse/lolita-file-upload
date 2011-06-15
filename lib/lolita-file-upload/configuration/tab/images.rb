module Lolita
  module Configuration
    module Tab
      class Images < Lolita::Configuration::Tab::Base

        def initialize dbi,type,tab_field,*args
          @type=:images
          @tab_field = tab_field
          super
        end

        def tab_field
          @tab_field
        end

      end
    end
  end
end

