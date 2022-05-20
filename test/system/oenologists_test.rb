require "application_system_test_case"

class OenologistsTest < ApplicationSystemTestCase
  setup do
    @oenologist = oenologists(:one)
  end

  test "visiting the index" do
    visit oenologists_url
    assert_selector "h1", text: "Oenologists"
  end

  test "should create oenologist" do
    visit oenologists_url
    click_on "New oenologist"

    fill_in "Name", with: @oenologist.name
    click_on "Create Oenologist"

    assert_text "Oenologist was successfully created"
    click_on "Back"
  end

  test "should update Oenologist" do
    visit oenologist_url(@oenologist)
    click_on "Edit this oenologist", match: :first

    fill_in "Name", with: @oenologist.name
    click_on "Update Oenologist"

    assert_text "Oenologist was successfully updated"
    click_on "Back"
  end

  test "should destroy Oenologist" do
    visit oenologist_url(@oenologist)
    click_on "Destroy this oenologist", match: :first

    assert_text "Oenologist was successfully destroyed"
  end
end
