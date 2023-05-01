require 'net/http'
require 'json'
require 'httparty'

# Define Random Fact function ===================================================

def get_chuck_norris_fact
  url = 'https://api.chucknorris.io/jokes/random'
  uri = URI(url)
  response = Net::HTTP.get(uri)
  json = JSON.parse(response)
  json['value']
end

def get_harry_potter_fact
  url = 'https://hp-api.herokuapp.com/api/characters/random'
  uri = URI(url)
  response = Net::HTTP.get(uri)
  json = JSON.parse(response)
  json['name']
end

def get_anime_fact
  url = 'https://anime-facts-rest-api.herokuapp.com/api/v1/random'
  uri = URI(url)
  response = Net::HTTP.get(uri)
  json = JSON.parse(response)
  json['data'][0]['fact']
end

def get_random_fact
  api_choice = rand(1..3)
    case api_choice
    when 1
     fact = get_chuck_norris_fact
    when 2
     fact = get_harry_potter_fact
   when 3
     fact = get_anime_fact
  end
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
        
  else return "I'm sorry, I didn't quite understand"
        
  end
end
