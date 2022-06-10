require "test_helper"

class MagazineOenologistsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @magazine_oenologist = magazine_oenologists(:one)
  end

  test "should get index" do
    get magazine_oenologists_url
    assert_response :success
  end

  test "should get new" do
    get new_magazine_oenologist_url
    assert_response :success
  end

  test "should create magazine_oenologist" do
    assert_difference("MagazineOenologist.count") do
      post magazine_oenologists_url, params: { magazine_oenologist: {  } }
    end

    assert_redirected_to magazine_oenologist_url(MagazineOenologist.last)
  end

  test "should show magazine_oenologist" do
    get magazine_oenologist_url(@magazine_oenologist)
    assert_response :success
  end

  test "should get edit" do
    get edit_magazine_oenologist_url(@magazine_oenologist)
    assert_response :success
  end

  test "should update magazine_oenologist" do
    patch magazine_oenologist_url(@magazine_oenologist), params: { magazine_oenologist: {  } }
    assert_redirected_to magazine_oenologist_url(@magazine_oenologist)
  end

  test "should destroy magazine_oenologist" do
    assert_difference("MagazineOenologist.count", -1) do
      delete magazine_oenologist_url(@magazine_oenologist)
    end

    assert_redirected_to magazine_oenologists_url
  end
end
