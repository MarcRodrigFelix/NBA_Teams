require_relative "./NBA_Teams/version"
require 'pry'
require 'httparty'

require_relative './cli'
require_relative './api_manager'
require_relative './team'
require_relative './player'

module NBATeams
  class Error < StandardError; end

end