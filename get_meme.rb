require 'discordrb'
require 'net/http'
require 'json'
require 'httparty'

def get_random_meme
  
  # Get a random meme URL from the API
  response = HTTParty.get("https://api.imgflip.com/get_memes")
  memes = response["data"]["memes"]
  random_meme = memes.sample
  meme_url = random_meme["url"]

  # Send a Discord embed with the meme image
  event.channel.send_embed do |embed|
    embed.title = random_meme["name"]
    embed.image = Discordrb::Webhooks::EmbedImage.new(url: meme_url)
  
end
