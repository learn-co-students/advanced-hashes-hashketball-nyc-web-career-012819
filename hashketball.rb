require 'pry'
def game_hash
  hash = {
    :home => {team_name: "Brooklyn Nets", 
    colors: ["Black", "White"], 
    players: {
      "Alan Anderson" => 
      {:number => 0,
      :shoe => 16,
      :points => 22,
      :rebounds => 12,
      :assists => 12, 
      :steals => 3,
      :blocks => 1,
      :slam_dunks => 1
      },
      
      "Reggie Evans" =>
      {:number => 30,
      :shoe => 14,
      :points => 12,
      :rebounds => 12,
      :assists => 12, 
      :steals => 12,
      :blocks => 12,
      :slam_dunks => 7},
      
      "Brook Lopez" =>
      {:number => 11,
      :shoe => 17,
      :points => 17,
      :rebounds => 19,
      :assists => 10, 
      :steals => 3,
      :blocks => 1,
      :slam_dunks => 15},
      
      "Mason Plumlee" =>
      {:number => 1,
      :shoe => 19,
      :points => 26,
      :rebounds => 12,
      :assists => 6, 
      :steals => 3,
      :blocks => 8,
      :slam_dunks => 5},
      
      "Jason Terry" =>
      {:number => 31,
      :shoe => 15,
      :points => 19,
      :rebounds => 2,
      :assists => 2, 
      :steals => 4,
      :blocks => 11,
      :slam_dunks => 1}
    }
    },
  
        :away => {team_name: "Charlotte Hornets", 
    colors: ["Turquoise", "Purple"], 
    players: {
      "Jeff Adrien" => 
      {:number => 4,
      :shoe => 18,
      :points => 10,
      :rebounds => 1,
      :assists => 1, 
      :steals => 2,
      :blocks => 7,
      :slam_dunks => 2},
      "Bismak Biyombo" =>
      {:number => 0,
      :shoe => 16,
      :points => 12,
      :rebounds => 4,
      :assists => 7, 
      :steals => 7,
      :blocks => 15,
      :slam_dunks => 10},
      "DeSagna Diop" =>
      {:number => 2,
      :shoe => 14,
      :points => 24,
      :rebounds => 12,
      :assists => 12, 
      :steals => 4,
      :blocks => 5,
      :slam_dunks => 5},
      "Ben Gordon" =>
      {:number => 8,
      :shoe => 15,
      :points => 33,
      :rebounds => 3,
      :assists => 2, 
      :steals => 1,
      :blocks => 1,
      :slam_dunks => 0},
      "Brendan Haywood" =>
      {:number => 33,
      :shoe => 15,
      :points => 6,
      :rebounds => 12,
      :assists => 12, 
      :steals => 22,
      :blocks => 5,
      :slam_dunks => 12}
    }
    }
  }
end

def num_points_scored(player)
  ding = []
  game_hash.each do |k,v|
    v[:players].each do |x,y|
        if x == player 
            ding << y[:points]
      end
    end
  end
   ding.join("").to_i
end

def shoe_size(player)
  ding = []
  game_hash.each do |k,v|
    v[:players].each do |x,y|
        if x == player 
            ding << y[:shoe]
      end
    end
  end
   ding.join("").to_i
end

def team_colors(name)
  ding = []
  game_hash.each do |k,v|
    v.each do |x,y|
    if y == name
      ding << v[:colors]
    end
    end
  end
  ding.flatten
end
  
def team_names
  ding = []
  game_hash.each do |k,v|
    v.each do |x,y|
    if x == :team_name
      ding << y
    end
    end
  end
  ding.flatten
end

def player_numbers(name)
  ding = []
  game_hash.each do |x,y|
    y.each do |k,v|
      if v == name
        y[:players].each do |m,n|
          ding << n[:number]
        end
      end
    end
  end
  ding
end

def player_stats(name)
  ding = nil
  game_hash.each do |x,y|
    y.each do |k,v|
      if k == :players
        v.each do |m,n|
          if m == name
          ding = n
        end
      end
      end
    end
  end
  ding
end
        
def big_shoe_rebounds
  shoes = 0
  rebound = 0
  game_hash.each do |x,y|
    y.each do |k,v|
      if k == :players
        v.each do |m,n|
          if n[:shoe]>shoes
            shoes = n[:shoe]
            rebound = n[:rebounds]
          end
        end
      end
    end
  end
  rebound
end

def most_points_scored
  pointss = 0
  player = ""
  game_hash.each do |x,y|
    y.each do |k,v|
      if k == :players
        v.each do |m,n|
          if n[:points]>pointss
            pointss = n[:points]
            player = m
          end
        end
      end
    end
  end
  player
end

def winning_team
  nets = []
  sumn = 0
  hornets = []
  sumh = 0
  game_hash.each do |x,y|
    y.each do |k,v|
      if v == "Brooklyn Nets"
        y[:players].each do |m,n|
          nets << n[:points]
        end
      elsif v == "Charlotte Hornets"
        y[:players].each do |r,s|
          hornets << s[:points]
        end
      end
    end
  end
  nets.each {|i| sumn += i} 
  hornets.each {|o| sumh += o} 
  if sumn > sumh
    "Brooklyn Nets"
  else
    "Charlotte Hornets"
  end
end

def player_with_longest_name
end