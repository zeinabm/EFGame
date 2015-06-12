require 'test_helper'

class GameBoardsControllerTest < ActionController::TestCase
  setup do
    @game_board = game_boards(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:game_boards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create game_board" do
    assert_difference('GameBoard.count') do
      post :create, game_board: { game_id: @game_board.game_id, player_id: @game_board.player_id }
    end

    assert_redirected_to game_board_path(assigns(:game_board))
  end

  test "should show game_board" do
    get :show, id: @game_board
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @game_board
    assert_response :success
  end

  test "should update game_board" do
    patch :update, id: @game_board, game_board: { game_id: @game_board.game_id, player_id: @game_board.player_id }
    assert_redirected_to game_board_path(assigns(:game_board))
  end

  test "should destroy game_board" do
    assert_difference('GameBoard.count', -1) do
      delete :destroy, id: @game_board
    end

    assert_redirected_to game_boards_path
  end
end
