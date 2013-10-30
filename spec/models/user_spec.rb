require 'spec_helper'

describe User do
  it "has the username set correctly" do
    user = User.new :username => "Pekka"

    user.username.should == "Pekka"
  end


  it "is not saved without a proper password" do
    user = User.create :username => "Pekka"

    expect(user.valid?).to be(false)
    expect(User.count).to eq(0)
  end

  describe "with a password containing only characters" do
    let(:user) { User.create :username => "Pekka", :password => "secret", :password_confirmation => "secret" }
    it "is not saved with a password containing only characters" do
      expect(user.valid?).to be(false)
      expect(User.count).to eq(0)
    end
  end

  describe "with a too short password" do
    let(:user) { User.create :username => "Pekka", :password => "12", :password_confirmation => "12" }

    it "is not saved with a too short password" do
      expect(user.valid?).to be(false)
      expect(User.count).to eq(0)
    end
  end

  describe "with a proper password" do
    let(:user) { FactoryGirl.create(:user) }

    it "is saved" do
      expect(user.valid?).to be(true)
      expect(User.count).to eq(1)
    end

    it "and with two ratings, has the correct average rating" do
      user.ratings << FactoryGirl.create(:rating)
      user.ratings << FactoryGirl.create(:rating2)

      expect(user.ratings.count).to eq(2)
      expect(user.average_rating).to eq(15.0)
    end
  end

  it "has method for determining the favorite_beer" do
    user = FactoryGirl.create(:user)
    user.should respond_to :favorite_beer
  end

  describe "favorite beer" do
    let(:user) { FactoryGirl.create(:user) }

    it "has method for determining one" do
      user.should respond_to :favorite_beer
    end

    it "without ratings does not have one" do
      expect(user.favorite_beer).to eq(nil)
    end

    it "is the only rated if only one rating" do
      beer = create_beer_with_rating 10, user

      expect(user.favorite_beer).to eq(beer)
    end

    it "is the one with highest rating if several rated" do
      create_beers_with_ratings 10, 20, 15, 7, 9, user
      best = create_beer_with_rating 25, user

      expect(user.favorite_beer).to eq(best)
    end

    def create_beers_with_ratings(*scores, user)
      scores.each do |score|
        create_beer_with_rating score, user
      end
    end

    def create_beer_with_rating(score, user)
      beer = FactoryGirl.create(:beer)
      FactoryGirl.create(:rating, :score => score, :beer => beer, :user => user)
      beer
    end
  end



  #describe "favorite style" do
  #  let(:user) { FactoryGirl.create(:user) }
  #  let(:brewery) { FactoryGirl.create(:brewery) }
  #
  #  it "without ratings does not have one" do
  #    expect(user.favorite_style).to eq(nil)
  #  end
  #
  #  it "is the style of the rated if only one rating" do
  #    create_beer_with_all_attributes brewery, "Lager", 10, user
  #    expect(user.favorite_style).to eq("Lager")
  #  end
  #
  #  it "is the style of the rated if multiple ratings" do
  #    create_beer_with_all_attributes brewery, "Lager", 10, user
  #    create_beer_with_all_attributes brewery, "Lager", 8, user
  #    create_beer_with_all_attributes brewery, "Bitter", 10, user
  #    create_beer_with_all_attributes brewery, "Bitter", 7, user
  #    expect(user.favorite_style).to eq("Lager")
  #  end
  #
  #  #def create_beers_with_ratings(brewery, style, *scores, user)
  #  #  scores.each do |score|
  #  #    create_beer_with_all_attributes brewery, style, score, user
  #  #  end
  #  #end
  #
  #  def create_beer_with_all_attributes(brewery, style, score,  user)
  #    beer = FactoryGirl.create(:beer, :brewery=> brewery, :style => style)
  #    FactoryGirl.create(:rating, :score => score,  :beer => beer, :user => user)
  #    beer
  #  end
  #
  #
  #end
end