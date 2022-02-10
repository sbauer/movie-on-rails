# frozen_string_literal: true
require "application_system_test_case"

class MoviesSystemTest < ApplicationSystemTestCase
  test "visiting the show" do
    Movie.create!(title: "Parasite", director: "Bong Joon-ho")
    Movie.create!(title: "Titanic", director: "James Cameron")
    visit movie_path(1)
    assert_text "Parasite"
    assert_text "Bong Joon-ho"
  end

  test "see title for movie 2" do
    Movie.create!(title: "Parasite", director: "Bong Joon-ho")
    Movie.create!(title: "Titanic", director: "James Cameron")
    visit movie_path(2)
    assert_text "Titanic"
  end

  test "visiting the index page" do
    Movie.create!(title: "Parasite", director: "Bong Joon-ho")
    Movie.create!(title: "Titanic", director: "James Cameron")
    visit "/movies"
    assert_text "Parasite"
    assert_text "Bong Joon-ho"
    assert_text "Titanic"
    assert_text "James Cameron"
  end

  test "adding a new movie" do
    visit movies_path
    assert_button "Add New Movie"

    click_on "Add New Movie"

    assert_current_path new_movie_path

    assert_selector("form")

    fill_in :movie_title, with: "Test Movie"
    fill_in :movie_director, with: "Good Director"
    fill_in :movie_year, with: "1997"
    fill_in :movie_plot_keywords, with: "Good stuff"

    click_on "Create Movie"

    assert_text "Test Movie"
    assert_text "Good Director"
  end

  test "editing a new movie" do
    movie = Movie.create(title: "A Movie To Edit")

    visit movie_path(movie.id)

    click_on "Edit Movie"

    assert_selector "form"

    fill_in "Title", with: "Edited Movie"

    click_on "Update"

    assert_text "Edited Movie"
  end
end