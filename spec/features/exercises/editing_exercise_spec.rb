require 'rails_helper'

RSpec.feature "Editing exercise" do
  before do
    @owner = User.create!(first_name: "John", last_name: "Doe",
                            email: "owner@example.com", password: "password")

    @owner_exercise = @owner.exercises.create(duration_in_min: 48,
                                  workout: "My body building workout",
                                  workout_date: Date.today)

    login_as(@owner)
  end

  scenario "shows no exercises if none created" do

    visit "/"

    click_link "My Lounge"

    path = "/users/#{@owner.id}/exercises/#{@owner_exercise.id}/edit"
    link = "a[href=\'#{path}'\]"
    find(link).click

    fill_in "Duration", with: 45
    click_button "Update Exercise"

    expect(page).to have_content("Exercise has been updated")
    expect(page).to have_content(45)
    expect(page).not_to have_content(48)
  end

end
