require 'dotenv/load'
require "openai"

OpenAI.configure do |config|
    config.access_token = ENV['OpenAI_API']
end
