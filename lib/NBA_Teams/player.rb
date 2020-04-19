require_relative './api_manager'
require 'pry'
class Player
  attr_accessor :first_name, :last_name, :position, :height_feet, :height_inches, :weight_pounds, :team, :id

  @@all = []

  def self.all
    @@all
  end

  def self.create(first_name: nil, last_name: nil, position: nil, height_feet: nil, height_inches: nil, weight_pounds: nil, team: nil, id: nil)
    player = new(first_name: first_name, last_name: last_name, position: position, height_feet: height_feet, height_inches: height_inches, weight_pounds: weight_pounds, team: team, id: id)
    player.save
    player
  end

  def self.create_players_from_api(players_hash)
    players_hash.each do |player|
      a = assign_player_attr(player)
      binding.pry
      self.create(assign_player_attr(player))
    end
  end

  def self.assign_player_attr(player)
    player.each_with_object({}) do |(k,v), mem|
      if k == "team"
        next
      else
        mem[k.to_s] = v
      end
    end
  end


  def initialize(first_name: nil, last_name: nil, position: nil, height_feet: nil, height_inches: nil, weight_pounds: nil, team: nil, id: nil)
    @first_name, @last_name, @position = first_name, last_name, position
    @height_feet, @height_inches, @weight_pounds = height_feet, height_inches, weight_pounds
    @id = id
    @team = team
  end

  def save
    @@all << self
  end

end
APIManager.new
Player.create_players_from_api(APIManager.get_nba_players)

  # def self.new_from_api(player_hash)
  #   player_hash.each do |player|
  #     Player.new(assign_player_attr(player))
  #   end
  # end