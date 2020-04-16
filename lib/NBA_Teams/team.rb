class Team
  attr_accessor :name, :team_name, :abbreviation, :city, :conference, :division

  @@all = []
  
  def self.all
    @@all
  end

  def self.create(name: nil, team_name: nil, abbreviation: nil, city: nil, conference: nil, division: nil)
    team = new(name: name, team_name: team_name, abbreviation: abbreviation, city: city, conference: conference, division: division)
    team.save
    team
  end

  def self.create_team_from_api(teams_hash)
    teams_hash.each do |team|
    self.create(assign_team_attrs(team))
    end
  end

  def self.assign_team_attrs(team)
    teams.each_with_object({}) do |(k,v), mem|
      if k == "full_name"
        mem[:team_name] = v
      else
        mem[k.to_sym] = v
      end
    end
  end

  def self.display_teams
    puts team_data.collect
  end

  def initialize(name: nil, team_name: nil, abbreviation: nil, city: nil, conference: nil, division: nil)
    @name, @team_name, @abbreviation, @city = @name, @team_name, @abbreviation, @city
    @conference, @division = conference, division
  end
    
  def save
    @@all << self
  end
end

teams = NBApi.get_nba_teams
Team.create_team_from_api(teams)
binding.pry