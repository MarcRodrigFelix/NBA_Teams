class NBATeams::Player
  attr_accessor :first_name, :last_name, :position, :height_feet, :height_inches, :weight_pounds, :team, :id

  @@all = []

  def self.all
    @@all
  end

  def self.create(player_hash)
    player = new(player_hash)
    player.save
    player
  end

  def self.create_players_from_api(players_hash)
    players_hash.each do |player|
      if player['height_feet'].nil? || player['weight_pounds'].nil?
        next
      else
        self.create(assign_player_attr(player))
      end
    end
  end

  def self.assign_player_attr(player)
    player.each_with_object({}) do |(k,v), mem|
        mem[k.to_sym] = v
    end
  end


  def initialize(first_name: nil, last_name: nil, position: nil, height_feet: nil, height_inches: nil, weight_pounds: nil, team: nil, id: nil)
    @first_name, @last_name = first_name, last_name
    @position = position
    @height_feet, @height_inches, @weight_pounds = height_feet, height_inches, weight_pounds
    @id = id
    @team = team
  end

  def self.find_players_by_team_id(id)
    NBATeams::Player.all.find_all{|plyr| plyr.team['id'] == id}
  end
  
  def save
    @@all << self
  end

end