# frozen_string_literal: true
require "application_system_test_case"

class MoviesSystemTest < ApplicationSystemTestCase
  test "visiting the show" do
    movie = create(:movie)
    visit movie_path(movie.id)
    assert_text movie.title
    assert_text movie.director.name
  end

  test "visiting the index page" do
    movie = create(:movie)
    movie2 = create(:movie)

    visit "/movies"
    assert_text movie.title
    assert_text movie.director.name
    assert_text movie2.title
    assert_text movie2.director.name
  end

  test "adding a new movie" do
    visit movies_path
    assert_button "Add New Movie"

    director = create(:director)

    click_on "Add New Movie"

    assert_current_path new_movie_path

    assert_selector("form")

    fill_in :movie_title, with: "Test Movie"
    fill_in "Director", with: director.name
    fill_in :movie_year, with: "1997"
    fill_in :movie_plot_keywords, with: "Good stuff"

    click_on "Create Movie"

    assert_text "Test Movie"
    assert_text director.name
  end

  test "editing a new movie" do
    movie = create(:movie)

    visit movie_path(movie.id)

    click_on "Edit Movie"

    assert_selector "form"

    fill_in "Title", with: "Edited Movie"

    click_on "Update"

    assert_text "Edited Movie"
  end
end