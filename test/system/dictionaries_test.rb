require "application_system_test_case"

class DictionariesTest < ApplicationSystemTestCase
  setup do
    user = User.find_by_email 'test@mail.ru'

    @dictionary = Dictionary.new user: user
  end

  # test "visiting the index" do
  #   visit dictionaries_url
  #   assert_selector "h1", text: "Dictionaries"
  # end
  #
  # test "creating a Dictionary" do
  #   visit dictionaries_url
  #   click_on "New Dictionary"
  #
  #   fill_in "Title", with: @dictionary.title
  #   click_on "Create Dictionary"
  #
  #   assert_text "Dictionary was successfully created"
  #   click_on "Back"
  # end
  #
  # test "updating a Dictionary" do
  #   visit dictionaries_url
  #   click_on "Edit", match: :first
  #
  #   fill_in "Title", with: @dictionary.title
  #   click_on "Update Dictionary"
  #
  #   assert_text "Dictionary was successfully updated"
  #   click_on "Back"
  # end
  #
  # test "destroying a Dictionary" do
  #   visit dictionaries_url
  #   page.accept_confirm do
  #     click_on "Destroy", match: :first
  #   end
  #
  #   assert_text "Dictionary was successfully destroyed"
  # end
end
