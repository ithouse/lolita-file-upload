require 'rubygems'

require File.expand_path('test_orm/coverage')
require File.expand_path('test_orm/support')
#require "rails_app/config/environment"
require 'ffaker'
require 'factory_girl'
require File.expand_path('lib/lolita-file-upload')

require "carrierwave"
current_orm=:active_record
require 'carrierwave/orm/'+current_orm.to_s.gsub("_","")

require File.expand_path("test_orm/#{current_orm}")

Dir[File.expand_path("app/**/*.rb")].each do |path|
    require path
end

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}
if defined?(Rails)
	require 'rspec/rails' 
	RSpec.configure do |config|

		config.mock_with :rspec

		config.use_transactional_fixtures =  true if current_orm==:active_record

	end
end
