require 'discordrb'
require_relative 'events_details'
require_relative 'partner_list'
require_relative 'honor_list'
require_relative 'chitchat'
require_relative 'response'
require_relative 'ba_events'
require_relative 'events_details'
require 'dotenv/load'
require 'pry'
require 'csv'
require 'bundler'
require 'wit'

list_of_commands = ['comlist','help','honor','partner','✊','✌️','🖐','send_nudes','shush','shut','cigarette','coffee','coin','digging','burn','fusion','runes','relics','catfish','dolmen','moral','temple_titles','hall_of_war','totems','kill']
events_list = ['hunting season','adventure path','smilodon attack','strongest barbarian','king wolf','power up','altar','mine island contention','wolves plunder','fast training','research master','frostfire contention','clean up','whispering of runes','jungle raid','svs - horde invasion',"immanuel's blessing",'fullspeed build']

@agatha_bot = Discordrb::Commands::CommandBot.new(
  token: ENV["TOKEN"],
  client_id: ENV["C_ID"],
  prefix: ["?", "<@740929277318398003>", "<@!740929277318398003>"],
  help_command: :comlist,
  spaces_allowed: true,
  ignore_bots: true
)

#========================================================================================

@agatha_bot.mention do |event|
  is_command = true

  command_check = event.message.content.split(' ')
  if list_of_commands.include? command_check[1].downcase
    is_command = false
  end

  # Check if the bot is mentioned and no command is presented
  if event.message.mentions.include?(@agatha_bot.profile) && is_command
    
    # Chuck norris function
    if event.message.content.downcase.include? ("chuck norris")
      respond = "Did someone say Chuck Norris? \n" + get_chuck_norris_fact()
      
    elsif event.message.content.downcase.include? ("meme")
      
        # Get a random meme URL from the API
          response = HTTParty.get('https://www.reddit.com/r/memes/random.json', headers: {"User-Agent": "Agatha Discord Bot"})
           json = JSON.parse(response.body)
            data = json[0]['data']['children'][0]['data']
            name = data['title']
            meme_url = data['url']
      
      
        event.channel.send_embed do |embed|
          embed.title = name
          embed.image = Discordrb::Webhooks::EmbedImage.new(url: meme_url)
        end
    
    else
    # Call the chitchat function to generate a response
    umessage = event.message.content.split.drop(1).join(' ')
    respond = chitchat(umessage)
    end
    # Send the response back to the user
    if events_list.include? respond
  
      # Brutal Age events function  ... 
      puts respond
      ba_event_detail = EventDetails.new(respond.downcase)
      ba_event = GetEvent.new(respond.downcase)
      event.channel.send_embed do |embed|
                    embed.colour = 0xFF4000
                    embed.thumbnail = Discordrb::Webhooks::EmbedThumbnail.new(url:ba_event_detail.url)
                    embed.author = Discordrb::Webhooks::EmbedAuthor.new(name: "Brutal Age Events")
                    embed.title = ba_event.title
                    embed.description = ba_event_detail.tip
                    embed.add_field(name: 'Starts on (UTC)', value: ba_event.starts_on, inline: true)
                    embed.add_field(name: "Time until", value: ba_event.time_left_tostart, inline: true)
                    embed.add_field(name: "Time to finish", value: ba_event.time_left_tofinish, inline: true)
                    embed.footer = Discordrb::Webhooks::EmbedFooter.new(text: 'RAMPAGE #349', icon_url: 'https://i.imgur.com/WQtvk5Z.jpg')
      end
    else 
        
       event.message.reply(respond)
    end
    
  end
end

#========================================================================================

#Main menu (Help & Comlist) Functions

