require 'spec_helper'

describe Beer do
  include OwnTestHelper

  let!(:brewery) { FactoryGirl.create :brewery, :name => "Koff" }
  let!(:user) { FactoryGirl.create :user }

  before :each do
    sign_in 'Pekka', 'foobar1'
  end

  it "when user adds a beer, it's added to the database" do
    visit new_beer_path
    fill_in('beer[name]', :with => 'Lappari')
    select('Weizen', :from => 'Style')
    select('Koff', :from => 'beer[brewery_id]')


    expect {
      click_button('Create Beer')
    }.to change { Beer.count }.by(1)
  end

end
