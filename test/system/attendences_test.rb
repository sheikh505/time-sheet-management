require "application_system_test_case"

class AttendencesTest < ApplicationSystemTestCase
  setup do
    @attendence = attendences(:one)
  end

  test "visiting the index" do
    visit attendences_url
    assert_selector "h1", text: "Attendences"
  end

  test "creating a Attendence" do
    visit attendences_url
    click_on "New Attendence"

    fill_in "Check in", with: @attendence.check_in
    fill_in "Check out", with: @attendence.check_out
    fill_in "Datee", with: @attendence.datee
    check "Status" if @attendence.status
    fill_in "User", with: @attendence.user_id
    click_on "Create Attendence"

    assert_text "Attendence was successfully created"
    click_on "Back"
  end

  test "updating a Attendence" do
    visit attendences_url
    click_on "Edit", match: :first

    fill_in "Check in", with: @attendence.check_in
    fill_in "Check out", with: @attendence.check_out
    fill_in "Datee", with: @attendence.datee
    check "Status" if @attendence.status
    fill_in "User", with: @attendence.user_id
    click_on "Update Attendence"

    assert_text "Attendence was successfully updated"
    click_on "Back"
  end

  test "destroying a Attendence" do
    visit attendences_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Attendence was successfully destroyed"
  end
end
