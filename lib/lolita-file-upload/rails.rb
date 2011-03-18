if defined?(Rails)
  puts "--load rails"
  module LolitaFileUpload
    class Engine < Rails::Engine

    end
  end
end