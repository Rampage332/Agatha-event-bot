require 'net/http'
require 'json'
require 'httparty'

# Define Random Fact function ===================================================

def get_random_fact
  response = HTTParty.get("https://sciencefacts.io/api/facts?category=all")
  parsed_response = JSON.parse(response.body)
  fact = parsed_response["data"].sample["fact"]
  return fact
end

# Define Random joke function ===================================================

def get_joke
  url = URI("https://v2.jokeapi.dev/joke/Any")

  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true

  request = Net::HTTP::Get.new(url)

  response = http.request(request)
  result = JSON.parse(response.read_body)

  if result['type'] == 'single'
    return result['joke']
  elsif result['type'] == 'twopart'
    return "#{result['setup']} #{result['delivery']}"
  else
    return "Sorry, I'm not in the mood for jokes right now."
  end
end

# getResponse Function ===========================================================

def getResponse(intent)
  
  i = Random.new.rand(1..3)
  
  case intent
    
    #==============================================
    
    when 'greetings' then
      
      if i ==1
        return 'Hi, how may I help you?'
      
      elsif i == 2
        return 'Greetings! 🖖'
        
      else
        return 'Howdy 👩‍🌾'
        
      end    
   #==============================================
    
    when 'goodbye' then
           
      if i ==1
        return 'See ya!🖐'
      
      elsif i == 2
        return 'Later!'
        
      else
        return 'Take care! 🖐'
        
      end    
      
   #==============================================
        
    when 'compliment' then
        
      if i ==1
        return "Thank you! You're too kind"
      
      elsif i == 2
        return "You make this girl blush 🙈"
        
      else
        return "Thanks"
        
      end    
    #==============================================
    
    when 'fact' then response = get_random_fact()
      
    #==============================================
    
    when 'trivia' then

      url = 'https://opentdb.com/api.php?amount=1&type=multiple'
      uri = URI(url)
      response = Net::HTTP.get(uri)
      result = JSON.parse(response)
      question = result['results'][0]['question']
      return "Here's a random trivia question for you: #{question}"
      
    #==============================================
    
    when 'thank_you' then
   
      if i ==1
        return "Anytime!"
      
      elsif i == 2
        return "Don't mention it!"
        
      else
        return "You're most welcome!"
        
      end    
      
    #==============================================
    
    when 'apology' then
 
      if i ==1
        return "No worries .. "
      
      elsif i == 2
        return "It's ok"
        
      else
        return "No problem"
        
      end    
    #==============================================
    
    when 'joke' then return get_joke
      
    #==============================================
        
  else then return "I'm sorry, I didn't quite understand"
        
  end
end
