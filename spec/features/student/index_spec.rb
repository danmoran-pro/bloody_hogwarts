require "rails_helper"
require "pry"

RSpec.describe "as a visitor" do
  before :each do
    @itachi = Student.create!(name: "Itachi",age: 19,house: "Uchiha")
    @sasuke = Student.create!(name: "Sasuke",age: 15,house: "Uchiha")
  end
  it "can see a list of students" do
    visit '/students'

    expect(page).to have_content("#{@itachi.name}")
    expect(page).to have_content("#{@itachi.age}")
    expect(page).to have_content("#{@itachi.house}")

    expect(page).to have_content("#{@sasuke.name}")
    expect(page).to have_content("#{@sasuke.age}")
    expect(page).to have_content("#{@sasuke.house}")

  end
end
