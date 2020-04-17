require 'httparty'
require 'pry'
require_relative './team'
class APIManager
  BASE_URL = "https://www.balldontlie.io/api/v1/"

  def self.get_nba_teams
    response = HTTParty.get(BASE_URL + "teams")
    teams_hash = response["data"]

    Team.create_team_from_api(teams_hash)
    # teams_hash.collect {|t| "#{t['city']} #{t['name']}"} => displays each team.
  end

  def self.get_nba_players
    response = HTTParty.get(BASE_URL + "players")
    player_data = response["data"]
    Player.create_from_api(player_data)
  end
end

# APIManager.get_nba_teams



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


# {"id"=>12,
# "abbreviation"=>"IND",
# "city"=>"Indiana",
# "conference"=>"East",
# "division"=>"Central",