require "rails_helper"
require "pry"

RSpec.describe "as a visitor" do
  before :each do
    @itachi = Student.create!(name: "Itachi", age: 19, house: "Uchiha")
    @sasuke = Student.create!(name: "Sasuke", age: 15, house: "Uchiha")
    @naruto = Student.create!(name: "Naruto", age: 15, house: "Uzumaki")
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

  it "can see the average age of all students" do
    visit '/students'

    expect(page).to have_content("Average Age:")
    expect(page).to have_content(16.3)
    save_and_open_page
  end
end



# As a visitor,
# When I visit '/students'
# I see the average age of all students.
#
# (e.g. "Average Age: 14.5")
