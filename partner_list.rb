require 'active_support/all'
require 'pry'

class PartnerList
  
  def initialize(color,name)
      @color = color
      @name = name
  end
  
  def DISPLAY_NAME(names)
    
    case names
        when 'colonel' then displayname = 'Colonel'
        when 'rockwell' then displayname = 'Rockwell'
        when 'valkyrie' then displayname = 'Valkyrie Hill'
        when 'prophet' then displayname = 'Prophet'
        when 'marionette' then displayname = 'Marionette'
        when 'isyduchess' then displayname = 'Isyduchess'
        when 'prince' then displayname = 'Desert Prince'
        when 'ursa' then displayname = 'Ursa Huntress'
        when 'bape' then displayname = 'Bape'
        when 'judge' then displayname = 'Blind Judge'
        when 'chacha' then displayname = 'Cha Cha'
        when 'woody' then displayname = 'Woody'
        when 'tusk' then displayname = 'Valor the Tusk'
        when 'executor' then displayname = 'Executor'
        when 'mr.dagger' then displayname = 'Mr Dagger'
        when 'nomad' then displayname = 'Nomad King'
        when 'warmaiden' then displayname = 'Bloodthirsty Warmaiden'
        when 'panda' then displayname = 'Panda Po'
        when 'tricky' then displayname = 'Tricky'
        when 'medusa' then displayname = 'Medusa'
        when 'marksman' then displayname = 'Marksman'
        when 'ghost' then displayname = 'Lil Ghost'
        when 'scarecrow' then displayname = 'Scarecrow'
        when 'thana' then displayname = 'Thana the Vampire'
        when 'dragoness' then displayname = 'Weeping Dragoness'
        when 'messenger' then displayname = 'Messenger of Destiny'
        when 'golk' then displayname = 'Titan Golk'
        when 'syren' then displayname = 'Syren the Mermaid'
        when 'sworddevil' then displayname = 'Sworddevil'
        when 'voodoo' then displayname = 'Voodoo Specter'
        when 'babur' then displayname = 'Babur the Tiger King'
        when 'monk' then displayname = 'Monk Chadric'
        when 'zither' then displayname = 'Zither Goddess'
        when 'assassin' then displayname = 'Phantom Assassin'
        when 'yin' then displayname = 'Yin'
        
    end
    
    displayname
  end

def Partner_attribute(colors)
    
    case colors
        when 'blue' then attribute = 'Wise'
        when 'red' then attribute = 'Brave'
        when 'green' then attribute = 'Wild'
    end
    
    attribute
end

def Partner_Title()
    
    partner_title = "**" + Partner_attribute(@color) + " - " + DISPLAY_NAME(@name) + "**"
    
    partner_title
    
end

