require "application_system_test_case"

class EpicsTest < ApplicationSystemTestCase
  setup do
    @epic = epics(:one)
  end

  test "visiting the index" do
    visit epics_url
    assert_selector "h1", text: "Epics"
  end

  test "creating a Epic" do
    visit epics_url
    click_on "New Epic"

    fill_in "Name", with: @epic.name
    click_on "Create Epic"

    assert_text "Epic was successfully created"
    click_on "Back"
  end

  test "updating a Epic" do
    visit epics_url
    click_on "Edit", match: :first

    fill_in "Name", with: @epic.name
    click_on "Update Epic"

    assert_text "Epic was successfully updated"
    click_on "Back"
  end

  test "destroying a Epic" do
    visit epics_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Epic was successfully destroyed"
  end
end
