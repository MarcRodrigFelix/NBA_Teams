require 'pry'
class Team
  attr_accessor :name, :team_name, :abbreviation, :city, :conference, :division, :id

  @@all = []

  def self.all
    @@all
  end

  def self.create(name: nil, team_name: nil, abbreviation: nil, city: nil, conference: nil, division: nil, id: nil)
    team = new(name: name, team_name: team_name, abbreviation: abbreviation, city: city, conference: conference, division: division, id: id)
    team.save
    team
  end

  def self.create_team_from_api(teams_hash)
    teams_hash.each do |team|
      self.create(assign_team_attrs(team))
    end
  end

  def self.assign_team_attrs(team)
    team.each_with_object({}) do |(k,v), mem|
      if k == "full_name"
        mem[:team_name] = v
      else
        mem[k.to_sym] = v
      end
    end
  end

  def initialize(name: nil, team_name: nil, abbreviation: nil, city: nil, conference: nil, division: nil, id: nil)
    @name, @team_name, @abbreviation, @city, @id = name, team_name, abbreviation, city, id.to_i
    @conference, @division = conference, division
  end

  def self.find_team_by_id(id)
    Team.all.find{|t| t.id == id}
  end
    
  def save
    @@all << self
  end
end