def Red_Partners()

    case @name
                        when 'colonel' then image_url = "https://i.imgur.com/r3GMWBA.jpg"
                        when 'rockwell' then image_url = "https://i.imgur.com/tj3DeO5.jpg"
                        when 'valkyrie' then image_url = "https://i.imgur.com/Tsaa5Yn.jpg"
                        when 'prophet' then image_url = "https://i.imgur.com/aciOFmY.jpg"
                        when 'marionette' then image_url = "https://i.imgur.com/IW7OroU.jpg"
                        when 'isyduchess' then image_url = "https://i.imgur.com/L11W86v.jpg"
                        when 'prince' then image_url = "https://i.imgur.com/PYfBLym.jpg"
                        when 'ursa' then image_url = "https://i.imgur.com/HN8ngEn.jpg"
                        when 'bape' then image_url = "https://i.imgur.com/hLwwBgl.jpg"
                        when 'judge' then image_url = "https://i.imgur.com/BTaKBUf.jpg"
                        when 'chacha' then image_url = "https://i.imgur.com/y3cRiSE.jpg"
                        when 'woody' then image_url = "https://i.imgur.com/gSwYdo5.jpg"
                        when 'tusk' then image_url = "https://i.imgur.com/e3joXOB.jpg"
                        when 'executor' then image_url = "https://i.imgur.com/HPafUlm.jpg"
                        when 'mr.dagger' then image_url = "https://i.imgur.com/G2QmtZ6.jpg"
                        when 'nomad' then image_url = "https://i.imgur.com/4YqRuiX.jpg"
                        when 'warmaiden' then image_url = "https://i.imgur.com/x5Fjzl1.jpg"
                        when 'panda' then image_url = "https://i.imgur.com/rT5ChY1.jpg"
                        when 'tricky' then image_url = "https://i.imgur.com/1MfkQhX.jpg"
                        when 'medusa' then image_url = "https://i.imgur.com/YeXYSLs.jpg"
                        when 'marksman' then image_url = "https://i.imgur.com/JDBieV5.jpg"
                        when 'ghost' then image_url = "https://i.imgur.com/QftSqWB.jpg"
                        when 'thana' then image_url = "https://i.imgur.com/Kle9kFm.png"
                        when 'dragoness' then image_url = "https://i.imgur.com/MoUgZRU.png"
                        when 'messenger' then image_url ="https://i.imgur.com/IAumbDc.png"
                        when 'golk' then image_url ="https://i.imgur.com/fE6PGRA.png"
                        when 'syren' then image_url = "https://i.imgur.com/TbmZ72Z.png"
                        when 'sworddevil' then image_url = "https://i.imgur.com/KVh49AG.png"
                        when 'voodoo' then image_url = "https://i.imgur.com/jxgb8B1.png"
                        when 'babur' then image_url = "https://i.imgur.com/pRfzUb3.png"
                        when 'monk' then image_url = "https://i.imgur.com/4uLUw2v.png"
                        when 'zither' then image_url = "https://i.imgur.com/PVa242m.png"
                        when 'assassin' then image_url = "https://i.imgur.com/omcV1qN.png"
                        when 'yin' then image_url = "https://i.imgur.com/B4lwwgI.png"
                        
                        image_url
    end
    
end

def Green_Partners()

    case @name
                        when 'colonel' then image_url = "https://i.imgur.com/hsaIS8Q.jpg"
                        when 'rockwell' then image_url = "https://i.imgur.com/NxLupO6.jpg"
                        when 'valkyrie' then image_url = "https://i.imgur.com/9rHcKo8.jpg"
                        when 'prophet' then image_url = "https://i.imgur.com/CkAiaJY.jpg"
                        when 'marionette' then image_url = "https://i.imgur.com/bkTwuiZ.jpg"
                        when 'isyduchess' then image_url = "https://i.imgur.com/PBNxJo2.png"
                        when 'prince' then image_url = "https://i.imgur.com/yVgolSM.jpg"
                        when 'ursa' then image_url = "https://i.imgur.com/nMVEKBl.jpg"
                        when 'bape' then image_url = "https://i.imgur.com/CQw43Kt.jpg"
                        when 'judge' then image_url = "https://i.imgur.com/xRnEN32.jpg"
                        when 'chacha' then image_url = "https://i.imgur.com/weboWci.jpg"
                        when 'woody' then image_url = "https://i.imgur.com/llxzykQ.jpg"
                        when 'tusk' then image_url = "https://i.imgur.com/JOZ74n0.jpg"
                        when 'executor' then image_url = "https://i.imgur.com/Fe48VUS.jpg"
                        when 'mr.dagger' then image_url = "https://i.imgur.com/6xU1lU5.jpg"
                        when 'nomad' then image_url = "https://i.imgur.com/8yC4jaM.jpg"
                        when 'warmaiden' then image_url = "https://i.imgur.com/XPLGmc3.jpg"
                        when 'panda' then image_url = "https://i.imgur.com/WcUrtA1.jpg"
                        when 'tricky' then image_url = "https://i.imgur.com/hHfAHDj.jpg"
                        when 'medusa' then image_url = "https://i.imgur.com/PWophhu.jpg"
                        when 'scarecrow' then image_url = "https://i.imgur.com/T3JbzRQ.jpg"
                        when 'thana' then image_url = "https://i.imgur.com/ukVP7db.png"
                        when 'dragoness' then image_url = "https://i.imgur.com/RX8SHWO.png"
                        when 'messenger' then image_url ="https://i.imgur.com/IcRcNHH.png"
                        when 'golk' then image_url ="https://i.imgur.com/faXVYQo.png"
                        when 'syren' then image_url = "https://i.imgur.com/9h1NTAx.png"
                        when 'sworddevil' then image_url = "https://i.imgur.com/nIpuf4k.png"
                        when 'voodoo' then image_url = "https://i.imgur.com/pHRUWfo.png"
                        when 'babur' then image_url = "https://i.imgur.com/Nf3AoS2.png"
                        when 'monk' then image_url = "https://i.imgur.com/FVM62tT.png"
                        when 'zither' then image_url = "https://i.imgur.com/NGBPX9I.png"
                        when 'assassin' then image_url = "https://i.imgur.com/6azJzou.png"
                        when 'yin' then image_url = "https://i.imgur.com/njw3thA.png"
                        
                        image_url
    end
    
