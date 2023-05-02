require 'active_support/all'
require 'pry'

def eventsDetails

  def initialize(event)
  
   @event = event
    
  end
  
  def thumbnail()
    
    case @event
      
      when "hunting season" then url = "https://i.imgur.com/FrnqoHa.jpg"
      when "adventure path" then url = "https://i.imgur.com/FrnqoHa.jpg"
      when "smilodon attack" then url = "https://i.imgur.com/6DFT2mM.png"
      when "strongest barbarian" then url = "https://i.imgur.com/NLPuTxx.png"
      when "king wolf" then url = "https://i.imgur.com/x2Z1aTd.png"
      when "power up" then url = "https://i.imgur.com/4UrtqaJ.png"
      when "altar" then url = "https://i.imgur.com/FrnqoHa.jpg"
      when "mine island contention" then url = "https://i.imgur.com/FrnqoHa.jpg"
      when "wolves plunder" then url = "https://i.imgur.com/x2Z1aTd.png" 
      when "fast training" then url = "https://i.imgur.com/jB06kDQ.png"
      when "research master" then url = "https://i.imgur.com/o5A3bwL.png"
      when "frostfire contention" then url = "https://i.imgur.com/FrnqoHa.jpg"
      when "clean up" then url = "https://i.imgur.com/Q7yXYia.png"
      when "whispering of runes" then url = "https://i.imgur.com/n9zPcsR.png"
      when "jungle raid" then url = "https://i.imgur.com/FrnqoHa.jpg"
      when "svs - horde invasion" then url = "https://i.imgur.com/FrnqoHa.jpg"
      when "imannuel's blessing" then url = "https://i.imgur.com/FrnqoHa.jpg"
      when "fullspeed build" then url = "https://i.imgur.com/QubyUdH.png"
        
    end  
  
        url
        
  end
        
      def tips()
    
        case @name
      
          when "hunting season" then tip = "    "
          when "adventure path" then tip = "    "
          when "smilodon attack" then tip = "This is a really fun event that requires your focus and time.

               \r\nFor your personal defense have positive morale partners set, preferably 5 star partner, defensive runes, flamen, and defensive boost.

               \r\nAlso **VERY IMPORTANT** make sure you don't have lower tier troops at home, it is preffered to have only t4-t5 at home. Lower level tier troops will go to hospital and make you burn early.

               \r\nReinforce the lowest power players in your clan for the biggest points per defense at start. And after wave 18-20 start focusing on getting as many people to wave 25 as possible."
          
          when "strongest barbarian" then tip = "This event is a low-risk one. If you want to test your might and experiment your attacks, this is the event to do so. 

               \r\nSince this event was updated, no troops die, all defeated troops go into hospital 2. However, the healing cost is high in gems if you want to heal before the end of the event.

               \r\nIf you are going for rewards/rank there are multiple things you can do:

                  \r\n1. Make sure you're on full battle talents/runes/flamen/boosts and you have your best team set on defensive. ( use of antiscout is highly recomanded)
                  \r\n2. If you find a big target organize a rally with your clan members ( use of dragonkin skills and advanced research **Set Off** is highly recomanded)"
          
          when "king wolf" then tip = "   "
          when "power up" then tip = "**Power UP** is one of the most easiest events to get the 3 rewards and this is how:

               \r\nYou can for example complete training of troops during **Fast Training** and then just take the troops out during this event.

               \r\nYou can level your dragonkin, level up your account by hording experience boosts or even and this is for SVS fighters, use **Revive Gate** to ressurect your dead troops."
          
          when "altar" then tip = "   "
          when "mine island contention" then tip = "   "
          when "wolves plunder" then tip = "This event is a great source of **Clan Coins**, and it's broken down in 3 separate events **Plunder**, **Kill Plunderers**, **Horder Protector**.

               \r\nFor **Plunder** make sure you're not using farm talents or farm boost for maximum points per stamina used. I also suggest deciding with the active clans for designated wolfs for each clan/horde to avoid collision.

               \r\nFor **Kill Plunderers** the best way to do it is trade with other horde players 100.000 T1 for recovery pack and maximum rewards. Alternatively you can have an alt in a different horde and kill your own troops.

               \r\nFor **Horde Protector** the most common method is killing the wolves then farming them with farming talents and runes, with small amount of troops, the main idea is it takes 2-3 seconds for an attack to register so send enough troops to farm for 2-3 seconds then come back." 
          
          when "fast training" then tip = "This is a very good event to play because you can get rewards twice once for **FAST TRAINING** and once for **POWER UP** and this is how:
                \r\nUsing the [Troop Calculator](https://bautils.herokuapp.com/) you can make sure you get all the three rewards without over using speedups.

                \r\nIt's important to save speedups for other events like **BRUTAL SEASON** or **SOLDIER ASSEMBLY**.

                \r\nTo make sure you take full advantage of this event you start training ahead of time (usually during **POWER UP** event) in advance and get all rewards without using any speedups, ofcourse for small accounts this doesn't work the same but you can figure it out."
         
          when "research master" then tip = "There's a lot of dicussion around this event especially since game has added other research.

               \r\nNever forget to set your talents to research, and rune set to I personally use **Fine Pottery**, but there are other way to boost the research speed like dragonkin skills, **Laurel** the blue flamen, research boost scrolls, **Sacred Flame** and level of your **Temple of Wisdom**.

               \r\nOne of the first suggestions I have is if you're at the beginning of your journey, and have your paid dragonkin he will help you up with completing research faster. Following this idea when you reach advanced may of the lower level research will be cheap in speedups and can be completed instantly.

               \r\nIt really depends on the play style some people queue researches that don't take long others rush for battle research t4/t5."
          
          when "frostfire contention" then tip = "   "
          when "clean up" then tip = "One of the most rewarding events, and all you have to do is to farm.

               \r\nThere are a few tips and tricks here. For one make sure you farm the resources you have the best gather bonus in, this includes runes and talents to be set to farming.

               \r\nTry and farm level 6 and 5 resources preferably on your own color. Make sure you have territory gathering boost set in runes for extra points.

               \r\nFor ranking you will need to prepare for this event and make sure you get all your marches + extra march on high level resources to end soon after **Clean UP** starts, this will give you a nice boost.

               \r\nGet your clan mates to help by donating almost completed resources or high level ones to you."
          
          when "whispering of runes" then tip = "For this event it is very important to not waste any expensive fusions. Because during **SVS Battle Preparation** there is a quest that requires you to spend mana by fusing runes.

               \r\nNever go for rank unless you are a spender and rather try and get as close to second/third rewards just by fusing low cost ones.

               \r\nVery important to keep in mind you can summon runes once a day for free (Free re-roll included).

               \r\nNow another important part is how do you get these rune chests for free. This part is simple Events like **Era** , **Altar**, **SVS Battle Prep**, **SVS** will give you rune chests.

               \r\nAnother good way to get them is form **Wild Hunt** or hunting monsters, even during **Wolves** event you get runes every time you kill a wolf."
          
          when "jungle raid" then tip = "   "
          when "svs - horde invasion" then tip = "Every other week, every two servers are matched up and battle over each other's temples. 
               The battle will last 24 hours. The result of this battle is determined by the number of temples captured (two temples available). If each server captures one temple, then the result is decided by temple occupation points. The more time the temple is occupied, the more points are gained. If temple occupation times are equal, then the battle is decided by the number of troops killed (sacrificial points).

               \r\nTips: 

               \r\nMake sure you activate you shield when inactive or in need of protection. 
               \r\nScouting & attacking will activate war frenzy for 15 minutes each time.
               \r\nAvoid activating war frenzy if you require shielding
               \r\nAvoid teleporting to enemy server if you don't have evasive manoeuvres
               \r\nBefore getting into battle, make sure you activate your war gear-up: Runes, Flamens, boost items, talents .. 
               \r\nAlways setup partners on defense
               \r\nSome events are available on both sides of the servers, take advantage!"
         
          when "imannuel's blessing" then tip = "   "
          when "fullspeed build" then tip = "For this event make sure you have your talents set to building, runes set to the most construction speed, I personally use **White Oak**.

               \r\nA few things to add is the $0.99 starter pack is worth buying gives you an extra free 10 minutes to auto complete buildings (very helpful at start).

               \r\nYou can boost you construction speed with dragonkin skills, construction scrolls and **Sacred Flame**.

               \r\nMake sure your clan mates tap that help button it's a huge help in lowering the time on construction."
        
    end  
  
            tip
            
  end
  
end
