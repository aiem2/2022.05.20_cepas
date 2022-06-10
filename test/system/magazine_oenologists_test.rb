require "application_system_test_case"

class MagazineOenologistsTest < ApplicationSystemTestCase
  setup do
    @magazine_oenologist = magazine_oenologists(:one)
  end

  test "visiting the index" do
    visit magazine_oenologists_url
    assert_selector "h1", text: "Magazine oenologists"
  end

  test "should create magazine oenologist" do
    visit magazine_oenologists_url
    click_on "New magazine oenologist"

    click_on "Create Magazine oenologist"

    assert_text "Magazine oenologist was successfully created"
    click_on "Back"
  end

  test "should update Magazine oenologist" do
    visit magazine_oenologist_url(@magazine_oenologist)
    click_on "Edit this magazine oenologist", match: :first

    click_on "Update Magazine oenologist"

    assert_text "Magazine oenologist was successfully updated"
    click_on "Back"
  end

  test "should destroy Magazine oenologist" do
    visit magazine_oenologist_url(@magazine_oenologist)
    click_on "Destroy this magazine oenologist", match: :first

    assert_text "Magazine oenologist was successfully destroyed"
  end
end
