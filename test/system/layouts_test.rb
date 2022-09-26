require "application_system_test_case"

class LayoutsTest < ApplicationSystemTestCase
  setup do
    @layout = layouts(:one)
  end

  test "visiting the index" do
    visit layouts_url
    assert_selector "h1", text: "Layouts"
  end

  test "should create layout" do
    visit layouts_url
    click_on "New layout"

    fill_in "Course", with: @layout.course_id
    fill_in "Length", with: @layout.length
    fill_in "Name", with: @layout.name
    fill_in "Pars", with: @layout.pars
    click_on "Create Layout"

    assert_text "Layout was successfully created"
    click_on "Back"
  end

  test "should update Layout" do
    visit layout_url(@layout)
    click_on "Edit this layout", match: :first

    fill_in "Course", with: @layout.course_id
    fill_in "Length", with: @layout.length
    fill_in "Name", with: @layout.name
    fill_in "Pars", with: @layout.pars
    click_on "Update Layout"

    assert_text "Layout was successfully updated"
    click_on "Back"
  end

  test "should destroy Layout" do
    visit layout_url(@layout)
    click_on "Destroy this layout", match: :first

    assert_text "Layout was successfully destroyed"
  end
end
