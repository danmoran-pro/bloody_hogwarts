require "rails_helper"
require "pry"

RSpec.describe "as a visitor" do
  before :each do
    @DADA = Course.create!(name: "Defense against the Dark Arts")
    @herbology = Course.create!(name: "Herbology")
    @potions =Course.create!(name: "potions")
    @itachi = Student.create!(name: "Itachi",age: 19,house: "Uchiha")
    @sasuke = Student.create!(name: "Sasuke",age: 15,house: "Uchiha")
  end

  it "can see a list of courses and count of students" do
    @itachi.courses << @DADA
    @itachi.courses << @herbology
    @itachi.courses << @potions

    @sasuke.courses << @DADA
    @sasuke.courses << @potions

    visit '/courses'

    within "#course-#{@DADA.id}" do
      expect(page).to have_content(@DADA.name)
      expect(page).to have_content(2)
    end

    within "#course-#{@herbology.id}" do
      expect(page).to have_content(@herbology.name)
      expect(page).to have_content(1)
    end

    within "#course-#{@potions.id}" do
      expect(page).to have_content(@potions.name)
      expect(page).to have_content(2)
    end
  end
end
