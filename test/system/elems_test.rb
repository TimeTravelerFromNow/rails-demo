require "application_system_test_case"

class ElemsTest < ApplicationSystemTestCase
  setup do
    @elem = elems(:one)
  end

  test "visiting the index" do
    visit elems_url
    assert_selector "h1", text: "Elems"
  end

  test "should create elem" do
    visit elems_url
    click_on "New elem"

    fill_in "Article", with: @elem.article_id
    fill_in "Content", with: @elem.content
    fill_in "Element type", with: @elem.element_type
    fill_in "Position", with: @elem.position
    click_on "Create Elem"

    assert_text "Elem was successfully created"
    click_on "Back"
  end

  test "should update Elem" do
    visit elem_url(@elem)
    click_on "Edit this elem", match: :first

    fill_in "Article", with: @elem.article_id
    fill_in "Content", with: @elem.content
    fill_in "Element type", with: @elem.element_type
    fill_in "Position", with: @elem.position
    click_on "Update Elem"

    assert_text "Elem was successfully updated"
    click_on "Back"
  end

  test "should destroy Elem" do
    visit elem_url(@elem)
    click_on "Destroy this elem", match: :first

    assert_text "Elem was successfully destroyed"
  end
end
