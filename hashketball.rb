require "pry"
#build home and away hashes
def game_hash
  game_hash = {
   :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [
        {:player_name => "Alan Anderson",
         :number => 0,
         :shoe => 16,
         :points => 22,
         :rebounds => 12,
         :assists => 12,
         :steals => 3,
         :blocks => 1,
         :slam_dunks => 1},
         {:player_name => "Reggie Evans",
         :number => 30,
         :shoe => 14,
         :points => 12,
         :rebounds => 12,
         :assists => 12,
         :steals => 12,
         :blocks => 12,
         :slam_dunks => 7},
         {:player_name => "Brook Lopez",
         :number => 11,
         :shoe => 17,
         :points => 17,
         :rebounds => 19,
         :assists => 10,
         :steals => 3,
         :blocks => 1,
         :slam_dunks => 15},
         {:player_name => "Mason Plumlee",
         :number => 1,
         :shoe => 19,
         :points => 26,
         :rebounds => 11,
         :assists => 6,
         :steals => 3,
         :blocks => 8,
         :slam_dunks => 5},
         {:player_name => "Jason Terry",
         :number => 31,
         :shoe => 15,
         :points => 19,
         :rebounds => 2,
         :assists => 2,
         :steals => 4,
         :blocks => 11,
         :slam_dunks => 1}
        ]
    },
    
    
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [
        {:player_name => "Jeff Adrien",
         :number => 4,
         :shoe => 18,
         :points => 10,
         :rebounds => 1,
         :assists => 1,
         :steals => 2,
         :blocks => 7,
         :slam_dunks => 2},
         {:player_name => "Bismack Biyombo",
         :number => 0,
         :shoe => 16,
         :points => 12,
         :rebounds => 4,
         :assists => 7,
         :steals => 22,
         :blocks => 15,
         :slam_dunks => 10},
         {:player_name => "DeSagna Diop",
         :number => 2,
         :shoe => 14,
         :points => 24,
         :rebounds => 12,
         :assists => 12,
         :steals => 4,
         :blocks => 5,
         :slam_dunks => 5},
         {:player_name => "Ben Gordon",
         :number => 8,
         :shoe => 15,
         :points => 33,
         :rebounds => 3,
         :assists => 2,
         :steals => 1,
         :blocks => 1,
         :slam_dunks => 0},
         {:player_name => "Kemba Walker",
         :number => 33,
         :shoe => 15,
         :points => 6,
         :rebounds => 12,
         :assists => 12,
         :steals => 7,
         :blocks => 5,
         :slam_dunks => 12}
        ]
    }
  }
  return game_hash
end

#return amount of points player scored
def num_points_scored(player_name)
  #iterate through teams
  game_hash.each do |teams, info|
    #iterate through players
    info[:players].each do |player|
      #if player name, return points scored
      if player[:player_name] == player_name
        return player[:points]
      end
    end
  end
  return nil
end

#return shoe size of player
def shoe_size(player_name)
  #iterate through teams
  game_hash.each do |teams, info|
    #iterate through players
    info[:players].each do |player|
      #if player name, return shoe size
      if player[:player_name] == player_name
        return player[:shoe]
      end
    end
  end
  return nil
end

#return team's colors
def team_colors(team_name)
  #iterate through teams
  game_hash.each do |teams, info|
    #if team name, return team colors
    if info[:team_name] == team_name
      return info[:colors]
    end
  end
  return nil
end

#return array of teams names
def team_names
  return game_hash.reduce([]) do |memo, (teams, info)|
    memo << info[:team_name]
  end
end

#return array of jersey numbers
def player_numbers(team_name) 
  #iterate through teams
  game_hash.each do |teams, info|
    #if team name, add all jersey numbers
    if info[:team_name] == team_name
      return info[:players].reduce([]) do |jersey_array, player|
       jersey_array << player[:number]
     end
    end
  end
  return nil
end

#take a player name and return array of player's stats
def player_stats(player_name)
  #iterate through teams
  game_hash.each do |teams, info|
    #iterate through team info
    info.each do |team_info, value|
      if team_info == :players
        #iterate through players and add stats to stat array
        value.each do |player|
          if player_name == player[:player_name]
            player.delete(:player_name)
            return player
          end
        end
      end
    end
  end
  return nil
end

#return player with biggest shoe size
def biggest_shoe
  biggest_shoe = {:shoe => 0}
  #iterate through teams
  game_hash.each do |teams, info|
    #iterate through team info
    info.each do |team_info, value|
      if team_info == :players
        #iterate through players and update biggest_shoe if shoe size larger
        value.each do |player|
          if player[:shoe] > biggest_shoe[:shoe]
            biggest_shoe = player
          end
        end
      end
    end
  end
  return biggest_shoe
end

#return number of rebounds of player with biggest shoe size
def big_shoe_rebounds
  return biggest_shoe[:rebounds]
end

#return player with most points
def most_points_scored
  most_points = {:points => 0}
  #iterate through teams
  game_hash.each do |teams, info|
    #iterate through team info
    info.each do |team_info, value|
      if team_info == :players
        #iterate through players and update most_points if points is greater
        value.each do |player|
          if player[:points] > most_points[:points]
            most_points = player
          end
        end
      end
    end
  end
  return most_points[:player_name]
end

#return team and points of input
def team_score(team_name)
  team_points = {:team_name => "#{team_name}", :points => 0}
  #find team
  game_hash.each do |teams, info|
    if info[:team_name] == team_name
      #iterate through team players and aggregate score
      info.each do |info, value|
        if info == :players
          value.each do |player|
            team_points[:points] += player[:points]
          end
        end
      end
    end
  end
  return team_points
end

#return winning team
def winning_team
  home = team_score("Brooklyn Nets")
  away = team_score("Charlotte Hornets")
  if home[:points] > away[:points]
    return home[:team_name]
  else
    return away[:team_name]
  end
end

#return player with longest name
def player_with_longest_name
  long_name = {:player_name => ""}
  #iterate through teams
  game_hash.each do |teams, info|
    #iterate through team info
    info.each do |team_info, value|
      if team_info == :players
        #iterate through players and update most_points if points is greater
        value.each do |player|
          if player[:player_name].length > long_name[:player_name].length
            long_name = player
          end
        end
      end
    end
  end
  return long_name[:player_name]
end

#return true if player with longest name has most steals
def long_name_steals_a_ton?
  most_steals = {:steals => 0}
  #iterate through teams
  game_hash.each do |teams, info|
    #iterate through team info
    info.each do |team_info, value|
      if team_info == :players
        #iterate through players and update most_points if points is greater
        value.each do |player|
          if player[:steals] > most_steals[:steals]
            most_steals = player
          end
        end
      end
    end
  end
  #compare both values and return true or false
  if most_steals[:player_name] == player_with_longest_name
    return true
  else
    return false
  end
end



