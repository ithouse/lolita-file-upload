require 'rubygems'
require 'cover_me'
CoverMe.config do |c|
    # where is your project's root:
    puts c.project.root 
  
    # what files are you interested in coverage for:
    c.file_pattern # => /(#{CoverMe.config.project.root}\/app\/.+\.rb|#{CoverMe.config.project.root}\/lib\/.+\.rb)/i (default)
  
    # where do you want the HTML generated:
    c.html_formatter.output_path # => File.join(CoverMe.config.project.root, 'coverage') (default)
  
    # what do you want to happen when it finishes:
    c.at_exit = Proc.new {
     
        index = File.join(CoverMe.config.html_formatter.output_path, 'index.html')
        if File.exists?(index)
          `open #{index}`
        end

    }
end
#require "rails_app/config/environment"
require 'ffaker'
require 'factory_girl'
require File.expand_path('lib/lolita-file-upload')
current_orm=:active_record

require File.expand_path("test_orm/#{current_orm}")

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}
if defined?(Rails)
	require 'rspec/rails' 
	RSpec.configure do |config|

		config.mock_with :rspec

		config.use_transactional_fixtures =  true if current_orm==:active_record

	end
end

CoverMe.complete!