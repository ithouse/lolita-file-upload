require 'cover_me'

CoverMe.config do |c|
    # where is your project's root:
    "------"+c.project.root 
  
    # what files are you interested in coverage for:
    c.file_pattern # => /(#{CoverMe.config.project.root}\/app\/.+\.rb|#{CoverMe.config.project.root}\/lib\/.+\.rb)/i (default)
  
    # where do you want the HTML generated:
    c.html_formatter.output_path # => File.join(CoverMe.config.project.root, 'coverage') (default)
  
    # what do you want to happen when it finishes:

end

at_exit do
    CoverMe.complete!
end