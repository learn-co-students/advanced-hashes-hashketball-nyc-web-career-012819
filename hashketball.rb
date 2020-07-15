require "pry"
def game_hash
  hash = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson" => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12, 
          assists: 12,
          steals: 3, 
          blocks:1,
          slam_dunks: 1
        },
        "Reggie Evans" => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10, 
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        "Jason Terry" => {
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
        "Jeff Adrien" => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        "Bismak Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        "DeSagna Diop" => {
          number: 2, 
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon" => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        "Brendan Haywood" => {
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
end

def num_points_scored(name)
  player_points = 0
  
  game_hash.each do |teams, team_info|
    team_info_players = team_info[:players]
    
    team_info_players.each do |player_names, player_stats|
      if player_names == name
         player_points += player_stats[:points]
      end
    end 
  end
  player_points
end

def shoe_size(name)
  player_size = 0
  
  game_hash.each do | teams, team_info|
    
    team_info[:players].each do |player_names, player_stats|
      if
        player_names == name
        player_size += player_stats[:shoe]
      end
    end
  end
  player_size
end

def team_colors(team_name)
  t_color = []
  
  game_hash.each do |teams, team_info|
    
    team_info[:colors].each do |colors|
      if team_info[:team_name] == team_name
        t_color << colors
      end
    end
  end
  t_color
end

def team_names
  team_array = []
  team_array << game_hash[:home][:team_name]
  team_array << game_hash[:away][:team_name]
  team_array
end

def player_numbers(name)
  jersey_array = []
  
  game_hash.each do |teams, team_info|
    
    if team_info[:team_name] == name
      
      team_info[:players].each do |player_names, player_stats|
        jersey_array << player_stats[:number]
      end
    end
  end
  jersey_array
end

def player_stats(name)
  stat_hash = {}
  
  game_hash.each do |teams, team_info|
    
    team_info[:players].each do |player_names, player_stats|
      if player_names == name
        stat_hash = player_stats
      end
    end
  end
  stat_hash
end

def big_shoe_rebounds
  rebounds = 0
  size_array = []
  biggest_size = 0
  
  game_hash.each do |teams, team_info|
    
    team_info[:players].each do |player_names, player_stats|
     
      if player_stats[:shoe] > biggest_size
        biggest_size = player_stats[:shoe]
        rebounds = player_stats[:rebounds]
      end
    end
  end
  rebounds
end









