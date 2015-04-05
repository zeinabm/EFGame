require 'test_helper'

class RoundLettersControllerTest < ActionController::TestCase
  setup do
    @round_letter = round_letters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:round_letters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create round_letter" do
    assert_difference('RoundLetter.count') do
      post :create, round_letter: { game_id: @round_letter.game_id, letter: @round_letter.letter }
    end

    assert_redirected_to round_letter_path(assigns(:round_letter))
  end

  test "should show round_letter" do
    get :show, id: @round_letter
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @round_letter
    assert_response :success
  end

  test "should update round_letter" do
    patch :update, id: @round_letter, round_letter: { game_id: @round_letter.game_id, letter: @round_letter.letter }
    assert_redirected_to round_letter_path(assigns(:round_letter))
  end

  test "should destroy round_letter" do
    assert_difference('RoundLetter.count', -1) do
      delete :destroy, id: @round_letter
    end

    assert_redirected_to round_letters_path
  end
end
