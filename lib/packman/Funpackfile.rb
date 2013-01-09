require "packman"
require "json"

class Packman::Funpackfile
  def initialize(filename=nil)
    @hash = {}
    load(filename) if filename
  end

  def load(filename)
    @hash = JSON.load(File.read(filename))
  end
  
  def [](name)
    @hash[name]
  end
end
