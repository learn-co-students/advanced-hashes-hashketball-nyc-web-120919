require "pry"
def game_hash
  game_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [{
        :player_name => "Alan Anderson",
        :number => 0,
        :shoe => 16,
        :points => 22,
        :rebounds => 12, 
        :assists => 12,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 1,
      },{
        :player_name => "Reggie Evans",
        :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12, 
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7,
      },{
        :player_name => "Brook Lopez",
        :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19, 
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15,
      },{
        :player_name => "Mason Plumlee",
        :number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 11, 
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5,
      },{
        :player_name => "Jason Terry",
        :number => 31,
        :shoe => 15,
        :points => 19,
        :rebounds => 2, 
        :assists => 2,
        :steals => 4,
        :blocks => 11,
        :slam_dunks => 1,
      }]
    },
    :away => { 
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [{
        :player_name => "Jeff Adrien",
        :number => 4,
        :shoe => 18,
        :points => 10,
        :rebounds => 1, 
        :assists => 1,
        :steals => 2,
        :blocks => 7,
        :slam_dunks => 2,
      },{
        :player_name => "Bismack Biyombo",
        :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4, 
        :assists => 7,
        :steals => 22,
        :blocks => 15,
        :slam_dunks => 10,
      },{
        :player_name => "DeSagna Diop",
        :number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12, 
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5,
      },{
        :player_name => "Ben Gordon",
        :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3, 
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0,
      },{
        :player_name => "Kemba Walker",
        :number => 33,
        :shoe => 15,
        :points => 6,
        :rebounds => 12, 
        :assists => 12,
        :steals => 7,
        :blocks => 5,
        :slam_dunks => 12}
        ]
    }
  }
  return game_hash
end

def num_points_scored(player_name) #create a function that accepts an array of hashes;
  game_hash.each do|teams, data| #must iterate through each team acquiring data from each subset
  #now we must iterate once more deeper to acquire player information that's being searched for& points scored 
  data[:players].each do|player|
  if player[:player_name] == player_name 
    return player[:points]
  end
end
end
nil 
end

def shoe_size(player_name)
  game_hash.each do|teams, data|
  data[:players].each do|player|
  if player[:player_name] == player_name
    return player[:shoe]
  end
end
end
nil
end 

def team_colors(team_name)
  game_hash.each do|teams, data|
  if data[:team_name] == team_name
    return data[:colors]
  end 
end 
nil 
end 

def team_names
  return game_hash.reduce([]) do |names, (teams, data)|
    names << data[:team_name]
  end 
end 

def player_numbers(team_name)
  game_hash.each do |teams, data|
    if data[:team_name] == team_name 
      return data[:players].reduce([]) do |arr, player|
        arr << player[:number]
      end
    end
  end 
  nil 
end 

def player_stats(player_name)
  game_hash.each do |teams, data|
    data.each do |team, value|
      if team == :players 
        value.each do |player|
          if player_name == player[:player_name]
            player.delete(:player_name)
            return player 
          end 
        end 
      end 
    end 
  end 
  nil 
end 

def biggest_shoe
  biggest_shoe = {:shoe => 0}
  game_hash.each do |teams, data|
    data.each do |team_data, value|
      if team_data == :players
        value.each do |player|
          if player[:shoe] > biggest_shoe[:shoe]
            biggest_shoe = player
          end
        end
      end
    end
  end
  return biggest_shoe
end

def big_shoe_rebounds
  return biggest_shoe[:rebounds]
end

def most_points_scored
  most_points = {:points => 0}
  game_hash.each do |teams, data|
    data.each do |team_data, value|
      if team_data == :players
        value.each do |player|
          if player[:points] > most_points[:points]
            most_points = player
          end
        end
      end
    end
  end
  return most_points[:player_name]
end

def team_score(team_name)
  team_points = {:team_name => "#{team_name}", :points => 0} 
  game_hash.each do |teams, data|
    if data[:team_name] == team_name 
      data.each do |data, value|
        if data == :players
          value.each do |player|
            team_points[:points] += player[:points]
          end 
        end 
      end 
    end 
  end 
  team_points
end 

def winning_team
  home = team_score("Brooklyn Nets")
  away = team_score("Charlotte Hornets")
  if home[:points] > away[:points]
    return home[:team_name]
  else 
    return away[:team_name]
  end 
end 

def player_with_longest_name
  long_name = {:player_name => ""} # establish var to hold an empty string for current length of the longest name which is 0 
  game_hash.each do |teams, data|
    data.each do |team_data, value|
      if team_data == :players 
        value.each do |player|
          if player[:player_name].length > long_name[:player_name].length 
            long_name = player 
          end 
        end 
      end 
    end 
  end 
  return long_name[:player_name]
end 

def long_name_steals_a_ton?
  steal_count = {:steals => 0}
  game_hash.each do |teams, data| #we go through the both teams 
  data.each do |team_data, value| #now we go through each player and their steal count 
  if team_data == :players 
    value.each do |player|
      if player[:steals] > steal_count[:steals]
        steal_count = player 
      end 
    end 
  end 
end 
end 
    if steal_count[:player_name] == player_with_longest_name
      return true 
    else 
      false 
    end 
end 


#create a method that returns the most points awarded to a player 

#go through teams, then the team data 
#then compare if the team data matches each player 
#then create a loop that will compare each value of the player and the player with the most points will be the player with the highest points 


#create a method called winning_team
# it should assign home & away 
#then compare who has the highest points home[:points] > away[:points]

#create a method that will return a player with the longest name 
