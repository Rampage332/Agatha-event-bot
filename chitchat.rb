require_relative 'response'
require 'active_support/all'
require 'pry'
require 'dotenv/load'
require 'csv'
require 'wit'
require 'openai'

WIT_CLIENT = Wit.new(access_token: ENV['WIT_TOKEN'])

# CSV Based Dialog
  
  def chitchat(message)
    
    events_list = ['hunting season','adventure path','smilodon attack','strongest barbarian','king wolf','power up','altar','mine island contention','wolves plunder','fast training','research master','frostfire contention','clean up','whispering of runes','jungle raid','svs - horde invasion',"immanuel's blessing",'fullspeed build']
    # Remove commas, periods, apostrophes, and question marks from the message
    user_message_stripped = message.gsub(/[,.?']/, '').downcase.strip
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
      
        wit_response = WIT_CLIENT.message(message)
        if wit_response.nil? || wit_response['intents'].empty?
          intent = nil
        
        else 
         intent = wit_response['intents'][0]['name'] 
        end
      
        if intent == "BA_next_event_time"
            entity_keyword = wit_response['entities']['Brutal_Age_events:Brutal_Age_events'][0]['value']
          
            response = getResponse(intent.downcase)
        end
    
      if intent.nil?
        # If no response is found, pass it to ChatGPT
        client = OpenAI::Client.new(access_token: ENV['OpenAI_API'])

          prompt = message
          temperature = 0.7
          max_tokens = 100
          top_p = 0.9

          response = client.completions(
                      model: 'davinci-002',
                      prompt: prompt,
                      temperature: temperature,
                      max_tokens: max_tokens,
                      top_p: top_p
                      )
        
        response
        
      else
        
        if entity_keyword.nil?
        
        response
          
        else
          
          if events_list.include? entity_keyword.downcase
          
            return entity_keyword
          
          else
            
            response
          
          end
          
        end  
        
      end
    
    else
      # If a response is found, return it
      response = dialogs_array[1]
      
      response
  
    end
  end
