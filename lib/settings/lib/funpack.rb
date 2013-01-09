require 'json'

class Funpack < Struct.new(:name, :definitions)
  def self.load
    funpackfile = JSON.load(File.read('funpack.json'))
    new(funpackfile['name'], funpackfile['settings'])
  end

  def settings(values)
    settings = {}
    definitions.each do |defn|
      type, name, default = defn['type'], defn['name'], defn['default']

      settings[name] = value(type, name, default, values[name])
    end

    settings
  end

  def value(type, name, default, value)
    case type
    when 'boolean'
      !value.nil?

    when 'integer'
      Integer(value) rescue default

    else
      value || default
    end
  end
end
