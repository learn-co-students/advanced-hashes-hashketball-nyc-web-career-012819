require "pry"

def game_hash
  basketball_hash = {
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
            blocks: 1,
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

  basketball_hash
end

def num_points_scored(name)
  score = 0
  game_hash.each do |location, team|
    team.each do |attr, data|
      if attr == :players
        data.each do |player, stats|
          if(player == name && stats.key?(:points))
              score += stats[:points]
          end
        end
      end
    end
  end
  score
end

def shoe_size(name)
  size = 0
  game_hash.each do |location, team|
    team.each do |attr, data|
      if attr == :players
        data.each do |player, stats|
          if(player == name && stats.key?(:shoe))
              size += stats[:shoe]
          end
        end
      end
    end
  end
  size
end

def team_colors(team)
  color = []
  game_hash.each do |location, team_data|
    team_data.each do |attr, data|
      if data == team
      color = game_hash[location][:colors]
      end
    end
  end
  color
end

def team_names
  teams = []
  game_hash.each do |location, team_data|
    team_data.each do |attr, data|
      if attr == :team_name
        teams << data
      end
    end
  end
  teams
end

def player_numbers(team)
  jersey_numbers = []
  game_hash.each do |location, team_data|
    team_data.each do |attr, data|
      if data == team
        players = game_hash[location][:players]
        players.each do |player, stat|
          if stat.key?(:number)
            jersey_numbers << stat[:number]
          end
        end
      end
    end
  end
  jersey_numbers
end

def player_stats(player_name)
  stats_hash = {}
  game_hash.each do |location, team_data|
    team_data.each do |attr, data|
      if attr == :players
        players = game_hash[location][attr]
        players.each do |name, stats|
          if name == player_name
            stats_hash = game_hash[location][attr][name]
          end
        end
      end
    end
  end
  stats_hash
end



def big_shoe_rebounds
  shoe_size = []
  rebounds = 0
  game_hash.each do |location, team_data| 
    team_data.each do |attr, data|
      if attr == :players
        data.each do |name, stats|
        shoe_size << stats.fetch(:shoe)
        end
      end
    end
  end
  max_shoe = shoe_size.max
  game_hash.each do |location, team_data|
    team_data.each do |attr, data|
      if attr == :players
        data.each do |name, stats|
          if (game_hash[location][attr][name][:shoe] == max_shoe)
            rebounds = game_hash[location][attr][name][:rebounds]
          end
        end
      end
    end
  end
  rebounds
end
