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

      page = 1
      last_page = meta["total_pages"]
      player_info = []

      while page <= last_page
        page_url = "https://www.balldontlie.io/api/v1/players?page=#{page}"
        puts page_url
        puts "page: #{page}"
        puts ""

        page_response = HTTParty.get(page_url)
        players_hash = page_response["data"]
        puts page_response
        # Player.create_players_from_api(players_hash)
          # player_info << players_hash
        Player.create_players_from_api(players_hash)


        page += 1
      end
      # player_info

      # Player.create_players_from_api(player_info)
      binding.pry
  end

end


# => [{"id"=>14,
#   "first_name"=>"Ike",
#   "height_feet"=>nil,
#   "height_inches"=>nil,
#   "last_name"=>"Anigbogu",
#   "position"=>"C",
#   "team"=>
#    {"id"=>12,
#     "abbreviation"=>"IND",
#     "city"=>"Indiana",
#     "conference"=>"East",
#     "division"=>"Central",
#     "full_name"=>"Indiana Pacers",
