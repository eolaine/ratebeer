require 'spec_helper'

describe Beer do
  describe "without a name" do
    let(:beer) { Beer.create}
    it "is not saved without a name" do
      expect(beer.valid?).to be(false)
      expect(Beer.count).to eq(0)
    end
  end

  describe "without a style" do
    let(:beer) { Beer.create :name => "Lappari"}
    it "is not saved without a style" do
      expect(beer.valid?).to be(false)
      expect(Beer.count).to eq(0)
    end
  end
end
