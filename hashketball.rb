# Write your code here!

def game_hash
  game_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismak Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Brendan Haywood" => {
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

def num_points_scored(playerName)
  game_hash.each do |team, team_info|
    team_info[:players].each do |name, value|
      if name == playerName
        return value[:points]
      end
    end
  end
  
# another way -----

#  game_hash.each do |team, details|
#    if details[:players].keys.include?(playerName)
#      return details[:players][playerName][:points]
#    end
#  end
end

def shoe_size(playerName)
#  game_hash.each do |team, info|
#    if info[:players].keys.include?(playerName)
#      return info[:players][playerName][:shoe]
#    end
#  end

  game_hash.each do |team, info|
    info[:players].each do |name, stats|
      if name == playerName
        return stats[:shoe]
      end
    end
  end
end

def team_colors(teamName)
  game_hash.each do |team, info|
   if info[:team_name] == teamName
     return info[:colors]
   end
 end
end

def team_names
  teamNames = Array.new
  game_hash.each do |team, info|
    teamNames << info[:team_name]
  end
  return teamNames
end

def player_numbers(teamName)
  numbers = Array.new
  game_hash.each do |team, info|
    if info[:team_name] == teamName
      info[:players].each do |name, stats|
        numbers << stats[:number]
      end
    end
  end
  return numbers
end

def player_stats(playerName)
  game_hash.each do |team, info|
    info[:players].each do |name, stats|
      if name == playerName
        return stats
      end
    end
  end
end

def big_shoe_rebounds
  biggestSize = 0
  bigFootRebound = 0
  game_hash.each do |team, info|
    info[:players].each do |name, stats|
      if stats[:shoe] > biggestSize
        biggestSize = stats[:shoe]
        bigFootRebound = stats[:rebounds]
      end
    end
  end
  return bigFootRebound
end

# Bonus Qs -----

def most_points_scored
  # Which player has the most points?
  
  top_score = 0
  ace_player = ""
  game_hash.each do |team, info|
    info[:players].each do |name, stats|
      if stats[:points] > top_score
        top_score = stats[:points]
        ace_player = name
      end
    end
  end
  return ace_player
end

def winning_team
  # Which team has the most points?
  
  homeTeam = 0
  awayTeam = 0
  
  game_hash.each do |team, info|
    if team == :home
      info[:players].each do |name, points|
        homeTeam += points[:points]
      end
    end
    
    if team == :away
      info[:players].each do |name, points|
        awayTeam += points[:points]
      end
    end
    
    if homeTeam > awayTeam
      return game_hash[:home][:team_name]
    else
      return game_hash[:away][:team_name]
    end
  end
end

def player_with_longest_name
  # Which players has the longest name?
  
  longName = ""
  
  game_hash.each do |team, info|
    info[:players].each do |name, stats|
      if name.length > longName.length
        longName = name
      end
    end
  end
  return longName
end

# Super Bonus Q -----

def long_name_steals_a_ton?
  # Write a method that returns true if the player with the longest name had the most steals.
  
  steal_num = 0
  steal_player = ''
  
  game_hash.each do |team, info|
    info[:players].each do |name, stats|
      if steal_num < stats[:steals]
        steal_num = stats[:steals]
        steal_player = name
      end
    end
  end
  if steal_player == player_with_longest_name
    return true
  else
    return false
  end
end