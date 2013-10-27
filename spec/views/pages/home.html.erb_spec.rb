require 'spec_helper'


feature "Apartment viewing" do
  before(:each) do
    Rental.create(FactoryGirl.build(:rental))
  end
  scenario "User views apartments from homepage" do
    visit root_path
    click_link '2 Bedroom in Upper West Side'
    expect(page).to have_text('2 Bedrooms in Upper West Side')
  end
end
