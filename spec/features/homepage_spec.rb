require 'spec_helper.rb'

describe "On Homepage" do
  it "about link should go to about page" do
    visit root_path
    click_link "about"
    expect(page).to have_content 'About'
  end
end
