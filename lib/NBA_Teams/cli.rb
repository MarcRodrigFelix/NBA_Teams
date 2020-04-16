class CLI
  
  def call
    APIManager.new.create_team
    puts "Hello there, you can select any NBA team and inspect it?"
    puts ""

    start
  end

  def start
    user_input = ""
    puts ""  
    puts "Which NBA team would you like to inspect? Simply type the teams assigned number : "
    puts ""

    # NBATeams.Team.display_teams
    
    user_input = gets.chomp.to_i

    # if user input enters number 1-30
      # choose the teams hash and a players option to bring up info
      # user can choose a player or go back to first screen to choose teams
      display_teams_roster
        # brings up roster with assinged number 1 - last player
          display_player_stats
        # user can exit or go to first screen to start over
      start

      exit
  end


end




# great user-
    # run program-
    # display all 30 teams with assigned number-
    # ask for user input to inspect a team-
      # display choosen team, and all players with assigned numbers-
        # ask for user input to inspect player-
          # display choosen player-
          # ask if player wants to choose another player or team, or exit-