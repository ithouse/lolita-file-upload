module ActionDispatch::Routing
  class Mapper
    protected

    def lolita_file_upload_route mapping, controllers
      # /lolita/articles/1/pictures/5
      resources mapping.plural, :module=>mapping.module do
        collection do
          match "/:association/create", :to => "#{controllers[:uploads]}#create", :as => "create_upload", :method => :post
        end
        resources :uploads, :controller => controllers[:uploads], :path => "/:association"
      end
    end
  end
end