@agatha_bot.command(:comlist) do |event|
  event.user.pm.send_embed do |embed|
    embed.colour = 0xFF8000
    embed.thumbnail = Discordrb::Webhooks::EmbedThumbnail.new(url: 'https://i.imgur.com/pnTz7VH.png')
    embed.footer = Discordrb::Webhooks::EmbedFooter.new(text: 'RAMPAGE #349', icon_url: 'https://i.imgur.com/WQtvk5Z.jpg')
    embed.description ="
    You may mention @Agatha² or start your command with a question mark
    
    > **comlist** or **help**
      Lists all commands.

    > **who made you**: Will tell you who's the author of this bot.
    
    > **coffee please**: Agatha will bring you coffee.
    
    > **hello**: Agatha will say hello to you (not alone anymore).
    
    > **fusion guide**: Link to Rain's fusion guide
    
    > **runes**: A guide for different Runes setups
    
    > **totems**: A guide describing Totems Buffs
    
    > **dolmen**: A guide describing the functionality of dolmen
    
    > **temple_titles**: A guide describing Temple Titles boosts
    
    > **moral**: A guide on how partners moral work
    
    > **catfish**: A simple guide on how to get free catfish skill
    
    > **hall_of_war**: A guide on how many gems or skull piles you need to upgrade your hall of war
    
    > **digging**: Quick stats on how many eggs you get from diggers
    > For Normal eggs use: @Agatha² digging normal
    > For Rare eggs use: @Agatha² digging rare"
    
    end
  event.user.pm.send_embed do |embed|
    embed.colour = 0xFF8000
    embed.description ="
    > **burn [HP]**
    > Use this command so that Agatha tells you how many times you need to attack an outpost to completely burn
    > Example: **@Agatha² burn 21000**
    
    > **partner**
    
    > Agatha will fetch the partner guide from an availble list of partners.
    > Try: @Agatha² partner list
    > This list is constantly being updated.
    > **Example: @Agatha² partner Green Colonel**
    
    > **honor** (Beta)
    
    > Agatha will tell you the cost of each honor research
    > Try: @Agatha² honor help
    > High level costs will be updated once they are available
    "
  end
end

@agatha_bot.command(:help) do |event|
  event.user.pm.send_embed do |embed|
    embed.colour = 0xFF8000
    embed.thumbnail = Discordrb::Webhooks::EmbedThumbnail.new(url: 'https://i.imgur.com/pnTz7VH.png')
    embed.footer = Discordrb::Webhooks::EmbedFooter.new(text: 'RAMPAGE #349', icon_url: 'https://i.imgur.com/WQtvk5Z.jpg')
    embed.description ="
    You may mention @Agatha² or start your command with a question mark
    
    > **comlist** or **help**
      Lists all commands.

    > **who made you**: Will tell you who's the author of this bot.
    
    > **coffee please**: Agatha will bring you coffee.
    
    > **hello**: Agatha will say hello to you (not alone anymore).
    
    > **fusion guide**: Link to Rain's fusion guide
    
    > **runes**: A guide for different Runes setups
    
    > **totems**: A guide describing Totems Buffs
    
    > **dolmen**: A guide describing the functionality of dolmen
    
    > **temple_titles**: A guide describing Temple Titles boosts
    
    > **moral**: A guide on how partners moral work
    
    > **catfish**: A simple guide on how to get free catfish skill
    
    > **hall_of_war**: A guide on how many gems or skull piles you need to upgrade your hall of war
    
    > **digging**: Quick stats on how many eggs you get from diggers
    > For Normal eggs use: @Agatha² digging normal
    > For Rare eggs use: @Agatha² digging rare"
    
    end
  event.user.pm.send_embed do |embed|
    embed.colour = 0xFF8000
    embed.description ="
    > **burn [HP]**
    > Use this command so that Agatha tells you how many times you need to attack an outpost to completely burn
    > Example: **@Agatha² burn 21000**
    
    > **partner**
    
    > Agatha will fetch the partner guide from an availble list of partners.
    > Try: @Agatha² partner list
    > This list is constantly being updated.
    > **Example: @Agatha² partner Green Colonel**
    
    > **honor** (Beta)
    
    > Agatha will tell you the cost of each honor research
    > Try: @Agatha² honor help
    > High level costs will be updated once they are available
    "
  end
end

#==========================================================================================

#Brutal Age Honor Cost Function

