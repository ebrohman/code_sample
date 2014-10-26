require 'test_helper'

class Sponsor::CompaniesControllerTest < ActionController::TestCase
  setup do
    @sponsor_company = sponsor_companies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sponsor_companies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sponsor_company" do
    assert_difference('Sponsor::Company.count') do
      post :create, sponsor_company: { amount: @sponsor_company.amount, name: @sponsor_company.name, type: @sponsor_company.type }
    end

    assert_redirected_to sponsor_company_path(assigns(:sponsor_company))
  end

  test "should show sponsor_company" do
    get :show, id: @sponsor_company
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sponsor_company
    assert_response :success
  end

  test "should update sponsor_company" do
    put :update, id: @sponsor_company, sponsor_company: { amount: @sponsor_company.amount, name: @sponsor_company.name, type: @sponsor_company.type }
    assert_redirected_to sponsor_company_path(assigns(:sponsor_company))
  end

  test "should destroy sponsor_company" do
    assert_difference('Sponsor::Company.count', -1) do
      delete :destroy, id: @sponsor_company
    end

    assert_redirected_to sponsor_companies_path
  end
end
