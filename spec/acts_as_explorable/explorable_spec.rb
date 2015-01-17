require 'spec_helper'

describe ActsAsExplorable::Explorable do

  let(:zlatan) { create(:zlatan) }
  let(:manuel) { create(:manuel) }
  let(:bastian) { create(:bastian) }
  let(:christiano) { create(:christiano) }
  let(:toni) { create(:toni) }
  let(:fernando) { create(:fernando) }

  it "should not be explorable" do
    expect(NotExplorable).not_to be_explorable
  end

  it "should be explorable" do
    expect(Explorable).to be_explorable
  end

end