@agatha_bot.command(:honor) do |event|

    honor = event.message.content.split(' ')

    if honor[0] == "<@!740929277318398003>" || honor[0] == "<@740929277318398003>"
        honor[0] = honor[1]
        honor[1] = honor[2]
        honor[2] = honor[3]
        honor[3] = honor[4]
        honor[4] = honor[5]
    end
    
    honorlist = ['outpost','troop','shaman','beastmaster','warrior','agf','ap','champion','wyverness','sorceress']
    
    if honor[1].nil?
        event.respond "Dear #{event.user.mention}, the correct command is @Agatha² honor __research name__ __tier__ __level__."
    
    elsif honor[2].nil? && honor[1].downcase != 'outpost'
        if honor[1].downcase == 'help'
            event.channel.send_embed do |embed|
                embed.colour = 0xFF8000
                embed.title = "Honor Research Cost"
                embed.footer = Discordrb::Webhooks::EmbedFooter.new(text: 'RAMPAGE #349', icon_url: 'https://i.imgur.com/WQtvk5Z.jpg')
                embed.description = "
                                Available commands
                                
                                > Outpost VI
                                > Troop Hp
                                > Warrior Atk I
                                > Warrior Hp I
                                > Warrior Def I
                                > Shaman Atk I
                                > Shaman Hp I
                                > Shaman Def I
                                > Beastmaster Atk I
                                > Beastmaster Hp I
                                > Beastmaster Def I
                                > Troop Def
                                > Warrior Atk II
                                > Warrior Hp II
                                > Warrior Def II
                                > Shaman Atk II
                                > Shaman Hp II
                                > Shaman Def II
                                > Beastmaster Atk II
                                > Beastmaster Hp II
                                > Beastmaster Def II
                                > Troop Atk
                                > AGF (Advance Ghost Force)
                                > AP (Advance Pursuit)
                                > Champion
                                > Wyverness
                                > Sorceress
                                
                                Example: @Agatha²  honor Shaman def II 5
                                "
                end
            else event.respond "Dear #{event.user.mention}, the correct command is @Agatha² honor __research name__ __tier__ __level__. \n > Use: @Agatha² honor help"
            end
        
        elsif honorlist.include? honor[1].downcase
        
            honor_cost = HonorCost.new(honor)
            
            check1 = ['hp','def','atk']
            check2 = ['warrior','shaman','beastmaster']
            check3 = ['i','ii']
            check4 = ['1','2','3','4','5','6','7','8','9','10']
            check5 = ['1','2','3','4','5','6','7','8','9','10','11','12','13','14','15']
            check6 = ['champion','wyverness','sorceress']
            
            entrycheck = false
            
            if honor[1].downcase == 'outpost' && honor[2].downcase == 'vi'
                entrycheck = true
            
            elsif honor[1].downcase == 'troop'
                if check1.include? honor[2].downcase
                    if check4.include? honor[3]
                        entrycheck = true
                    end
                end
            
            elsif honor[1].downcase == 'agf'
                if check5.include? honor[2].downcase
                        entrycheck = true
                end
            
            
            elsif honor[1].downcase == 'ap'
                if check4.include? honor[2].downcase
                        entrycheck = true
                end
        
            elsif check6.include? honor[1].downcase
                        entrycheck = true

            elsif check2.include? honor[1].downcase
                if check1.include? honor[2].downcase
                    if check3.include? honor[3].downcase
                        if check4.include? honor[4]
                            entrycheck = true
                        end
                    end
                end
                
            end
            
            if entrycheck == true
                event.channel.send_embed do |embed|
                    embed.colour = 0xFF4000
                    embed.thumbnail = Discordrb::Webhooks::EmbedThumbnail.new(url:"https://i.imgur.com/UDLpqr0.jpg")
                    embed.author = Discordrb::Webhooks::EmbedAuthor.new(name: "Honor Research Cost")
                    embed.title = "#{honor_cost.Get_Research_Title()}"
                    embed.description = "__                                                                           __"
                    embed.add_field(name: '**Wood Cost** <:lumber:947154392971358270>', value: "#{honor_cost.Get_Wood_Cost()}" , inline: true)
                    embed.add_field(name: "**Meat Cost** <:meat:947154392891666513>", value: "#{honor_cost.Get_Meat_Cost()}", inline: true)
                    embed.add_field(name: '**Mana Cost** <:mana:947154393021689876>', value: "#{honor_cost.Get_Mana_Cost()}", inline: true)
                    embed.add_field(name: "**Stone Cost** <:stone:947154393424343060>", value: "#{honor_cost.Get_Stone_Cost()}", inline: true)
                    embed.add_field(name: '**Ivory Cost** <:ivory:947154393134932008>', value: "#{honor_cost.Get_Ivory_Cost()}", inline: true)
                    embed.add_field(name: "**Honor Marks Cost** <:marks:947154393319473182>", value: "#{honor_cost.Get_Honors_Cost()}", inline: true)
                    embed.footer = Discordrb::Webhooks::EmbedFooter.new(text: 'RAMPAGE #349', icon_url: 'https://i.imgur.com/WQtvk5Z.jpg')
                end
            
            elsif entrycheck == false
                event.respond "Dear #{event.user.mention}, the correct command is @Agatha² honor __research name__ __tier__ __level__. \n > Use: @Agatha² honor help"
            
            end
            
            else
                event.respond "Dear #{event.user.mention}, the correct command is @Agatha² honor __research name__ __tier__ __level__. \n > Use: @Agatha² honor help"
        end

