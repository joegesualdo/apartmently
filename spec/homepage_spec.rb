require 'spec_helper.rb'

describe "On Homepage" do
  it "about link should go to about page" do
    visit root_path
    click_link "About"
    expect(page).to have_content 'About'
  end

  it "length method should work" do
    expect("hello".length).to eq 5
  end
end
