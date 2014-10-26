require 'test_helper'

class GamePerformancesControllerTest < ActionController::TestCase
  setup do
    @game_performance = game_performances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:game_performances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create game_performance" do
    assert_difference('GamePerformance.count') do
      post :create, game_performance: { aerial_duels_won: @game_performance.aerial_duels_won, assists: @game_performance.assists, goals: @game_performance.goals, pass_success_percentage: @game_performance.pass_success_percentage, player_id: @game_performance.player_id, red_cards: @game_performance.red_cards, shots_per_game: @game_performance.shots_per_game, yellow_cards: @game_performance.yellow_cards }
    end

    assert_redirected_to game_performance_path(assigns(:game_performance))
  end

  test "should show game_performance" do
    get :show, id: @game_performance
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @game_performance
    assert_response :success
  end

  test "should update game_performance" do
    put :update, id: @game_performance, game_performance: { aerial_duels_won: @game_performance.aerial_duels_won, assists: @game_performance.assists, goals: @game_performance.goals, pass_success_percentage: @game_performance.pass_success_percentage, player_id: @game_performance.player_id, red_cards: @game_performance.red_cards, shots_per_game: @game_performance.shots_per_game, yellow_cards: @game_performance.yellow_cards }
    assert_redirected_to game_performance_path(assigns(:game_performance))
  end

  test "should destroy game_performance" do
    assert_difference('GamePerformance.count', -1) do
      delete :destroy, id: @game_performance
    end

    assert_redirected_to game_performances_path
  end
end