end

#==========================================================================================

#Partners Guide Function

@agatha_bot.command(:partner) do |event|
  partner1 = event.message.content.split(' ')
  
  if partner1[0] == "<@!740929277318398003>" || partner1[0] == "<@740929277318398003>"
      partner1[0] = partner1[1]
      partner1[1] = partner1[2]
      partner1[2] = partner1[3]
  end
  
  partnerslist = ['colonel','rockwell','valkyrie','prophet','marionette','isyduchess','prince','ursa','bape','judge','chacha','woody','tusk','executor','mr.dagger','nomad','warmaiden','panda','tricky','medusa','marksman','ghost','scarecrow','thana','dragoness','messenger','golk']
  
  if partner1[1].nil?
      event.respond "Dear #{event.user.mention}, the correct command is @Agatha² partner __color__ __partner name__."
  
  elsif partner1[2].nil?
      
      if partner1[1].downcase == 'list'
          event.channel.send_embed do |embed|
              embed.colour = 0xFF8000
              embed.title = "Availabe Partners List (Use Partner Name as Below)"
              embed.footer = Discordrb::Webhooks::EmbedFooter.new(text: 'RAMPAGE #349', icon_url: 'https://i.imgur.com/WQtvk5Z.jpg')
              embed.description = "

                > 1- Colonel
                > 2- Rockwell
                > 3- Valkyrie
                > 4- Prophet
                > 5- Marionette
                > 6- Isyduchess
                > 7- Prince
                > 8- Ursa
                > 9- Bape
                > 10- Judge
                > 11- Chacha
                > 12- Woody
                > 13- Tusk
                > 14- Executor
                > 15- Mr.Dagger
                > 16- Nomad
                > 17- Warmaiden
                > 18- Panda
                > 19- Tricky
                > 20- Medusa
                > 21- Red Marksman
                > 22- Red Ghost
                > 23- Green Scarecrow
                > 24- Thana
                > 25- Dragoness
                > 26- Messenger
                > 27- Golk
                > 28- Syren
                > 29- Sworddevil
                > 30- Voodoo
                > 31- Babur
                > 32- Monk
                > 33- Zither
                > 34- Assassin

                Example: @Agatha² partner Blue Rockwell
                "
            end
          
          else
            event.respond "Dear #{event.user.mention}, the correct command is @Agatha² partner __color__ __partner name__."
        end
        
  elsif partnerslist.include? partner1[2].downcase
  
        partner = PartnerList.new(partner1[1].downcase,partner1[2].downcase)
  
        case partner1[1].downcase
            when 'red' then
                    embedcolor = 0xB76357
                    imageurl = partner.Red_Partners()
            when 'blue' then
                    embedcolor = 0x577DB7
                    imageurl = partner.Blue_Partners()
            when 'green' then
                    embedcolor = 0x599159
                    imageurl = partner.Green_Partners()
                    
            else event.respond "Dear #{event.user.mention}, you must choose a proper color (red, blue or green) followed by the partner name from the list \n _**Example**_: @Agatha² partner blue colonel"
        end
  
    event.channel.send_embed do |embed|
        embed.colour = embedcolor
        embed.title = partner.Partner_Title()
        embed.image = Discordrb::Webhooks::EmbedImage.new(url:imageurl)
        embed.footer = Discordrb::Webhooks::EmbedFooter.new(text: 'RAMPAGE #349', icon_url: 'https://i.imgur.com/WQtvk5Z.jpg')
    end
  

  elsif !(partnerslist.include? partner1[2].downcase)
  
        event.respond "Dear #{event.user.mention}, #{partner1[2]} is not yet added to my list! Go bug Rampage about it"
  end
  
