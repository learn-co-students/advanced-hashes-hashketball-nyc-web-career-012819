# Write your code here!
def game_hash
game_hash = {
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
end

def num_points_scored(player)
  game_hash.collect { |key, value| value[:players].each{|player_name, player_data| return player_data[:points] if player_name == player}}
end

def shoe_size(player)
  game_hash.collect { |key, value| value[:players].each{|player_name, player_data| return player_data[:shoe] if player_name == player}}
end

def team_colors(team_name)
  color = []
  game_hash.collect { |key, value| value[:colors].each{|c| color << c} if value[:team_name] == team_name}
  color
end

def team_names
  game_hash.collect {|key, value| value[:team_name]}
end

def player_numbers(team_name)
  j_number = []
  game_hash.collect {|key, value| value[:players].each{|player_name, player_data| j_number << player_data[:number]} if value[:team_name] == team_name}
  j_number
end

def player_stats(player)
  game_hash.collect {|key, value| value[:players].collect{|player_name, player_data| return player_data if player_name == player}}
end

def big_shoe_rebounds
  biggest_shoe_size = 0
  game_hash.each {|key, value| value[:players].each{|player_name, player_data| biggest_shoe_size = player_data[:shoe] if biggest_shoe_size < player_data[:shoe]}}
  game_hash.each {|key, value| value[:players].each{|player_name, player_data| return player_data[:rebounds] if player_data[:shoe] == biggest_shoe_size}}
end

def most_points_scored
  highest_points = 0
  game_hash.each {|key, value| value[:players].each{|player_name, player_data| highest_points = player_data[:points] if highest_points < player_data[:points]}}
  game_hash.each {|key, value| value[:players].each{|player_name, player_data| return player_name if player_data[:points] == highest_points}}
end

def winning_team
  home_t_points = 0
  away_t_points = 0
  game_hash[:home][:players].each do |player_name, player_data|
    home_t_points = home_t_points + player_data[:points]
  end
  game_hash[:away][:players].each do |player_name, player_data|
    away_t_points = away_t_points + player_data[:points]
  end
  if home_t_points > away_t_points
    game_hash[:home][:team_name]
  else
    game_hash[:away][:team_name]
  end
end

def player_with_longest_name
  player_w_l_n = " "
  game_hash.each {|key, value| value[:players].each{|player_name, player_data| player_w_l_n = player_name if player_w_l_n.length < player_name.length}}
  player_w_l_n
end

def long_name_steals_a_ton?
  highest_steals = 0
  player_w_highest_steals = ""
  game_hash.each {|key, value| value[:players].each{|player_name, player_data| highest_steals = player_data[:steals] if highest_steals < player_data[:steals]}}
  game_hash.each { |key, value| value[:players].each{|player_name, player_data| player_w_highest_steals = player_name if player_data[:steals] == highest_steals}}
  player_with_longest_name == player_w_highest_steals ? true : false
end
