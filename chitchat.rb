require 'active_support/all'
require 'pry'
require 'dotenv/load'
require 'csv'
require 'wit'

WIT_CLIENT = Wit.new(access_token: ENV['WIT_TOKEN'])

# CSV Based Dialog

class ChitChat
  
  def initialize(chat)
    
    @message = chat
  
  end
  
  def chitchat()
    # Remove commas, periods, apostrophes, and question marks from the message
    user_message_stripped = @message.gsub(/[,.?']/, '').downcase.strip
    arraycheck = 0
    sorry = "I'm sorry, I didn't quite understand."
  
    # Search for a matching message in the CSV
    dialogs = CSV.table("dialogs.csv", converters: :all)
      dialogs_array = dialogs.find  do |row|
      row.field(:message) == user_message_stripped
      end
  
    if dialogs_array.nil?
      # Send to Wit.ai for intent
         #  response = "The message being passed to Wit.ai is: " + user_message
        # response = WIT_CLIENT.message(user_message)
      
        wit_response = WIT_CLIENT.message(@chat)
        intent = wit_response['intents'][0]['name']
        response = getResponse(intent)
    
      if intent.nil?
        # If no response is found, return a default message
        
        sorry
        
      else
        
        response
        
      end
    
    else
      # If a response is found, return it
      response = dialogs_array[1]
      
      response
  
    end
  end
end