end

#==========================================================================================

#Outpost Burn Function

@agatha_bot.command(:burn) do |event|
  params = event.message.content.split(' ')
  return unless params.size > 1
  
  if params[0] == "<@!740929277318398003>" || params[0] == "<@740929277318398003>"
      params[0] = params[1]
      params[1] = params[2]
      params[2] = params[3]
  end
  
  if params[1].to_i == 0
    event.respond "Hello chief, please provide a valid outpost HP as number for example: ?burn 25000"
  else
    event.respond "Hello chief, you need to attack that outpost #{(params[1].to_i/1800.0).ceil} times"
  end
end

#==========================================================================================

# Brutal Age Guides Functions

@agatha_bot.command(:fusion) do |event|
    params = event.message.content.split(' ')
    if params[0] == "<@!740929277318398003>" || params[0] == "<@740929277318398003>"
        params[0] = params[1]
        params[1] = params[2]
        params[2] = params[3]
    end
 
  event.channel.send_embed do |embed|
    embed.colour = 0xFF8000
    embed.title = "Rune fusion quantity requirements"
    embed.image = Discordrb::Webhooks::EmbedImage.new(url: 'https://i.imgur.com/xmzDspf.jpg')
  end
end

@agatha_bot.command(:runes) do |event|
    params = event.message.content.split(' ')
    if params[0] == "<@!740929277318398003>" || params[0] == "<@740929277318398003>"
        params[0] = params[1]
        params[1] = params[2]
        params[2] = params[3]
    end
    
  event.channel.send_embed do |embed|
    embed.colour = 0xFF8000
    embed.title = "Runes Setup Guide"
    embed.image = Discordrb::Webhooks::EmbedImage.new(url: 'https://i.imgur.com/Cyhm1Ml.png')
  end
end

@agatha_bot.command(:relics) do |event|
    params = event.message.content.split(' ')
    if params[0] == "<@!740929277318398003>" || params[0] == "<@740929277318398003>"
        params[0] = params[1]
        params[1] = params[2]
        params[2] = params[3]
    end
    
  event.channel.send_embed do |embed|
    embed.colour = 0xFF8000
    embed.title = "Relics Rewards Statistics"
    embed.image = Discordrb::Webhooks::EmbedImage.new(url: 'https://i.imgur.com/LKZdZKt.jpg')
  end
end

@agatha_bot.command(:catfish) do |event|
    params = event.message.content.split(' ')
    if params[0] == "<@!740929277318398003>" || params[0] == "<@740929277318398003>"
        params[0] = params[1]
        params[1] = params[2]
        params[2] = params[3]
    end
    
  event.channel.send_embed do |embed|
    embed.colour = 0xFF8000
    embed.title = "How to get free Skill Catfish"
    embed.image = Discordrb::Webhooks::EmbedImage.new(url: 'https://i.imgur.com/8KsO97F.jpg')
  end
end

@agatha_bot.command(:dolmen) do |event|
    params = event.message.content.split(' ')
    if params[0] == "<@!740929277318398003>" || params[0] == "<@740929277318398003>"
        params[0] = params[1]
        params[1] = params[2]
        params[2] = params[3]
    end
    
  event.channel.send_embed do |embed|
    embed.colour = 0xFF8000
    embed.title = "Dolmen guide"
    embed.image = Discordrb::Webhooks::EmbedImage.new(url: 'https://i.imgur.com/CdlYXao.png')
  end
end

@agatha_bot.command(:moral) do |event|
    params = event.message.content.split(' ')
    if params[0] == "<@!740929277318398003>" || params[0] == "<@740929277318398003>"
        params[0] = params[1]
        params[1] = params[2]
        params[2] = params[3]
    end
    
  event.channel.send_embed do |embed|
    embed.colour = 0xFF8000
    embed.title = "Partners moral guide guide"
    embed.image = Discordrb::Webhooks::EmbedImage.new(url: 'https://i.imgur.com/iQcrOs2.jpg')
  end
