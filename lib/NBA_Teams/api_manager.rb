require 'httparty'
require 'pry'
require_relative './team'
class APIManager

  def self.get_nba_teams
    url = "https://www.balldontlie.io/api/v1/"

      response = HTTParty.get(url + "teams")
      response.parsed_response
      
      teams_hash = response["data"]
      Team.create_team_from_api(teams_hash)
  end

  def self.get_nba_players
    url = "https://www.balldontlie.io/api/v1/"
      response = HTTParty.get(url + "players?page=1")

      data = response["data"]
      meta = response["meta"]

      players_total = meta["total_count"]
      players_per_page = data.count

      page = 75
      last_page = meta["total_pages"]
      player_info = []

      while page <= 131
        page_url = "https://www.balldontlie.io/api/v1/players?page=#{page}"
        puts ""
        puts "Loading.. #{page}/131"
        puts ""

        page_response = HTTParty.get(page_url)
        players_hash = page_response["data"]

        Player.create_players_from_api(players_hash)


        page += 1
      end

  end

end
