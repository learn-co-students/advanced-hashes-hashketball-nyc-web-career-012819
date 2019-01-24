require "pry"

def game_hash
  game_hash = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson" => {number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1},
        "Reggie Evans" => {number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7},
        "Brook Lopez" => {number: 11, shoe: 17, points: 17, rebounds: 19, assists: 10, steals: 3, blocks: 1, slam_dunks: 15},
        "Mason Plumlee" => {number: 1, shoe: 19, points: 26, rebounds: 12, assists: 6, steals: 3, blocks: 8, slam_dunks: 5},
        "Jason Terry" => {number: 31, shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks: 1}
      }
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Purple", "Turquoise"],
      players: {
        "Jeff Adrien" => {number: 4, shoe: 18, points: 10, rebounds: 1, assists: 1, steals: 2, blocks: 7, slam_dunks: 2},
        "Bismak Biyombo" => {number: 0, shoe: 16, points: 12, rebounds: 4, assists: 7, steals: 7, blocks: 15, slam_dunks: 10},
        "DeSagna Diop" => {number: 2, shoe: 14, points: 24, rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5},
        "Ben Gordon" => {number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0},
        "Brendan Haywood" => {number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 22, blocks: 5, slam_dunks: 12}
      }}
    }
end

def num_points_scored(name)
  game_hash.each do |team, facts|
    game_hash[team][:players].each do |player, stats|
      if name == player
        return stats[:points]
      end
    end
  end
end

def shoe_size(name)
  game_hash.each do |team, facts|
    game_hash[team][:players].each do |player, stats|
      if name == player
        return stats[:shoe]
      end
    end
  end
end

def team_colors(team)
  game_hash.each do |teams, facts|
    game_hash[teams].each do |name, info|
      if team == info
      return game_hash[teams][:colors]
      end
    end
  end
end

def team_names
  whos_playing = []
  game_hash.each do |teams, facts|
    whos_playing << game_hash[teams][:team_name]
  end
  return whos_playing
end

def player_numbers(name_of_team)
  jerseys = []
  game_hash.each do |team, info|
    if name_of_team == game_hash[team][:team_name]
      game_hash[team][:players].each do |name, stats|
        jerseys << stats[:number]
      end
    end
  end
  return jerseys
end

def player_stats(player_name)
  game_hash.each do |teams, info|
    info.each do |info, stats|
      if info == :players
        stats.each do |name, specs|
          if name == player_name
            return specs
          end
        end
      end
    end
  end
end

def big_shoe_rebounds
  players = []
  shoe_sizes = []

  game_hash.each do |teams, info|
    game_hash[teams][:players].each do |name, specs|
      players << name
      shoe_sizes << specs[:shoe]
    end
  end

  largest = 0
  shoe_sizes.each do |n|
    if n > largest
      largest = n
    end
  end

  big_foot = players[shoe_sizes.index(largest)]
  game_hash.each do |teams, info|
    game_hash[teams][:players].each do |name, specs|
      if big_foot == name
        return specs[:rebounds]
      end
    end
  end
end
