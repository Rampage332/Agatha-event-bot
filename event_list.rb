require_relative 'timeline'
require 'active_support/all'
require 'pry'

class EventList
  attr_accessor :event_list

  NEW_EVENT_LIST = [
  {
     day: 0,
     time: 0,
     event_name: "clean"
  },{
     day: 0,
     time: 0,
     event_name: "troops"
  },{
     day: 0,
     time: 1,
     event_name: "power"
  },{
     day: 0,
     time: 2,
     event_name: "research"
  },{
     day: 0,
     time: 3,
     event_name: "rune"
  },{
     day: 0,
     time: 4,
     event_name: "troops"
  },{
     day: 0,
     time: 5,
     event_name: "wish"
  },{
     day: 1,
     time: 0,
     event_name: "research"
  },{
     day: 1,
     time: 1,
     event_name: "troops"
  },{
     day: 1,
     time: 2,
     event_name: "wish"
  },{
     day: 1,
     time: 3,
     event_name: "clean"
  },{
     day: 1,
     time: 4,
     event_name: "power"
  },{
     day: 1,
     time: 5,
     event_name: "build"
  },{
     day: 2,
     time: 0,
     event_name: "troops"
  },{
     day: 2,
     time: 1,
     event_name: "wish"
  },{
     day: 2,
     time: 2,
     event_name: "clean"
  },{
     day: 2,
     time: 3,
     event_name: "power"
  },{
     day: 2,
     time: 4,
     event_name: "research"
  },{
     day: 2,
     time: 5,
     event_name: "rune"
  },{
     day: 3,
     time: 0,
     event_name: "research"
  },{
     day: 3,
     time: 1,
     event_name: "rune"
  },{
     day: 3,
     time: 2,
     event_name: "troops"
  },{
     day: 3,
     time: 3,
     event_name: "wish"
  },{
     day: 3,
     time: 4,
     event_name: "wolf"
  },{
     day: 3,
     time: 5,
     event_name: "wolf"
  },{
     day: 4,
     time: 0,
     event_name: "rune"
  },{
     day: 4,
     time: 1,
     event_name: "wish"
  },{
     day: 4,
     time: 2,
     event_name: "power"
  },{
     day: 4,
     time: 3,
     event_name: "research"
  },{
     day: 4,
     time: 4,
     event_name: "build"
  },{
     day: 4,
     time: 5,
     event_name: "troops"
  },{
     day: 5,
     time: 0,
     event_name: "wish"
  },{
     day: 5,
     time: 3,
     event_name: "barb"
  },{
     day: 5,
     time: 4,
     event_name: "barb"
  },{
     day: 5,
     time: 5,
     event_name: "barb"
  },{
     day: 6,
     time: 0,
     event_name: "barb"
  },{
     day: 6,
     time: 1,
     event_name: "barb"
  },{
     day: 6,
     time: 2,
     event_name: "barb"
  },{
     day: 6,
     time: 3,
     event_name: "power"
  },{
     day: 6,
     time: 4,
     event_name: "research"
  },{
     day: 6,
     time: 5,
     event_name: "clean"
  },{
     day: 6,
     time: 5,
     event_name: "rune"
  },{
     day: 3,
     time: 0,
     event_name: "tiger"
  },{
     day: 3,
     time: 1,
     event_name: "tiger"
  },{
     day: 3,
     time: 2,
     event_name: "tiger"
  },{
     day: 3,
     time: 3,
     event_name: "tiger"
  },{
     day: 3,
     time: 4,
     event_name: "tiger"
  },{
     day: 3,
     time: 5,
     event_name: "tiger"
  }
   ]

  OLD_EVENT_LIST = [
      {
         day: 0,
         time: 0,
         event_name: "clean"
      },{
         day: 0,
         time: 0,
         event_name: "troops"
      },{
         day: 0,
         time: 1,
         event_name: "power"
      },{
         day: 0,
         time: 2,
         event_name: "research"
      },{
         day: 0,
         time: 3,
         event_name: "rune"
      },{
         day: 0,
         time: 4,
         event_name: "troops"
      },{
         day: 0,
         time: 5,
         event_name: "wish"
      },{
         day: 1,
         time: 0,
         event_name: "research"
      },{
         day: 1,
         time: 1,
         event_name: "troops"
      },{
         day: 1,
         time: 2,
         event_name: "wish"
      },{
         day: 1,
         time: 3,
         event_name: "clean"
      },{
         day: 1,
         time: 4,
         event_name: "power"
      },{
         day: 1,
         time: 5,
         event_name: "build"
      },{
         day: 2,
         time: 0,
         event_name: "troops"
      },{
         day: 2,
         time: 1,
         event_name: "wish"
      },{
         day: 2,
         time: 2,
         event_name: "clean"
      },{
         day: 2,
         time: 3,
         event_name: "power"
      },{
         day: 2,
         time: 4,
         event_name: "research"
      },{
         day: 2,
         time: 5,
         event_name: "rune"
      },{
         day: 3,
         time: 0,
         event_name: "research"
      },{
         day: 3,
         time: 1,
         event_name: "rune"
      },{
         day: 3,
         time: 2,
         event_name: "troops"
      },{
         day: 3,
         time: 3,
         event_name: "wish"
      },{
         day: 3,
         time: 4,
         event_name: "wolf"
      },{
         day: 3,
         time: 5,
         event_name: "wolf"
      },{
         day: 4,
         time: 0,
         event_name: "rune"
      },{
         day: 4,
         time: 1,
         event_name: "wish"
      },{
         day: 4,
         time: 2,
         event_name: "power"
      },{
         day: 4,
         time: 3,
         event_name: "research"
      },{
         day: 4,
         time: 4,
         event_name: "build"
      },{
         day: 4,
         time: 5,
         event_name: "troops"
      },{
         day: 5,
         time: 0,
         event_name: "wish"
      },{
         day: 5,
         time: 3,
         event_name: "barb"
      },{
         day: 5,
         time: 4,
         event_name: "barb"
      },{
         day: 5,
         time: 5,
         event_name: "barb"
      },{
         day: 6,
         time: 0,
         event_name: "barb"
      },{
         day: 6,
         time: 1,
         event_name: "barb"
      },{
         day: 6,
         time: 2,
         event_name: "barb"
      },{
         day: 6,
         time: 3,
         event_name: "power"
      },{
         day: 6,
         time: 4,
         event_name: "research"
      },{
         day: 6,
         time: 5,
         event_name: "clean"
      },{
         day: 6,
         time: 5,
         event_name: "rune"
      },{
         day: 3,
         time: 0,
         event_name: "tiger"
      },{
         day: 3,
         time: 1,
         event_name: "tiger"
      },{
         day: 3,
         time: 2,
         event_name: "tiger"
      },{
         day: 3,
         time: 3,
         event_name: "tiger"
      },{
         day: 3,
         time: 4,
         event_name: "tiger"
      },{
         day: 3,
         time: 5,
         event_name: "tiger"
      }
   ]

   DISPLAY_EVENTS = {
      tiger: "Smiledon Attack",
      wolf:  "Wolves",
      wish:  "Wish Tree",
      troops: "Fast Training",
      research: "Research",
      build: "Building",
      rune:  "Whispering of Runes",
      clean: "Clean Up",
      power: "Power Up",
      barb: "Barbarian War"
   }

   EVENT_DETAILS = {
      tiger:  {
         name: "> Smiledon Attack",
         tips: "
               This is a really fun event that requires your focus and time.

               \r\nFor your personal defense have positive morale partners set, preferably 5 star partner, defensive runes, flamen, and defensive boost.

               \r\nAlso **VERY IMPORTANT** make sure you don't have lower tier troops at home, it is preffered to have only t4-t5 at home. Lower level tier troops will go to hospital and make you burn early.

               \r\nReinforce the lowest power players in your clan for the biggest points per defense at start. And after wave 18-20 start focusing on getting as many people to wave 25 as possible.
               ",

         thumbnail: "https://i.imgur.com/6DFT2mM.png",
         image: ""
      },
      wolf:  {
         name: "> Wolves",
         tips: "
               This event is a great source of **Clan Coins**, and it's broken down in 3 separate events **Plunder**, **Kill Plunderers**, **Horder Protector**.

               \r\nFor **Plunder** make sure you're not using farm talents or farm boost for maximum points per stamina used. I also suggest deciding with the active clans for designated wolfs for each clan/horde to avoid collision.

               \r\nFor **Kill Plunderers** the best way to do it is trade with other horde players 100.000 T1 for recovery pack and maximum rewards. Alternatively you can have an alt in a different horde and kill your own troops.

               \r\nFor **Horde Protector** the most common method is killing the wolves then farming them with farming talents and runes, with small amount of troops, the main idea is it takes 2-3 seconds for an attack to register so send enough troops to farm for 2-3 seconds then come back.
               ",

         thumbnail: "https://i.imgur.com/x2Z1aTd.png",
         image: ""
      },
      wish:  {
         name: "> Wish Tree",
         tips: "
               For this event my only observations is you must not use the free wish tree chances during **Wish Tree** events which do not overlap with **Frost vs Fire** event.

               \r\nAlthough I suggest getting only the first two event rewards with the free wish tree chances you get daily and gems, because they won't cost that much. This usually gets me in top 20 for the event so you might get rank rewards aswell.

               \r\nIf you ever go for rank 1 keep in mind people wait untill last minute to overtake rank.

               \r\nDuring **Frost vs Fire** event preparation there's a quest for 100 wishes being made, and you will have two **Wish Tree** events during that time where you can spend all your free wish tree chances you get from relics. This is also a good time to go for rank as well as it is a lot cheaper to get rank.
               ",

         thumbnail: "https://i.imgur.com/wuYniNO.png",
         image: ""
      },
      troops: {
         name: "> Fast Training",
         tips: "
                This is a very good event to play because you can get rewards twice once for **FAST TRAINING** and once for **POWER UP** and this is how:
                \r\nUsing the [Troop Calculator](https://bautils.herokuapp.com/) you can make sure you get all the three rewards without over using speedups.

                \r\nIt's important to save speedups for other events like **BRUTAL SEASON** or **SOLDIER ASSEMBLY**.

                \r\nTo make sure you take full advantage of this event you start training ahead of time (usually during **POWER UP** event) in advance and get all rewards without using any speedups, ofcourse for small accounts this doesn't work the same but you can figure it out.
                ",

         thumbnail: "https://i.imgur.com/jB06kDQ.png",
         image: ""
      },
      research: {
         name: "> Research",
         tips: "
               There's a lot of dicussion around this event especially since game has added advanced research.

               \r\nNever forget to set your talents to research, and rune set to I personally use **Fine Pottery**, but there are other way to boost the research speed like dragonkin skills, **Laurel** the blue flamen, research boost scrolls, **Sacred Flame** and level of your **Temple of Wisdom**.

               \r\nOne of the first suggestions I have is if you're at the beginning of your journey, and have your paid dragonkin he will help you up with completing research faster. Following this idea when you reach advanced may of the lower level research will be cheap in speedups and can be completed instantly.

               \r\nIt really depends on the play style some people queue researches that don't take long others rush for battle research t4/t5.
              ",

         thumbnail: "https://i.imgur.com/o5A3bwL.png",
         image: ""
      },
      build: {
         name: "> Building",
         tips: "
               For this event make sure you have your talents set to building, runes set to the most construction speed, I personally use **White Oak**.

               \r\nA few things to add is the $0.99 starter pack is worth buying gives you an extra free 10 minutes to auto complete buildings (very helpful at start).

               \r\nYou can boost you construction speed with dragonkin skills, construction scrolls and **Sacred Flame**.

               \r\nMake sure your clan mates tap that help button it's a huge help in lowering the time on construction.
              ",

         thumbnail: "https://i.imgur.com/QubyUdH.png",
         image: ""
      },
      rune: {
         name: "> Whispering of Runes",
         tips: "
               For this event it is very important to not waste any expensive fusions. Because during **SVS Battle Preparation** there is a quest that requires you to spend mana by fusing runes.

               \r\nNever go for rank unless you are a spender and rather try and get as close to second/third rewards just by fusing low cost ones.

               \r\nVery important to keep in mind you can summon runes once a day for free (Free re-roll included).

               \r\nNow another important part is how do you get these rune chests for free. This part is simple Events like **Era** , **Altar**, **SVS Battle Prep**, **SVS** will give you rune chests.

               \r\nAnother good way to get them is form **Wild Hunt** or hunting monsters, even during **Wolves** event you get runes every time you kill a wolf.
              ",

         thumbnail: "https://i.imgur.com/n9zPcsR.png",
         image: ""
      },
      clean: {
         name: "> Clean Up",
         tips: "
              One of the most rewarding events, and all you have to do is to farm.

               \r\nThere are a few tips and tricks here. For one make sure you farm the resources you have the best gather bonus in, this includes runes and talents to be set to farming.

               \r\nTry and farm level 6 and 5 resources preferably on your own color. Make sure you have territory gathering boost set in runes for extra points.

               \r\nFor ranking you will need to prepare for this event and make sure you get all your marches + extra march on high level resources to end soon after **Clean UP** starts, this will give you a nice boost.

               \r\nGet your clan mates to help by donating almost completed resources or high level ones to you.
              ",

         thumbnail: "https://i.imgur.com/Q7yXYia.png",
         image: ""
      },
      power: {
         name: "> Power UP",
         tips: "
               **Power UP** is one of the most easiest events to get the 3 rewards and this is how:

               \r\nYou can for example complete training of troops during **Fast Training** and then just take the troops out during this event.

               \r\nYou can level your dragonkin, level up your account by hording experience boosts or even and this is for SVS fighters, use **Revive Gate** to ressurect your dead troops.
              ",

         thumbnail: "https://i.imgur.com/4UrtqaJ.png",
         image: ""
      },
      barb: {
         name: "> Barbarian war",
         tips: "
               This event is a risky one if you're not the power house of your server or don't have enough to defend yourself from rallies and full dragonkin skills attacks.

               \r\nIf you just want to survive use 4x8h bubble if you are not online at the start of event. Alternatively you can hide under another player's bubble if he has space and he has shared his timer in a chat group. Never use bubbles that are not shared they might pop at any time.

               \r\nIf you are going for rewards/rank there are multiple things you can do:

                  \r\n1. Make sure you're on full battle talents/runes/flamen/boosts and you have your best team set on defensive. ( use of antiscout is highly recomanded)
                  \r\n2. Use revive to ressurect dead clan mates troops and kill them off for free points ( multiple ressurects used more points)
                  \r\n3. If you find a big target organize a rally with your clan members ( use of dragonkin skills and advanced research **Set Off** is highly recomanded)
              ",

         thumbnail: "https://i.imgur.com/NLPuTxx.png",
         image: ""
      }
   }

   LONG_EVENTS = {
      tiger: {
         new: {
            start: { day: 3, time: 0 },
            end: { day: 3, time: 5 }
         },
         old: {
            start: { day: 3, time: 0 },
            end: { day: 3, time: 5 }
         }
      },
      wolf: {
         new: {
            start: { day: 3, time: 0 },
            end: { day: 3, time: 1 }
         },
         old: {
            start: { day: 3, time: 4 },
            end: { day: 3, time: 5 }
         }

      },
      clean: {
         new: {
            start: { day: 6, time: 5 },
            end: { day: 0, time:0 }
         },
         old: {
            start: { day: 6, time: 5 },
            end: { day: 0, time:0 }
         }
      },
      barb: {
         new: {
            start: { day: 5, time: 0 },
            end: { day: 5, time: 5 }
         },
         old: {
            start: { day: 5, time: 0 },
            end: { day: 5, time: 5 }
         }
      }
   }

   def initialize(type)
      @event_list = []
      w_day = Time.now.utc.wday - 1
      @day = w_day < 0 ? 6 : w_day
      @time = Time.now.utc.hour/4
      @week_start = Time.now.utc.beginning_of_week
      @type = type == "new" ? :new : :old

      (type == "new" ? NEW_EVENT_LIST : OLD_EVENT_LIST).each do |event|
         @event_list << ::Timeline.new(event)
      end
   end

   def get_event_detail(event_name)
      details = {}

      current_events = get_current_event
      next_event = get_next_event(event_name)

      case event_name
      when 'troops'   then details = EVENT_DETAILS[:troops]
      when 'wish'     then details = EVENT_DETAILS[:wish]
      when 'rune'     then details = EVENT_DETAILS[:rune]
      when 'power'    then details = EVENT_DETAILS[:power]
      when 'clean'    then details = EVENT_DETAILS[:clean]
      when 'research' then details = EVENT_DETAILS[:research]
      when 'build'    then details = EVENT_DETAILS[:build]
      when 'wolf'     then details = EVENT_DETAILS[:wolf]
      when 'tiger'    then details = EVENT_DETAILS[:tiger]
      when 'barb'     then details = EVENT_DETAILS[:barb]
      else {}
      end

      details
   end

   def get_current_event
      current_events = @event_list.select do |event|
         event.day == @day && event.time == @time
      end
   end

   def get_next_event(event_name)
      @week_start = Time.now.utc.beginning_of_week

      upcoming_events = @event_list.select do |event|
         event.event_name == event_name && (@week_start + event.day.days + (event.time*4).hours) > Time.now.utc
      end

      if upcoming_events.size > 0
         event = upcoming_events.first
      else
         @week_start += 7.days
         event = @event_list.select do |event|
            event.event_name == event_name && (@week_start + event.day.days + (event.time*4).hours) > Time.now.utc
         end.first
      end
   end

   def get_time_to_start(event)
      event_start_time = @week_start + event.day.days + (event.time*4).hours
      duration = event_start_time - Time.now.utc
   end

   def get_remaining_time(event)
      @week_start = Time.now.utc.beginning_of_week

      event_name = event.event_name.to_sym

      is_long_ev = LONG_EVENTS[event_name].present? && (
            LONG_EVENTS[event_name][@type][:start][:day] == event.day ||
            LONG_EVENTS[event_name][@type][:end][:day] == event.day
         )

      if is_long_ev
         event_end_time = @week_start + LONG_EVENTS[event_name][@type][:end][:day].days + ((LONG_EVENTS[event_name][@type][:end][:time]+1)*4).hours
      else
         event_end_time = @week_start + event.day.days + ((event.time+1)*4).hours
      end

      return event_end_time - Time.now.utc
   end

   def current_event
      current_events = get_current_event
      details = []

      current_events.each do |event|
         detail = get_event_detail(event.event_name)
         detail[:ends_in] = "Event ends in: **#{get_formatted_date(get_remaining_time(event))}**"

         details << detail
      end

      return details
   end

   def next_event(event_name)
      event = get_next_event(event_name)
      details = get_event_detail(event.event_name)
      details[:starts_in] = "Event starts in: **#{get_formatted_date(get_time_to_start(event))}**"

      details
   end

  def get_formatted_date(time)
    final_string  = ""
    days    = (time/86400).to_i
    final_string += days.to_s + 'd ' if days > 0

    final_string += "%02d:%02d:%02d" % [time/3600%24, time/60%60, time%60]

    final_string
  end
end
