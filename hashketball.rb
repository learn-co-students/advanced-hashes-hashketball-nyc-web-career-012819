require 'pry'

def game_hash
 {
  :home =>{
    :team_name => "Brooklyn Nets",
    :colors => ["Black", "White"],
    :players =>{
    "Alan Anderson" =>{
      :number => 0,
      :shoe => 16,
      :points => 22,
      :rebounds => 12,
      :assists => 12,
      :steals => 3,
      :blocks => 1,
      :slam_dunks => 1
    }, 
    "Reggie Evans" =>{
      :number => 30,
      :shoe => 14,
      :points => 12,
      :rebounds => 12,
      :assists => 12,
      :steals => 12,
      :blocks => 12,
      :slam_dunks => 7
    }, 
    "Brook Lopez" =>{
      :number => 11,
      :shoe => 17,
      :points => 17,
      :rebounds => 19,
      :assists => 10,
      :steals => 3,
      :blocks => 1,
      :slam_dunks => 15
    },
    "Mason Plumlee" =>{
      :number => 1,
      :shoe => 19,
      :points => 26,
      :rebounds => 12,
      :assists => 6,
      :steals => 3,
      :blocks => 8,
      :slam_dunks => 5
    },
    "Jason Terry" =>{
      :number => 31,
      :shoe => 15,
      :points => 19,
      :rebounds => 2,
      :assists => 2,
      :steals => 4,
      :blocks => 11,
      :slam_dunks => 1,
      }
    }
  },
  :away =>{
    :team_name => "Charlotte Hornets",
    :colors => ["Turquoise", "Purple"],
    :players =>{
      "Jeff Adrien" =>{
      :number => 4,
      :shoe => 18,
      :points => 10,
      :rebounds => 1,
      :assists => 1,
      :steals => 2,
      :blocks => 7,
      :slam_dunks => 2
    },
    "Bismak Biyombo" =>{
      :number => 0,
      :shoe => 16,
      :points => 12,
      :rebounds => 4,
      :assists => 7,
      :steals => 7,
      :blocks => 15,
      :slam_dunks => 10
    },
    "DeSagna Diop" =>{
      :number => 2,
      :shoe => 14,
      :points => 24,
      :rebounds => 12,
      :assists => 12,
      :steals => 4,
      :blocks => 5,
      :slam_dunks => 5
    },
    "Ben Gordon" =>{
      :number => 8,
      :shoe => 15,
      :points => 33,
      :rebounds => 3,
      :assists => 2,
      :steals => 1,
      :blocks => 1,
      :slam_dunks => 0
    },
    "Brendan Haywood" =>{
      :number => 33,
      :shoe => 15,
      :points => 6,
      :rebounds => 12,
      :assists => 12,
      :steals => 22,
      :blocks => 5,
      :slam_dunks => 12
      }
    }
  }
}
end

def num_points_scored(player)
  game_hash[:home][:players].each do |player_name, attribute|
    if player_name == player
      return attribute[:points]
    else
  game_hash[:away][:players].each do |player_name, attribute|
    if player_name == player
      return attribute[:points]
    end
  end
end
end
end

def shoe_size(player)
  game_hash[:home][:players].each do |player_name, attribute|
    if player_name == player
      return attribute[:shoe]
    else
  game_hash[:away][:players].each do |player_name, attribute|
    if player_name == player
      return attribute[:shoe]
    end
  end
end
end
end

def team_colors(team)
  if game_hash[:home][:team_name] == team
    return game_hash[:home][:colors]
  else
    return game_hash[:away][:colors]
  end
end

def team_names
 teams = []
 teams << game_hash[:home][:team_name]
 teams << game_hash[:away][:team_name]
 return teams
end

def player_numbers(team)
  array = []
  if game_hash[:home][:team_name] == team
    game_hash[:home][:players].each do |player, player_stat|
      player_stat.each do |stat, value|
        if stat == :number
          array.push(value)
        end
      end
    end
    return array
  end
  else
    game_hash[:away][:players].each do |player, player_stat|
      player_stat.each do |stat, value|
        if stat == :number
          array.push(value)
      end
    end
  end
  return array
end

def player_stats(player)
  if game_hash[:home][:players].keys.include?(player)
    return game_hash[:home][:players][player]
  else
    return game_hash[:away][:players][player]
  end
end

def big_shoe_rebounds
most = 0
reb = 0
game_hash.each do |location, t_stats|
  t_stats[:players].each do |player, p_stat|
    p_stat.each do |name, value|
    if name == :shoe
      size = value
      if size > most
        most = size
      end
    end
  end
  if p_stat[:shoe] == most
    reb = p_stat[:rebounds]
  end
end
end
reb
end
















