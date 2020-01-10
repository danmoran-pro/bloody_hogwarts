require "rails_helper"
require "pry"

RSpec.describe "as a visitor" do
  before :each do

    @itachi = Student.create!(name: "Itachi",age: 19,house: "Uchiha")
    @sasuke = Student.create!(name: "Sasuke",age: 15,house: "Uchiha")
    @DADA = @sasuke.courses.create!(name: "Defense against the Dark Arts")
    @herbology = @sasuke.courses.create!(name: "Herbology")
    @potions = @sasuke.courses.create!(name: "potions")
  end

  it "can see a list of students's courses" do
    visit "/students/#{@sasuke.id}"

    expect(page).to have_content(@sasuke.name)
    expect(page).to have_content(@DADA.name)
    expect(page).to have_content(@herbology.name)
    expect(page).to have_content(@potions.name)

    expect(page).to_not have_content(@itachi.name)
  end
end