end

@agatha_bot.command(:temple_titles) do |event|
    params = event.message.content.split(' ')
    if params[0] == "<@!740929277318398003>" || params[0] == "<@740929277318398003>"
        params[0] = params[1]
        params[1] = params[2]
        params[2] = params[3]
    end
    
  event.channel.send_embed do |embed|
    embed.colour = 0xFF8000
    embed.title = "Temple Titles Guide"
    embed.image = Discordrb::Webhooks::EmbedImage.new(url: 'https://i.imgur.com/PusPSfm.jpg')
  end
end

@agatha_bot.command(:hall_of_war) do |event|
    params = event.message.content.split(' ')
    if params[0] == "<@!740929277318398003>" || params[0] == "<@740929277318398003>"
        params[0] = params[1]
        params[1] = params[2]
        params[2] = params[3]
    end
    
  event.channel.send_embed do |embed|
    embed.colour = 0xFF8000
    embed.title = "Hall of War Guide"
    embed.image = Discordrb::Webhooks::EmbedImage.new(url: 'https://i.imgur.com/V9JWQPF.png')
  end
end

@agatha_bot.command(:totems) do |event|
    params = event.message.content.split(' ')
    if params[0] == "<@!740929277318398003>" || params[0] == "<@740929277318398003>"
        params[0] = params[1]
        params[1] = params[2]
        params[2] = params[3]
    end
    
  event.channel.send_embed do |embed|
    embed.colour = 0xFF8000
    embed.title = "Totems Buffs Guide"
    embed.image = Discordrb::Webhooks::EmbedImage.new(url: 'https://i.imgur.com/MhPmFDK.jpg')
  end
end

@agatha_bot.command(:digging) do |event|
    params = event.message.content.split(' ')
    if params[0] == "<@!740929277318398003>" || params[0] == "<@740929277318398003>"
        params[0] = params[1]
        params[1] = params[2]
        params[2] = params[3]
    end
    
    if params[1].downcase == 'rare'
        event.channel.send_embed do |embed|
            embed.colour = 0xFF8000
            embed.title = "Rare Eggs Digging Guide"
            embed.image = Discordrb::Webhooks::EmbedImage.new(url: 'https://i.imgur.com/uzC6Xx5.jpg')
        end
        
    elsif params[1].downcase == 'normal'
            event.channel.send_embed do |embed|
                embed.colour = 0xFF8000
                embed.title = "Normal Eggs Digging Guide"
                embed.image = Discordrb::Webhooks::EmbedImage.new(url: 'https://i.imgur.com/oWnSemP.jpg')
            end
    else
    "Dear #{event.user.mention}, please select either rare or normal eggs. Ex: @Agatha² digging rare"
    end
        
end

#==========================================================================================

#Fun commands functions

@agatha_bot.command(:send_nudes) do |event|
  event.respond "Rampage!!, #{event.user.mention} is being naughty with me. HELP!"
end

@agatha_bot.command(:kill) do |event|
  params = event.message.content.split(' ')
  if params[0] == "<@!740929277318398003>" || params[0] == "<@740929277318398003>"
      params[0] = params[1]
      params[1] = params[2]
      params[2] = params[3]
  end
  
  if params[1].downcase == "rampage" || params[1] == "<@712036624590176285>" || params[1] == "<@!712036624590176285>" || params[1] == "@RAMPAGE"
      event.respond "Rampage is protected by the force!"
  elsif
      event.respond "Okay!!, #{event.user.mention} Hold my beer. 🍺"
      end
end

@agatha_bot.command(:coffee) do |event|
    params = event.message.content.split(' ')
    if params[0] == "<@!740929277318398003>" || params[0] == "<@740929277318398003>"
        params[0] = params[1]
        params[1] = params[2]
        params[2] = params[3]
        params[3] = params[4]
    end
    
    if params[1].nil?
        event.respond "#{event.user.mention}, say the magic word. @Agatha² coffee __please__ 💅"
        
    elsif params[1].downcase == "please" || params[1].downcase == "pls"
          event.respond "There you go #{event.user.mention}! ☕"
          
    elsif params[1].downcase != "please"
            event.respond "#{event.user.mention}, say the magic word. @Agatha² coffee __please__ 💅"
    end
