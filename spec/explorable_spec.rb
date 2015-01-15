require 'acts_as_explorable'
require 'spec_helper'

describe ActsAsExplorable::Explorable do
  it "should not be explorable" do
    expect(NotExplorable).not_to be_explorable
  end

  it "should be explorable" do
    expect(Explorable).to be_explorable
  end

  # it_behaves_like "a votable_model" do
  #   # TODO Replace with factories
  #   let (:voter) { Voter.create(:name =>'i can vote!') }
  #   let (:voter2) { Voter.create(:name => 'a new person') }
  #   let (:voter3) { Voter.create(:name => 'another person') }
  #   let (:votable) { Votable.create(:name =>'a voting model') }
  #   let (:votable_cache) { VotableCache.create(:name => 'voting model with cache') }
  # end
end