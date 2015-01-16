require 'acts_as_explorable'
require 'spec_helper'

describe ActsAsExplorable::Explorable do
  it "should not be explorable" do
    expect(NotExplorable).not_to be_explorable
  end

  it "should be explorable" do
    expect(Explorable).to be_explorable
  end
end