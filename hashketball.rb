# Write your code here!

require "pry"

def game_hash
  hash = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson": {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        "Reggie Evans": {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        "Brook Lopez": {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        "Mason Plumlee": {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        "Jason Terry": {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      }
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien": {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        "Bismak Biyombo": {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        "DeSagna Diop": {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon": {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        "Brendan Haywood": {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      }
    }
  }
  hash
end

def good_practices
  game_hash.each do |location, team_data|
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
    binding.pry
      team_data.each do |attribute, data|
        #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
        binding.pry
 
        #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
        data.each do |data_item|
            binding.pry
      end
    end
  end
end

def team_names  
  game_hash.map do |key, value|
    value[:team_name]
  end
end

def most_points_scored
end

def winning_team
end

def player_with_longest_name
end

def long_name_steals_a_ton?
end

def num_points_scored(player_name)
  get_player(player_name).values[0][:points]
end

def player_numbers(team_name)
  get_team(team_name)[:players].values.map do |element|
    element[:points]
  end
end

def player_stats(player_name)
  get_player(player_name).values[0]
end

def team_colors(team_name)
  get_team(team_name)[:colors]
end

def shoe_size(player_name)
  get_player(player_name).values[0][:shoe]
end

# To-do: Rewrite to have less code?
def big_shoe_rebounds
  largest_shoe = 0
  most_rebounds = 0
  
  game_hash.each do |team, data|
    game_hash[team][:players].each do |player, stats|
      if stats[:shoe] > largest_shoe
        largest_shoe = stats[:shoe]
        most_rebounds = stats[:rebounds]
      end
    end
  end
  
  most_rebounds
end

# Helper functions I wrote -------------------->

# Function to get an array of all players
def get_all_players
  game_hash.values.map do |team|
    team[:players]
  end.map do |roster|
    roster.map do |name, stats|
      {name => stats}
    end
  end.flatten
end

# Function to get a specific player
def get_player(player_name)
  get_all_players.find do |element|
    element.keys[0].to_s == player_name
  end
end

# Function to get a specific team
def get_team(team_name)
  game_hash.values.find do |team|
    team[:team_name] == team_name
  end
end
