require "application_system_test_case"

class DiscsTest < ApplicationSystemTestCase
  setup do
    @disc = discs(:one)
  end

  test "visiting the index" do
    visit discs_url
    assert_selector "h1", text: "Discs"
  end

  test "should create disc" do
    visit discs_url
    click_on "New disc"

    fill_in "Depth", with: @disc.depth
    fill_in "Diameter", with: @disc.diameter
    fill_in "Fade", with: @disc.fade
    fill_in "Flexibility", with: @disc.flexibility
    fill_in "Glide", with: @disc.glide
    fill_in "Height", with: @disc.height
    fill_in "Maker", with: @disc.maker
    fill_in "Model", with: @disc.model
    fill_in "Rimconfig", with: @disc.rimconfig
    fill_in "Rimdiameter", with: @disc.rimdiameter
    fill_in "Rimratio", with: @disc.rimratio
    fill_in "Rimthickness", with: @disc.rimthickness
    fill_in "Speed", with: @disc.speed
    fill_in "Turn", with: @disc.turn
    fill_in "User", with: @disc.user_id
    fill_in "Weight", with: @disc.weight
    click_on "Create Disc"

    assert_text "Disc was successfully created"
    click_on "Back"
  end

  test "should update Disc" do
    visit disc_url(@disc)
    click_on "Edit this disc", match: :first

    fill_in "Depth", with: @disc.depth
    fill_in "Diameter", with: @disc.diameter
    fill_in "Fade", with: @disc.fade
    fill_in "Flexibility", with: @disc.flexibility
    fill_in "Glide", with: @disc.glide
    fill_in "Height", with: @disc.height
    fill_in "Maker", with: @disc.maker
    fill_in "Model", with: @disc.model
    fill_in "Rimconfig", with: @disc.rimconfig
    fill_in "Rimdiameter", with: @disc.rimdiameter
    fill_in "Rimratio", with: @disc.rimratio
    fill_in "Rimthickness", with: @disc.rimthickness
    fill_in "Speed", with: @disc.speed
    fill_in "Turn", with: @disc.turn
    fill_in "User", with: @disc.user_id
    fill_in "Weight", with: @disc.weight
    click_on "Update Disc"

    assert_text "Disc was successfully updated"
    click_on "Back"
  end

  test "should destroy Disc" do
    visit disc_url(@disc)
    click_on "Destroy this disc", match: :first

    assert_text "Disc was successfully destroyed"
  end
end
