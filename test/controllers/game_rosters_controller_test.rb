require 'test_helper'

class GameRostersControllerTest < ActionController::TestCase
  setup do
    @game_roster = game_rosters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:game_rosters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create game_roster" do
    assert_difference('GameRoster.count') do
      post :create, game_roster: { game_id: @game_roster.game_id, player_id: @game_roster.player_id }
    end

    assert_redirected_to game_roster_path(assigns(:game_roster))
  end

  test "should show game_roster" do
    get :show, id: @game_roster
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @game_roster
    assert_response :success
  end

  test "should update game_roster" do
    patch :update, id: @game_roster, game_roster: { game_id: @game_roster.game_id, player_id: @game_roster.player_id }
    assert_redirected_to game_roster_path(assigns(:game_roster))
  end

  test "should destroy game_roster" do
    assert_difference('GameRoster.count', -1) do
      delete :destroy, id: @game_roster
    end

    assert_redirected_to game_rosters_path
  end
end
