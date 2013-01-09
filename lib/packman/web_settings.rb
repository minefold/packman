require 'packman'
require 'packman/funpackfile'
require 'packman/proc_runner'
require 'launchy'

module Packman
  SETTINGS_ROOT = File.expand_path("../../settings", __FILE__)
end

class Packman::WebSettings
  def self.generate(filename)
    runner = new(Packman::Funpackfile.new(filename))
    runner.start!
  end

  def initialize(funpackfile)
    @funpackfile = funpackfile
  end

  def start!
    settings = nil
    ProcRunner.run("ruby", "#{Packman::SETTINGS_ROOT}/app.rb") do |runner|
      runner.each_line do |line|
        case line
        when /Listening on ([\d.:]+)/
          $stderr.puts line
          Launchy.open("http://#{$1}")
          
        when /settings: (.*)/
          Thread.new do
            sleep 1
            runner.kill!
          end
          settings = JSON.load($1)
        end
      end
    end
    settings
  end
end