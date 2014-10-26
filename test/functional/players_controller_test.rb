require 'test_helper'

class PlayersControllerTest < ActionController::TestCase
  setup do
    @player = players(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:players)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create player" do
    assert_difference('Player.count') do
      post :create, player: { age: @player.age, birth_city: @player.birth_city, birth_country: @player.birth_country, birth_day: @player.birth_day, first_name: @player.first_name, foot: @player.foot, height_cm: @player.height_cm, image: @player.image, last_name: @player.last_name, nationality: @player.nationality, nickname: @player.nickname, position: @player.position, team_id: @player.team_id, team_uuid: @player.team_uuid, uuid: @player.uuid, weight_kg: @player.weight_kg }
    end

    assert_redirected_to player_path(assigns(:player))
  end

  test "should show player" do
    get :show, id: @player
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @player
    assert_response :success
  end

  test "should update player" do
    put :update, id: @player, player: { age: @player.age, birth_city: @player.birth_city, birth_country: @player.birth_country, birth_day: @player.birth_day, first_name: @player.first_name, foot: @player.foot, height_cm: @player.height_cm, image: @player.image, last_name: @player.last_name, nationality: @player.nationality, nickname: @player.nickname, position: @player.position, team_id: @player.team_id, team_uuid: @player.team_uuid, uuid: @player.uuid, weight_kg: @player.weight_kg }
    assert_redirected_to player_path(assigns(:player))
  end

  test "should destroy player" do
    assert_difference('Player.count', -1) do
      delete :destroy, id: @player
    end

    assert_redirected_to players_path
  end
end