end

def Blue_Partners()

    case @name
                        when 'colonel' then image_url = "https://i.imgur.com/JEjVKgn.jpg"
                        when 'rockwell' then image_url = "https://i.imgur.com/qRQXoi5.jpg"
                        when 'valkyrie' then image_url = "https://i.imgur.com/0bKSlvl.jpg"
                        when 'prophet' then image_url = "https://i.imgur.com/rVCMZgW.jpg"
                        when 'marionette' then image_url = "https://i.imgur.com/iRhfgp1.jpg"
                        when 'isyduchess' then image_url = "https://i.imgur.com/PChsyqQ.png"
                        when 'prince' then image_url = "https://i.imgur.com/aFTdJPK.jpg"
                        when 'ursa' then image_url = "https://i.imgur.com/fqImB5Q.jpg"
                        when 'bape' then image_url = "https://i.imgur.com/6bglh7w.jpg"
                        when 'judge' then image_url = "https://i.imgur.com/l6xdUmo.jpg"
                        when 'chacha' then image_url = "https://i.imgur.com/NTdUtXo.jpg"
                        when 'woody' then image_url = "https://i.imgur.com/XeTUtNb.jpg"
                        when 'tusk' then image_url = "https://i.imgur.com/6NLC6iJ.jpg"
                        when 'executor' then image_url = "https://i.imgur.com/ltLn3HV.jpg"
                        when 'mr.dagger' then image_url = "https://i.imgur.com/SJtgf0h.jpg"
                        when 'nomad' then image_url = "https://i.imgur.com/VKT4kEV.jpg"
                        when 'warmaiden' then image_url = "https://i.imgur.com/F7WfeRy.jpg"
                        when 'panda' then image_url = "https://i.imgur.com/dd7ME9O.jpg"
                        when 'tricky' then image_url = "https://i.imgur.com/zBK0zgQ.jpg"
                        when 'medusa' then image_url = "https://i.imgur.com/TIhRCpx.jpg"
                        when 'thana' then image_url = "https://i.imgur.com/bF2EkGx.png"
                        when 'dragoness' then image_url = "https://i.imgur.com/zkNs1s1.png"
                        when 'messenger' then image_url ="https://i.imgur.com/oTqdmDo.png"
                        when 'golk' then image_url ="https://i.imgur.com/dziSyJ1.png"
                        when 'syren' then image_url = "https://i.imgur.com/q4HkYjD.png"
                        when 'sworddevil' then image_url = "https://i.imgur.com/jR5y8nZ.png"
                        when 'voodoo' then image_url = "https://i.imgur.com/wUFOA79.png"
                        when 'babur' then image_url = "https://i.imgur.com/sF4lD9O.png"
                        when 'monk' then image_url = "https://i.imgur.com/4HAM4an.png"
                        when 'zither' then image_url = "https://i.imgur.com/LmnvEhI.png"
                        when 'assassin' then image_url = "https://i.imgur.com/GMvao5O.png"
                        when 'yin' then image_url = "https://i.imgur.com/SqI5btv.png"
                        
                        image_url
    end
    
end

end
