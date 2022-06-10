require "application_system_test_case"

class OenologistWinesTest < ApplicationSystemTestCase
  setup do
    @oenologist_wine = oenologist_wines(:one)
  end

  test "visiting the index" do
    visit oenologist_wines_url
    assert_selector "h1", text: "Oenologist wines"
  end

  test "should create oenologist wine" do
    visit oenologist_wines_url
    click_on "New oenologist wine"

    click_on "Create Oenologist wine"

    assert_text "Oenologist wine was successfully created"
    click_on "Back"
  end

  test "should update Oenologist wine" do
    visit oenologist_wine_url(@oenologist_wine)
    click_on "Edit this oenologist wine", match: :first

    click_on "Update Oenologist wine"

    assert_text "Oenologist wine was successfully updated"
    click_on "Back"
  end

  test "should destroy Oenologist wine" do
    visit oenologist_wine_url(@oenologist_wine)
    click_on "Destroy this oenologist wine", match: :first

    assert_text "Oenologist wine was successfully destroyed"
  end
end
