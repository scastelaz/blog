# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Blog::Application.initialize!

Paperclip.options[:command_path] = "/usr/local/bin'"