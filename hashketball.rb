require 'pry'

def game_hash
  game_hash = {
    :home=>{
      :team_name=>"Brooklyn Nets",
      :colors =>["Black", "White"],
      :players=>{
        "Alan Anderson"=>{
          :number=>0,
          :shoe=>16,
          :points=>22,
          :rebounds=>12,
          :assists=>12,
          :steals=>3,
          :blocks=>1,
          :slam_dunks=>1
        },
        "Reggie Evans"=>{
          :number=>30,
          :shoe=>14,
          :points=>12,
          :rebounds=>12,
          :assists=>12,
          :steals=>12,
          :blocks=>12,
          :slam_dunks=>7
        },
        "Brook Lopez"=>{
          :number=>11,
          :shoe=>17,
          :points=>17,
          :rebounds=>19,
          :assists=>10,
          :steals=>3,
          :blocks=>1,
          :slam_dunks=>15
        },
        "Mason Plumlee"=>{
          :number=>1,
          :shoe=>19,
          :points=>26,
          :rebounds=>12,
          :assists=>6,
          :steals=>3,
          :blocks=>8,
          :slam_dunks=>5
        },
        "Jason Terry"=>{
          :number=>31,
          :shoe=>15,
          :points=>19,
          :rebounds=>2,
          :assists=>2,
          :steals=>4,
          :blocks=>11,
          :slam_dunks=>1
        }

      }

    },



    :away => {
      :team_name=>"Charlotte Hornets",
      :colors =>["Turquoise", "Purple"],
      :players=> {
        "Jeff Adrien"=>{
          :number=>4,
          :shoe=>18,
          :points=>10,
          :rebounds=>1,
          :assists=>1,
          :steals=>2,
          :blocks=>7,
          :slam_dunks=>2
        },
        "Bismak Biyombo"=>{
          :number=>0,
          :shoe=>16,
          :points=>12,
          :rebounds=>4,
          :assists=>7,
          :steals=>7,
          :blocks=>15,
          :slam_dunks=>10
        },
        "DeSagna Diop"=>{
          :number=>2,
          :shoe=>14,
          :points=>24,
          :rebounds=>12,
          :assists=>12,
          :steals=>4,
          :blocks=>5,
          :slam_dunks=>5
        },
        "Ben Gordon"=>{
          :number=>8,
          :shoe=>15,
          :points=>33,
          :rebounds=>3,
          :assists=>2,
          :steals=>1,
          :blocks=>1,
          :slam_dunks=>0
        },
        "Brendan Haywood"=>{
          :number=>33,
          :shoe=>15,
          :points=>6,
          :rebounds=>12,
          :assists=>12,
          :steals=>22,
          :blocks=>5,
          :slam_dunks=>12
        }

      }

    }
  }
return game_hash
end

def home_team_name
  game_hash[:home][:team_name]
end

def num_points_scored(name)
  if game_hash[:home][:players].include?(name)
    game_hash[:home][:players][name][:points]
  else
    game_hash[:away][:players][name][:points]
  end
end

def shoe_size(name)
  if game_hash[:home][:players].include?(name)
    game_hash[:home][:players][name][:shoe]
  else
    game_hash[:away][:players][name][:shoe]
  end
end

def team_colors(team_name)
  if game_hash[:home][:team_name]==team_name
    return game_hash[:home][:colors]
  else
    return game_hash[:away][:colors]
  end
end

def team_names
  names = []
  game_hash.collect do |location,team_data|
    team_data.collect do |attribute,data|
      if attribute==:team_name
        names<< data
      end
    end
  end
  return names
end

def player_stats(player)
  if game_hash[:home][:players].include?(player)
    game_hash[:home][:players][player]
  else
    game_hash[:away][:players][player]
  end
end

def player_numbers(team_name)
  array_of_jersey_nums = []
  if game_hash[:home][:team_name]==team_name
    game_hash.each do |location, team_data|
    if location == :home
    team_data.each do |attribute, data|
          if attribute == :players
            data.each do |name,stat|
              stat.each do |stats,value|
                if stats == :number
                  array_of_jersey_nums<< value
                end
              end
            end
          end
        end
      end
    end
  else
    game_hash.each do |location, team_data|
    if location == :away
    team_data.each do |attribute, data|
          if attribute == :players
            data.each do |name,stat|
              stat.each do |stats,value|
                if stats == :number
                  array_of_jersey_nums<< value
                end
              end
            end
          end
        end
      end
    end
  end
  return array_of_jersey_nums
end

def big_shoe_rebounds
  top_player = ""
  array=[]
  game_hash.map do |location, team_data|
    team_data.map do |attribute, data|
      if attribute==:players
        data.map do |player,stats|
          stats.map do |trait,value|
            if trait == :shoe
                array<< value
              end
            end
          end
        end
      end
    end

  game_hash.map do |location,team_data|
    team_data.map do |attribute,data|
      if attribute==:players
        data.map do |player,stats|
          stats.map do |trait,value|
            if trait == :shoe
              if value == array.sort[-1]
                top_player=player
            end
            end
          end
        end
      end
    end
  end
  if game_hash[:home][:players].include?(top_player)
    return game_hash[:home][:players][top_player][:rebounds]
  else
    return game_hash[:away][:players][top_player][:rebounds]
  end
end
