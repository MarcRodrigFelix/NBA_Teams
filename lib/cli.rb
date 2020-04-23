class NBATeams::CLI
  
  def start
    NBATeams::APIManager.get_nba_teams
    NBATeams::APIManager.get_nba_players
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


    input = $stdin.gets.chomp

    if input.downcase == "yes" || input.downcase == "y"
      app
    else
      exit
    end
  end


  def app

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

      if user_input.match(/[a-zA-Z]/)
        puts "                      NO LETTERS, SORRY! TRY AGAIN: "
        app 
      else
        id = user_input.to_i
        
        if id > 30 || id <= 0
          puts "                  WRONG NUMBER. ONLY 30 TEAMS. TRY AGAIN: "
          puts ""
          puts ""
          app
        else

          picked_team = NBATeams::Team.find_team_by_id(id)
          picked_players = NBATeams::Player.find_players_by_team_id(id)

          puts ""
          puts ""
          puts "You chose NUMBER... "
          puts ""
          puts ""

          self.display_picked_team(picked_team)

          puts ""
          puts ""
          puts ""
          puts "                      Type in 'roster' to inspect roster : "
          puts "             (no funny bussines here, type out 'roster' completely)"
          puts "                    (...and no, you don't have an option...)"
          

          roster_input = $stdin.gets.chomp

          if roster_input.downcase == "roster"
            self.display_roster(picked_players)
          else
            puts "           Somebody can't spell.. ahem.. ahem, lets try it again champ. "
            roster_input = $stdin.gets.chomp
            self.display_roster(picked_players) if roster_input.downcase == "roster"
          end
          

          puts ""
          puts ""
          puts ""
          puts "            Would you like to inspect another Team? (Yes/Y or No/N)"
          another_input = $stdin.gets.chomp

          if another_input.downcase == "yes" || another_input.downcase == "y"
            app
          else
            exit
          end
        end
      end

    
  end


  def display_picked_team(picked_team)
      puts "#{picked_team.id}!!"
      puts "===="
      puts "The #{picked_team.team_name}."
      puts "========================"
      puts "Team abbreviation: #{picked_team.abbreviation}."
      puts "================="
      puts "City of team: #{picked_team.city}."
      puts "============"
      puts "Team name: #{picked_team.name}."
      puts "=========="
      puts "Conference: #{picked_team.conference}. The NBA has 2 conference's (East/West)." 
      puts "==========" 
      puts "Division: #{picked_team.division}. There are 6 total divisions in the NBA."
      puts "========"
  end


  def display_roster(picked_players)
    picked_players.each do |player|
        puts " Name: #{player.first_name} #{player.last_name} | Pos: #{player.position} | Ht: #{player.height_feet}'#{player.height_inches}\" | Wt: #{player.weight_pounds}."
        puts "===================================================="
    end
  end

  def exit
    puts ""
    puts ""
    puts ""
    puts ""
    puts "     * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *"
    puts "     *                                                                   *"
    puts "     *                                                                   *"
    puts "     *                                                                   *"
    puts "     *                GoodBye. GoodBye.. GooooodBye...                   *"
    puts "     *                                                                   *"
    puts "     *                                                                   *"
    puts "     *                                                                   *"
    puts "     * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *"
    puts ""
    puts ""
    puts ""
    puts ""
  end


end

