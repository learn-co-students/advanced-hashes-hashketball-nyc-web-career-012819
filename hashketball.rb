# Write your code here!
require "pry"

def game_hash
game_hash = {
  home: {team_name: "Brooklyn Nets",
        colors: ["Black", "White"],
        players: {
          Alan_Anderson: {
            number: 0,
            shoe: 16,
            points: 22,
            rebounds: 12,
            assists: 12,
            steals: 3,
            blocks: 1,
            slam_dunks: 1
          },
          Reggie_Evans: {
            number: 30,
            shoe: 14,
            points: 12,
            rebounds: 12,
            assists: 12,
            steals: 12,
            blocks: 12,
            slam_dunks: 7
          },
          Brook_Lopez: {
            number: 11,
            shoe: 17,
            points: 17,
            rebounds: 19,
            assists: 10,
            steals: 3,
            blocks: 1,
            slam_dunks: 15
          },
          Mason_Plumlee: {
            number: 1,
            shoe: 19,
            points: 26,
            rebounds: 12,
            assists: 6,
            steals: 3,
            blocks: 8,
            slam_dunks: 5
          },
          Jason_Terry: {
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
    away: {team_name: "Charlotte Hornets",
          colors: ["Turquoise", "Purple"],
          players: {
            Jeff_Adrien: {
              number: 4,
              shoe: 18,
              points: 10,
              rebounds: 1,
              assists: 1,
              steals: 2,
              blocks: 7,
              slam_dunks: 2
            },
            Bismak_Biyombo: {
              number: 0,
              shoe: 16,
              points: 12,
              rebounds: 4,
              assists: 7,
              steals: 7,
              blocks: 15,
              slam_dunks: 10
            },
            DeSagna_Diop: {
              number: 2,
              shoe: 14,
              points: 24,
              rebounds: 12,
              assists: 12,
              steals: 4,
              blocks: 5,
              slam_dunks: 5
            },
            Ben_Gordon: {
              number: 8,
              shoe: 15,
              points: 33,
              rebounds: 3,
              assists: 2,
              steals: 1,
              blocks: 1,
              slam_dunks: 0
            },
            Brendan_Haywood: {
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

def good_practices
  game_hash.each do |location, team_data|
    binding.pry
    team_data.each do |attribute, data|
      binding.pry
      data.each do |data_item|
        binding.pry
      end
    end
  end
end

# good_practices

def num_points_scored (player_name)
  points_scored =[]
  game_hash.each do |location, team_data|
    team_data.each do |element, description|
      if element == :players
        description.each do |name, stats|
          if name.to_s.split("_").join(" ") == player_name
            points_scored << stats[:points]
          end
        end
      end
    end
end
points_scored[0]
end

def shoe_size (player_name)
  shoe_size =[]
  game_hash.each do |location, team_data|
    team_data.each do |element, description|
      if element == :players
        description.each do |name, stats|
          if name.to_s.split("_").join(" ") == player_name
            shoe_size << stats[:shoe]
          end
        end
      end
    end
end
shoe_size[0]
end

def shoe_size (team_name)
  colors =[]
  game_hash.each do |location, team_data|
    team_data.each do |element, description|
      binding.pry
      if description == team_name
        binding.pry
        team_data[:colors].each do |x| colors << x end
      end
    end
  end
  colors[0]
end
