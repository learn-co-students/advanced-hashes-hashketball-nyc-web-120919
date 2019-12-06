require 'pry'
require 'pp'

def game_hash 
 {:home => {:team_name => "Brooklyn Nets", :colors => ["Black", "White"], :players => [
   {:player_name => "Alan Anderson", :number => 0, :shoe => 16, :points => 22, :rebounds => 12, :assists => 12, :steals => 3, :blocks => 1, :slam_dunks => 1}, 
   {:player_name => "Reggie Evans", :number => 30, :shoe => 14, :points => 12, :rebounds => 12, :assists => 12, :steals => 12, :blocks => 12, :slam_dunks => 7}, 
   {:player_name => "Brook Lopez ", :number => 11, :shoe => 17, :points => 17, :rebounds => 19, :assists => 10, :steals => 3, :blocks => 1, :slam_dunks => 15},
   {:player_name => "Mason Plumlee", :number => 1, :shoe => 19, :points => 26, :rebounds => 11, :assists => 6, :steals => 3, :blocks => 8, :slam_dunks => 5},
   {:player_name => "Jason Terry", :number => 31, :shoe => 15, :points => 19, :rebounds => 2, :assists => 2, :steals => 4, :blocks => 11, :slam_dunks => 1}
   ]},
 
  :away => {:team_name => "Charlotte Hornets", :colors => ["Turquoise", "Purple"], :players => [
    {:player_name => "Jeff Adrien", :number => 4, :shoe => 18, :points => 10, :rebounds => 1, :assists => 1, :steals => 2, :blocks => 7, :slam_dunks => 2},
    {:player_name => "Bismack Biyombo", :number => 0, :shoe => 16, :points => 12, :rebounds => 4, :assists => 7, :steals => 22, :blocks => 15, :slam_dunks =>10},
    {:player_name => "DeSagna Diop", :number => 2, :shoe => 14, :points => 24, :rebounds => 12, :assists => 12, :steals => 4, :blocks => 5, :slam_dunks => 5},
    {:player_name => "Ben Gordon", :number => 8, :shoe => 15, :points => 33, :rebounds => 3, :assists => 2, :steals => 1, :blocks => 1, :slam_dunks => 0},
    {:player_name => "Kemba Walker", :number => 33, :shoe => 15, :points => 6, :rebounds => 12, :assists => 12, :steals => 7, :blocks => 5, :slam_dunks => 12}
    ]}
 }
end 


def num_points_scored(player)
  game_hash.each do |home_away, team_info|
    team_info.each do |players, stats|
      #binding.pry 
      if players == :players 
        stats.each do |athlete|
          #binding.pry 
          if athlete[:player_name] == player 
            return athlete[:points]
          end
        end
      end
    end
  end 
end 

def shoe_size(player)
  game_hash.each do |home_away, team_info|
    team_info.each do |players, stats|
      #binding.pry 
      if players == :players 
        stats.each do |athlete|
          #binding.pry 
          if athlete[:player_name] == player 
            return athlete[:shoe]
          end
        end
      end
    end
  end 
end

def team_colors(passed_team)
  game_hash.each do |home_away, team_info|
    if team_info[:team_name] == passed_team
    return team_info[:colors]
    #binding.pry
  end 
  end 
end   

def team_names
  my_array = []
  game_hash.each do |home_away, team_info|
    if !my_array.include?(team_info[:team_name]) 
      my_array << team_info[:team_name]
    #binding.pry 
  end 
  end 
  my_array 
end   

def player_numbers(team)
  my_array = []
  game_hash.each do |home_away, team_info|
    if team_info[:team_name] == team
      team_info.each do |athletes, stats|
        if athletes == :players 
          stats.each do |numbers|
            my_array << numbers[:number]
        
    #binding.pry
  end 
  end 
  end 
  end 
end 
my_array 
end  

def player_stats(player_name)
  my_hash = {}
  game_hash.each do |home_away, team_info|
    team_info.each do |players, stats|
    if players == :players 
      stats.each do |result|
        if result[:player_name] == player_name
          my_hash = {:number => result[:number], :shoe => result[:shoe], :points => result[:points], :rebounds => result[:rebounds], :assists => result[:assists], :steals => result[:steals], :blocks => result[:blocks], :slam_dunks => result[:slam_dunks]}
    #binding.pry
  end 
  end 
  end 
  end 
  end  
  #binding.pry 
  my_hash 
end  

def big_shoe_rebounds
  my_array = []
  game_hash.each do |home_away, team_info|
    team_info.each do |players, stats|
      if players == :players 
        stats.each do |data|
          if my_array == [] || my_array[-1][:shoe] < data[:shoe]
            my_array << data 
        #binding.pry
      end 
     end 
end         
end
end 
my_array[-1][:rebounds]
end   

def most_points_scored 
  my_array = []
  game_hash.each do |home_away, team_info|
    #binding.pry 
    team_info.each do |players, stats|
      if players == :players
        stats.each do |data|
          if my_array == [] || my_array[-1][:points] < data[:points]
            my_array << data 
          end
        end
      end
    end
  end
  my_array[-1][:player_name]
end  
 
def winning_team
home_points = 0 
away_points = 0 
brooklyn_points = game_hash.each do |home_away, team_info|
  if home_away == :home 
    team_info.each do |players, stats| 
      if players == :players
        stats.each do |athlete|
          home_points += athlete[:points] 
      #binding.pry
end       
end       
end     
end   
end 
charlotte_points = game_hash.each do |home_away, team_info|
  if home_away == :away 
    team_info.each do |players, stats| 
      if players == :players
        stats.each do |athlete|
          away_points += athlete[:points]
end
end
end
end
end
#binding.pry 
if home_points > away_points
  return "Brooklyn Nets"
else 
  return "Charlotte Hornets"
end   

end 

 
def player_with_longest_name
  my_array = []
  game_hash.each do |home_away, team_info|
    #binding.pry 
    team_info.each do |players, stats|
      if players == :players
        stats.each do |data|
          if my_array == [] || my_array[-1][:player_name].length < data[:player_name].length 
            my_array << data 
            #binding.pry 
          end
        end
      end
    end
  end
  #binding.pry 
  my_array[-1][:player_name]
end 

def most_steals 
  my_array = []
  game_hash.each do |home_away, team_info|
    #binding.pry 
    team_info.each do |players, stats|
      if players == :players
        stats.each do |data|
          if my_array == [] || my_array[-1][:steals] < data[:steals]
            my_array << data 
            #binding.pry 
          end
        end
      end
    end
  end
  my_array[-1][:player_name]
  #binding.pry  
end
 
def long_name_steals_a_ton?
  if most_steals == player_with_longest_name
    return true 
  else 
    return false 
  end   
end   
end 
