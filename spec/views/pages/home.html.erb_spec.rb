require 'spec_helper'


feature "Apartment viewing" do
  before(:each) do
    rental = FactoryGirl.build(:rental).save
  end
  scenario "User views apartments from homepage" do
    visit root_path
    click_link '2 bedrooms in Upper West Side'
    expect(page).to have_text('2 bedrooms in Upper West Side')
  end
end
