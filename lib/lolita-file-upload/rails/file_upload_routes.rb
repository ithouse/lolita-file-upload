module ActionDispatch::Routing
  class Mapper
    protected

    def lolita_file_upload_route
      mapping=Lolita.add_mapping(:files,
        :class_name=>"Lolita::Upload::File",
        :path=>"lolita_upload"
      )
      lolita_scope mapping.name do
        namespace "lolita" do
          namespace "upload" do
            resources mapping.plural
          end
        end
      end
    end
  end
end