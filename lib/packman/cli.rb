require 'packman'
require 'packman/web_settings'
require 'thor'

class Packman::CLI < Thor

  map ["-v", "--version"] => :version

  desc "settings", "Generate the funpack settings"
  def settings
    check_funpackfile!
    settings = Packman::WebSettings.generate(funpackfile)
    $stdout.puts JSON.pretty_generate(settings)
  end

  desc "version", "Display Packman gem version"
  def version
    puts Packman::VERSION
  end

  private ######################################################################

    def error(message)
      puts "ERROR: #{message}"
      exit 1
    end

    def check_funpackfile!
      error("#{funpackfile} does not exist.") unless File.exist?(funpackfile)
    end

    def funpackfile
      "funpack.json"
    end

end