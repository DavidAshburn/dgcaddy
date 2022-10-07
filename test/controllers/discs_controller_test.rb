require "test_helper"

class DiscsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @disc = discs(:one)
  end

  test "should get index" do
    get discs_url
    assert_response :success
  end

  test "should get new" do
    get new_disc_url
    assert_response :success
  end

  test "should create disc" do
    assert_difference("Disc.count") do
      post discs_url, params: { disc: { depth: @disc.depth, diameter: @disc.diameter, fade: @disc.fade, flexibility: @disc.flexibility, glide: @disc.glide, height: @disc.height, maker: @disc.maker, model: @disc.model, rimconfig: @disc.rimconfig, rimdiameter: @disc.rimdiameter, rimratio: @disc.rimratio, rimthickness: @disc.rimthickness, speed: @disc.speed, turn: @disc.turn, user_id: @disc.user_id, weight: @disc.weight } }
    end

    assert_redirected_to disc_url(Disc.last)
  end

  test "should show disc" do
    get disc_url(@disc)
    assert_response :success
  end

  test "should get edit" do
    get edit_disc_url(@disc)
    assert_response :success
  end

  test "should update disc" do
    patch disc_url(@disc), params: { disc: { depth: @disc.depth, diameter: @disc.diameter, fade: @disc.fade, flexibility: @disc.flexibility, glide: @disc.glide, height: @disc.height, maker: @disc.maker, model: @disc.model, rimconfig: @disc.rimconfig, rimdiameter: @disc.rimdiameter, rimratio: @disc.rimratio, rimthickness: @disc.rimthickness, speed: @disc.speed, turn: @disc.turn, user_id: @disc.user_id, weight: @disc.weight } }
    assert_redirected_to disc_url(@disc)
  end

  test "should destroy disc" do
    assert_difference("Disc.count", -1) do
      delete disc_url(@disc)
    end

    assert_redirected_to discs_url
  end
end
