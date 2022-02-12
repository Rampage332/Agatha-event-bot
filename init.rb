require 'discordrb'
require_relative 'event_list'
require_relative 'partner_list'
require_relative 'honor_list'
require 'dotenv/load'
require 'pry'
require 'csv'

@agatha_bot = Discordrb::Commands::CommandBot.new(
  token: ENV["TOKEN"],
  client_id: ENV["C_ID"],
  prefix: ["?", "<@740929277318398003>", "<@!740929277318398003>"],
  help_command: :comlist,
  spaces_allowed: true,
  ignore_bots: true
)

#==========================================================================================

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
    
    > **current_event [new/old]**
    > Will tell you what is the current ongoing daily event.
    > You can specify old or new based on how old your server is.

    > **next [event] [new/old]**
    > You can specify old or new based on how old your server is.

    The events you can choose from are:
      - **tiger**    [Smiledon Attack]
      - **wolf**     [Wolves]
      - **wish**     [Wish Tree]
      - **troops**   [Fast Training
      - **power**    [Power Up]
      - **research** [Research]
      - **build**    [Building]
      - **rune**     [Whispering of Runes]
      - **clean**    [Clean Up]
      - **barb**     [Barbarian War]

    Example: **next power new**
    
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
    
    > **current_event [new/old]**
    > Will tell you what is the current ongoing daily event.
    > You can specify old or new based on how old your server is.

    > **next [event] [new/old]**
    > You can specify old or new based on how old your server is.

    The events you can choose from are:
      - **tiger**    [Smiledon Attack]
      - **wolf**     [Wolves]
      - **wish**     [Wish Tree]
      - **troops**   [Fast Training
      - **power**    [Power Up]
      - **research** [Research]
      - **build**    [Building]
      - **rune**     [Whispering of Runes]
      - **clean**    [Clean Up]
      - **barb**     [Barbarian War]

    Example: **next power new**
    
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

#Brutal Age Events function

@agatha_bot.command(:next) do |event|
  params = event.message.content.split(' ')
  return unless params.size > 1
  
  if params[0] == "<@!740929277318398003>" || params[0] == "<@740929277318398003>"
      params[0] = params[1]
      params[1] = params[2]
      params[2] = params[3]
  end

  type = params[2].downcase rescue "old"

  event_list = EventList.new type
  details = event_list.next_event(params[1])

  event.channel.send_embed do |embed|
    embed.colour = 0xFF4000
    embed.title = details[:name]
    embed.thumbnail = Discordrb::Webhooks::EmbedThumbnail.new(url: details[:thumbnail])
    embed.add_field(name: 'Time until', value: details[:starts_in], inline: false)
    embed.add_field(name: "> Tips", value: details[:tips], inline: false)
  end
end

@agatha_bot.command(:current_event) do |event|
  type = event.message.content.split(' ')[1].downcase rescue "old"

  event_list = EventList.new type
  details = event_list.current_event
  details_count = details.size

  event.channel.send_embed do |embed|
    embed.colour = 0xFF4000
    embed.title = details[0][:name]
    embed.thumbnail = Discordrb::Webhooks::EmbedThumbnail.new(url: details[0][:thumbnail])
    embed.add_field(name: 'Time remaining', value: details[0][:ends_in], inline: false)
    embed.add_field(name: "> Tips", value: details[0][:tips], inline: false)
  end

  if details_count > 1
    event.channel.send_embed do |embed|
      embed.colour = 0xFF8000
      embed.title = details[1][:name]
      embed.thumbnail = Discordrb::Webhooks::EmbedThumbnail.new(url: details[1][:thumbnail])
      embed.add_field(name: 'Time remaining', value: details[1][:ends_in], inline: false)
      embed.add_field(name: "> Tips", value: details[1][:tips], inline: false)
    end
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
    
    honorlist = ['outpost','troop','shaman','beastmaster','warrior']
    
    if honor[1].nil?
        event.respond "Dear #{event.user.mention}, the correct command is @Agatha² honor __research name__ __level__."
    
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
                                Example: @Agatha²  honor Shaman def II 5
                                "
                end
            else event.respond "Dear #{event.user.mention}, the correct command is @Agatha² honor __research name__ __level__. \n > Use: @Agatha² honor help"
            end
        
        elsif honorlist.include? honor[1].downcase
        
            honor_cost = HonorCost.new(honor)
            
            check1 = ['hp','def','atk']
            check2 = ['warrior','shaman','beastmaster']
            check3 = ['i','ii']
            check4 = ['1','2','3','4','5','6','7','8','9','10']
            
            entrycheck = false
            
            if honor[1].downcase == 'outpost' && honor[2].downcase == 'vi'
                entrycheck = true
            
            elsif honor[1].downcase == 'troop'
                
                if check1.include? honor[2].downcase
                    if check4.include? honor[3]
                        entrycheck = true
                    end
                end
                
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
                    embed.add_field(name: '**Wood Cost**', value: "#{honor_cost.Get_Wood_Cost()}" , inline: true)
                    embed.add_field(name: "**Meat Cost**", value: "#{honor_cost.Get_Meat_Cost()}", inline: true)
                    embed.add_field(name: '**Mana Cost**', value: "#{honor_cost.Get_Mana_Cost()}", inline: true)
                    embed.add_field(name: "**Stone Cost**", value: "#{honor_cost.Get_Stone_Cost()}", inline: true)
                    embed.add_field(name: '**Ivory Cost**', value: "#{honor_cost.Get_Ivory_Cost()}", inline: true)
                    embed.add_field(name: "**Honor Marks Cost**", value: "#{honor_cost.Get_Honors_Cost()}", inline: true)
                    embed.footer = Discordrb::Webhooks::EmbedFooter.new(text: 'RAMPAGE #349', icon_url: 'https://i.imgur.com/WQtvk5Z.jpg')
                end
            
            elsif entrycheck == false
                event.respond "Dear #{event.user.mention}, the correct command is @Agatha² honor __research name__ __level__. \n > Use: @Agatha² honor help"
            
            end
            
            else
                event.respond "Dear #{event.user.mention}, the correct command is @Agatha² honor __research name__ __level__. \n > Use: @Agatha² honor help"
        end

end
#==========================================================================================
#Player Stats Function

@agatha_bot.command(:playerstats) do |event|
  player1 = event.message.content.split(' ')
  
  if player1[0] == "<@!740929277318398003>" || player1[0] == "<@740929277318398003>"
      player1[0] = player1[1]
      player1[1] = player1[2].downcase
      player1[2] = player1[3]
  end
  
  if player1[1].nil?
    event.respond "Dear #{event.user.mention}, the correct command is @Agatha² playerstats __Your Game Name__, which was submitted in the form."
  end

  csv_table = CSV.table("349 Managerial Sheet - AgathaSheet.csv", converters: :all)
  
      player_array = csv_table.find  do |row|
        
        row.field(:name) == player1[1]
        
  end
      
      if player_array[2] > 84
          
          img_url = "https://i.imgur.com/cyQCCmK.png"
          
      elsif player_array[2] <= 84 && player_array[2] >= 75
      
          img_url = "https://i.imgur.com/taqtJqO.png"
          
      elsif player_array[2] <= 74 && player_array[2] >= 65
          
              img_url = "https://i.imgur.com/klUjqlO.png"
              
      elsif player_array[2] <= 64 && player_array[2] >= 55
              
              img_url = "https://i.imgur.com/SuiZ5Vx.png"
              
      elsif player_array[2] <= 54 && player_array[2] >= 45
                      
              img_url = "https://i.imgur.com/GtRul0z.png"
              
      else
      
              img_url = "https://i.imgur.com/klUjqlO.png"
          
      end

            event.channel.send_embed do |embed|
                    embed.colour = 0xFF4000
                    embed.thumbnail = Discordrb::Webhooks::EmbedThumbnail.new(url:img_url)
                    embed.author = Discordrb::Webhooks::EmbedAuthor.new(name: "349 Players Stats")
                    embed.title = player_array[0].upcase
                    embed.description = "__                                                                           __"
                    embed.add_field(name: '**Server Rank**', value: player_array[1], inline: true)
                    embed.add_field(name: "**Overall Score**", value: "#{player_array[2]}%", inline: true)
                    embed.add_field(name: '**Viler Score**', value: "#{player_array[3]}%", inline: true)
                    embed.add_field(name: "**Runes Score**", value: "#{player_array[4]}%", inline: true)
                    embed.add_field(name: '**Equipment Score**', value: "#{player_array[5]}%", inline: true)
                    embed.add_field(name: "**Essentials Score**", value: "#{player_array[6]}%", inline: true)
                    embed.footer = Discordrb::Webhooks::EmbedFooter.new(text: 'Done by RAMPAGE #349', icon_url: 'https://i.imgur.com/WQtvk5Z.jpg')
      
          
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
  
  partnerslist = ['colonel','rockwell','valkyrie','prophet','marionette','isyduchess','prince','ursa','bape','judge','chacha','woody','tusk','executor','mr.dagger','nomad','warmaiden','panda','tricky','medusa','marksman','ghost','scarecrow']
  
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

@agatha_bot.command(:who) do |event|
    params = event.message.content.split(' ')
    if params[0] == "<@!740929277318398003>" || params[0] == "<@740929277318398003>"
        params[0] = params[1]
        params[1] = params[2]
        params[2] = params[3]
    end
   if params[1] == "made"
       event.respond "@Rampage is my daddy"
       end
end

@agatha_bot.command(:send_nudes) do |event|
  event.respond "Rampage!!, #{event.user.mention} is being naughty with me. HELP!"
end

@agatha_bot.command(:thanks) do |event|
  event.respond "You're welcome!, #{event.user.mention}"
end

@agatha_bot.command(:thank) do |event|
  event.respond "You're welcome!, #{event.user.mention}"
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

@agatha_bot.command(:I) do |event|
  params = event.message.content.split(' ')
  if params[0] == "<@!740929277318398003>" || params[0] == "<@740929277318398003>"
      params[0] = params[1]
      params[1] = params[2]
      params[2] = params[3]
      params[3] = params[4]
  end
  
  if params[1].downcase == "love"
      if params[2].downcase == "you" || params[2].downcase == "u"
          event.respond "Oh #{event.user.mention}, I'm flattered. However, please select one of the following rejections ..\n - It's not you it's me .. \n - I need to focus on me .. \n - It's complicated .."
      end
      
     elsif params[1].downcase == "hate"
        if params[2].downcase == "you" || params[2].downcase == "u"
            event.respond "Whyyy 😭, I feel so alone! \n \n \n J.K 🙄💅"
        end
     end
end

@agatha_bot.command(:i) do |event|
    params = event.message.content.split(' ')
    if params[0] == "<@!740929277318398003>" || params[0] == "<@740929277318398003>"
        params[0] = params[1]
        params[1] = params[2]
        params[2] = params[3]
        params[3] = params[4]
    end
    
    if params[1].downcase == "love"
        if params[2].downcase == "you" || params[2].downcase == "u"
            event.respond "Oh #{event.user.mention}, I'm flattered. However, please select one of the following rejections ..\n - It's not you it's me .. \n - I need to focus on me .. \n - It's complicated .."
        end
        
       elsif params[1].downcase == "hate"
        if params[2].downcase == "you" || params[2].downcase == "u"
            event.respond "Whyyy 😭, I feel so alone! \n \n \n J.K 🙄💅"
        end
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

@agatha_bot.command(:hello) do |event|
  event.respond "Hello chief #{event.user.mention} how can I help you today?"
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