end

@agatha_bot.command(:shush) do |event|
  event.respond "Talk to the hand, cause the face is on vacation ✋"
end

@agatha_bot.command(:shut) do |event|
  event.respond "No, you STFU! "
end

@agatha_bot.command(:cigarette) do |event|
    params = event.message.content.split(' ')
    if params[0] == "<@!740929277318398003>" || params[0] == "<@740929277318398003>"
        params[0] = params[1]
        params[1] = params[2]
        params[2] = params[3]
        params[3] = params[4]
    end
    
    if params[1].nil?
        event.respond "#{event.user.mention}, say @Agatha² cigarette __please__ 💅"
        
    elsif params[1].downcase == "please" || params[1].downcase == "pls"
          event.respond "There you go #{event.user.mention}! Let me light it for you 🚬"
          
    elsif params[1].downcase != "please"
            event.respond "#{event.user.mention}, say @Agatha² cigarette __please__ 💅"
    end
end

# Rock, Paper Scissors Game

@agatha_bot.command(:✊) do |event|
    params = event.message.content.split(' ')
    if params[0] == "<@!740929277318398003>" || params[0] == "<@740929277318398003>"
        params[0] = params[1]
        params[1] = params[2]
        params[2] = params[3]
        params[3] = params[4]
    end
    
    i = Random.new.rand(1..3)
    
    if i == 1
        event.respond "Rock, paper, scissors .. ✊ Tied!"
    
    elsif i == 2
        event.respond "Rock, paper, scissors .. ✌️ You win!"
        
    elsif i == 3
        event.respond "Rock, paper, scissors .. 🖐 I win! 💅"

    end
end

@agatha_bot.command(:✌️) do |event|
    params = event.message.content.split(' ')
    if params[0] == "<@!740929277318398003>" || params[0] == "<@740929277318398003>"
        params[0] = params[1]
        params[1] = params[2]
        params[2] = params[3]
        params[3] = params[4]
    end
    
    i = Random.new.rand(1..3)
    
    if i == 1
        event.respond "Rock, paper, scissors .. ✊ I win! 💅"
    
    elsif i == 2
        event.respond "Rock, paper, scissors .. ✌️ Tied!"
        
    elsif i == 3
        event.respond "Rock, paper, scissors .. 🖐 You win!"

    end
end

@agatha_bot.command(:🖐) do |event|
    params = event.message.content.split(' ')
    if params[0] == "<@!740929277318398003>" || params[0] == "<@740929277318398003>"
        params[0] = params[1]
        params[1] = params[2]
        params[2] = params[3]
        params[3] = params[4]
    end
    
    i = Random.new.rand(1..3)
    
    if i == 1
        event.respond "Rock, paper, scissors .. ✊ You win!"
    
    elsif i == 2
        event.respond "Rock, paper, scissors .. ✌️ I win! 💅"
        
    elsif i == 3
        event.respond "Rock, paper, scissors .. 🖐 Tied!"

    end
end

# Coin Flip

@agatha_bot.command(:coin) do |event|
    params = event.message.content.split(' ')
    if params[0] == "<@!740929277318398003>" || params[0] == "<@740929277318398003>"
        params[0] = params[1]
        params[1] = params[2]
        params[2] = params[3]
        params[3] = params[4]
    end
    
    i = Random.new.rand(1..2)
    
    if params[1].downcase == 'toss'
        if i == 1
            event.channel.send_embed do |embed|
                embed.colour = 0xFF8000
                embed.title = "Heads"
                embed.image = Discordrb::Webhooks::EmbedImage.new(url: 'https://i.imgur.com/nVOZM3H.png')
            end
                
        elsif i == 2
            event.channel.send_embed do |embed|
                embed.colour = 0xFF8000
                embed.title = "Tails"
                embed.image = Discordrb::Webhooks::EmbedImage.new(url: 'https://i.imgur.com/hVfupOt.png')
            end
        end
    end
end
@agatha_bot.run
