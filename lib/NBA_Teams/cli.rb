class CLI
  
  def call
    APIManager.get_nba_teams
    APIManager.get_nba_players
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts "          ============================================================          "
    puts ""
    puts ""
    puts "            Welcome, you can inspect any NBA team of your choice.               "
    puts "               You may inspect a teams roster as well. Enjoy!                   "
    puts ""
    puts ""
    puts "          ============================================================          "
    puts ""
    puts "                   Would you like to begin? (Yes/Y or No/N)"
    puts ""
    puts ""
    puts ""
    puts ""


    user_input = $stdin.gets.chomp

    if user_input == "Yes" || user_input == "Y" || user_input == "yes" || user_input == "y"
      start
    else
      exit
    end
  end


  def start

      puts "                            ===================="
      puts ""
      puts ""
      puts "                    Which NBA team would you like to inspect?"
      puts ""
      puts "                     Simply type the teams assigned number :"
      puts ""
      puts "      1. Hawks          |   11. Rockets         |     21. Thunder "
      puts "      2. Celtics        |   12. Pacers          |     22. Magic   "
      puts "      3. Nets           |   13. Clippers        |     23. 76ers   "
      puts "      4. Hornets        |   14. Lakers          |     24. Suns    "
      puts "      5. Bulls          |   15. Grizzlies       |     25. Blazers "
      puts "      6. Cavaliers      |   16. Heat            |     26. Kings   "
      puts "      7. Mavericks      |   17. Bucks           |     27. Spurs   "
      puts "      8. Nuggets        |   18. Timberwolves    |     28. Raptors "
      puts "      9. Pistons        |   19. Pelicans        |     29. Jazz    "
      puts "      10. Warriors      |   20. Knicks          |     30. Wizards "
      puts ""
      puts ""

      user_input = $stdin.gets.chomp
      id = user_input.to_i
        
        if id > 30
          puts "Wrong number, only 30 teams. Try again: "
          user_input = $stdin.gets.chomp
          id = user_input.to_i
        end

      picked_id = Team.find_team_by_id(id)
      picked_players = Player.find_players_by_team_id(id)

      puts ""
      puts ""
      puts "You chose NUMBER... "
      puts ""
      puts ""

      self.display_picked_team(picked_id)

      puts ""
      puts ""
      puts ""
      puts "                      Type in 'roster' to inspect roster : "

      roster_input = $stdin.gets.chomp
      if roster_input == "roster" || roster_input == "Roster"
        self.display_roster(picked_players)
      end
      

      puts ""
      puts ""
      puts ""
      puts "            Would you like to inspect another Team? (Yes/Y or No/N)"
      another_input = $stdin.gets.chomp

      if another_input == "Yes" || another_input == "Y" || another_input == "yes" || another_input == "y"
        start
      else
        exit
      end

    
  end


  def display_picked_team(picked_team)
      puts "#{picked_team.id}!! The #{picked_team.team_name}."
      puts "- - - - -"
      puts "Team abbreviation: #{picked_team.abbreviation}."
      puts "- - - - -"
      puts "City of team: #{picked_team.city}."
      puts "- - - - -"
      puts "Team name: #{picked_team.name}."
      puts "- - - - -"
      puts "Conference: #{picked_team.conference}. The NBA has 2 conference's (East/West)." 
      puts "- - - - -" 
      puts "Division: #{picked_team.division}. There are 6 total divisions in the NBA."
      puts "- - - - -"
  end


  def display_roster(picked_players)
    picked_players.each do |player|
        puts " Name: #{player.first_name} #{player.last_name} | Pos: #{player.position} | Ht: #{player.height_feet} | Wt: #{player.weight_pounds}."
        puts "- - - - - - - - - - - - -"
    end
  end

  def exit
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts "       * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *"
    puts "       *                                                                       *"
    puts "       *                                                                       *"
    puts "       *                                                                       *"
    puts "       *                GoodBye. GoodBye.. GooooodBye...                       *"
    puts "       *                                                                       *"
    puts "       *                                                                       *"
    puts "       *                                                                       *"
    puts "       * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *"
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
  end


end

