require_relative 'response'
require_relative 'openai'
require 'active_support/all'
require 'pry'
require 'dotenv/load'
require 'csv'
require 'wit'
require 'openai'
require 'ruby/openai'

WIT_CLIENT = Wit.new(access_token: ENV['WIT_TOKEN'])

# CSV Based Dialog
  
  def chitchat(message)
    
    events_list = ['hunting season','adventure path','smilodon attack','strongest barbarian','king wolf','power up','altar','mine island contention','wolves plunder','fast training','research master','frostfire contention','clean up','whispering of runes','jungle raid','svs - horde invasion',"immanuel's blessing",'fullspeed build']
    partnerslist = ['colonel','rockwell','valkyrie','prophet','marionette','isyduchess','prince','ursa','bape','judge','chacha','woody','tusk','executor','mr.dagger','nomad','warmaiden','panda','tricky','medusa','marksman','ghost','scarecrow','thana','dragoness','messenger','golk','syren','sworddevil','voodoo','monk','babur','zither','assassin','yin','elf']

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
          
        elsif intent == "Brutal_Age_Partners"
          entity_keyword = witresponse['entities']['Brutal_Age_Partners:Brutal_Age_Partners'][0]['value']
            
          response = getResponse(intent.downcase)
        end
    
      if intent.nil?
        # If no response is found, pass it to ChatGPT
        client = OpenAI::Client.new

          response = client.completions(
            parameters: {
            model: "text-davinci-003",
            prompt: message,
            max_tokens: 250
             })
        
        ai_response = response['choices'][0]['text']
        
        ai_response
        
      else
        
        if entity_keyword.nil?
        
        response
          
        else
          
          if events_list.include? entity_keyword.downcase
          
            return entity_keyword
            
          elsif partnerslist.include? entity_keyword[1].downcase
            
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
