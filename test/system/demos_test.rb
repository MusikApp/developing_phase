require "application_system_test_case"

class DemosTest < ApplicationSystemTestCase
  setup do
    @demo = demos(:one)
  end

  test "visiting the index" do
    visit demos_url
    assert_selector "h1", text: "Demos"
  end

  test "creating a Demo" do
    visit demos_url
    click_on "New Demo"

    check "Active" if @demo.active
    fill_in "Content", with: @demo.content
    fill_in "User", with: @demo.user_id
    click_on "Create Demo"

    assert_text "Demo was successfully created"
    click_on "Back"
  end

  test "updating a Demo" do
    visit demos_url
    click_on "Edit", match: :first

    check "Active" if @demo.active
    fill_in "Content", with: @demo.content
    fill_in "User", with: @demo.user_id
    click_on "Update Demo"

    assert_text "Demo was successfully updated"
    click_on "Back"
  end

  test "destroying a Demo" do
    visit demos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Demo was successfully destroyed"
  end
end
