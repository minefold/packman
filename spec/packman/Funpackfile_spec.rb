require 'spec_helper'
require 'packman/funpackfile'
require 'pathname'
require 'tmpdir'

describe Packman::Funpackfile, :fakefs do
  subject { Packman::Funpackfile.new }

  it "can load from a file" do
    write_funpackfile(name: 'Minecraft')
    subject.load "funpack.json"
    subject["name"].should == "Minecraft"
  end

end
