require "pry"

def game_hash 
  result = {:home => {
    :team_name => "Brooklyn Nets",
    :colors => ["Black", "White"],
    :players => [
      {:player_name => "Alan Anderson", :number => 0, :shoe => 16, :points => 22, :rebounds => 12, :assists => 12, :steals => 3, :blocks => 1, :slam_dunks => 1}, 
      
      {:player_name => "Reggie Evans", :number => 30, :shoe => 14, :points => 12, :rebounds => 12, :assists => 12, :steals => 12, :blocks => 12, :slam_dunks => 7},
      
      {:player_name => "Brook Lopez", :number => 11, :shoe => 17, :points => 17, :rebounds => 19, :assists => 10, :steals => 3, :blocks => 1, :slam_dunks => 15},
      
      {:player_name => "Mason Plumlee", :number => 1, :shoe => 19, :points => 26, :rebounds => 11, :assists => 6, :steals => 3, :blocks => 8, :slam_dunks => 5},
      
      {:player_name => "Jason Terry", :number => 31, :shoe => 15, :points => 19, :rebounds => 2, :assists => 2, :steals => 4, :blocks => 11, :slam_dunks => 1}
      ] 
  }, 
  
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [
        {:player_name => "Jeff Adrien", :number => 4, :shoe => 18, :points => 10, :rebounds => 1, :assists => 1, :steals => 2, :blocks => 7, :slam_dunks => 2}, 
        
        {:player_name => "Bismack Biyombo", :number => 0, :shoe => 16, :points => 12, :rebounds => 4, :assists => 7, :steals => 22, :blocks => 15, :slam_dunks => 10}, 
        
        {:player_name => "DeSagna Diop", :number => 2, :shoe => 14, :points => 24, :rebounds => 12, :assists => 12, :steals => 4, :blocks => 5, :slam_dunks => 5},
        
        {:player_name => "Ben Gordon", :number => 8, :shoe => 15, :points => 33, :rebounds => 3, :assists => 2, :steals => 1, :blocks => 1, :slam_dunks => 0},
        
        {:player_name => "Kemba Walker", :number => 33, :shoe => 15, :points => 6, :rebounds => 12, :assists => 12, :steals => 7, :blocks => 5, :slam_dunks => 12}
      ]
  }}
  
  result
end

def num_points_scored (player_name)
  player = get_player_by_name(player_name)
  player[:points]
end

def shoe_size (player_name)
  player = get_player_by_name(player_name)
  player[:shoe]
end

def team_colors (team_name) 
  team = get_team_by_name (team_name)
  result = team[:colors]
end

def get_team_by_name(team_name) 
  game_data = game_hash
  team_res = game_data.detect {|key, value| value[:team_name] == team_name}
  team_res[1]
end

def team_names 
  game_data = game_hash
  game_data.collect {|key, value| value[:team_name] }
end

def player_numbers(team_name)
  team = get_team_by_name(team_name)
  team[:players].collect {|player| player[:number]}
end

def get_player_by_name(name) 
  game_data = game_hash
  
  team_res = game_data.detect {|key, value| value[:players].detect {|player| player[:player_name] == name}}
  player_res = team_res[1][:players].detect {|player| player[:player_name] == name}
  
  player_res
end

def player_stats(name)
  player = get_player_by_name(name)
  stats = player.dup
  stats.delete(:player_name)
  return stats
end

def big_shoe_rebounds
  
  player_res = find_player_with_highest_number(:shoe)
 
  player_res[:rebounds]

end

def most_points_scored 
  player_res = find_player_with_highest_number(:points)
 
  player_res[:player_name]
end

def winning_team
  game_data = game_hash
  
  total_points_home = game_data[:home][:players].reduce (0) {|memo, player| memo + player[:points]}
  total_points_away = game_data[:away][:players].reduce (0) {|memo, player| memo + player[:points]}
 
  total_points_away > total_points_home ? game_data[:away][:team_name] : game_data[:home][:team_name]
  
end
  
def player_with_longest_name
  game_data = game_hash
  
  player_res = game_data[:home][:players].reduce {|memo, player| memo[:player_name].length > player[:player_name].length ? memo : player}
  player_res = game_data[:away][:players].reduce (player_res) {|memo, player| memo[:player_name].length > player[:player_name].length ? memo : player}
 
  player_res[:player_name]
end



def long_name_steals_a_ton? 
  steal_player = find_player_with_highest_number(:steals)
  long_name_player_name = player_with_longest_name
  
  return steal_player[:player_name] == long_name_player_name
end

def find_player_with_highest_number(player_hash_key)
  game_data = game_hash
  
  player_res = game_data[:home][:players].reduce {|memo, player| memo[player_hash_key] > player[player_hash_key] ? memo : player}
  player_res = game_data[:away][:players].reduce (player_res) {|memo, player| memo[player_hash_key] > player[player_hash_key] ? memo : player}
  
  player_res
end



