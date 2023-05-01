require 'active_support/all'
require 'pry'
require 'dotenv/load'
require 'csv'
require 'wit'

WIT_CLIENT = Wit.new(access_token: ENV['WIT_TOKEN'])

# CSV Based Dialog

def chitchat(user_message)
  # Remove commas, periods, apostrophes, and question marks from the message
  user_message_stripped = user_message.gsub(/[,.?']/, '').downcase.strip
  arraycheck = 0
  
  # Search for a matching message in the CSV
  dialogs = CSV.table("dialogs.csv", converters: :all)
    dialogs_array = dialogs.find  do |row|
    row.field(:message) == user_message_stripped
    end
  
  if dialogs_array.nil?
    # Send to Wit.ai for intent
       #  response = "The message being passed to Wit.ai is: " + user_message
       # response = WIT_CLIENT.message(user_message)
       puts WIT_CLIENT.message(user_message)
       response = ""
    
    if response.nil?
      # If no response is found, return a default message
      return "I'm sorry, I didn't quite understand."
    else
      return response
    end
    
  else
    # If a response is found, return it
    response = dialogs_array[1]
    return response
  
  end
end
