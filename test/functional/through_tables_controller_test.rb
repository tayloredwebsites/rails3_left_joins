require 'test_helper'

class ThroughTablesControllerTest < ActionController::TestCase
  setup do
    @through_table = through_tables(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:through_tables)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create through_table" do
    assert_difference('ThroughTable.count') do
      post :create, through_table: { description: @through_table.description }
    end

    assert_redirected_to through_table_path(assigns(:through_table))
  end

  test "should show through_table" do
    get :show, id: @through_table
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @through_table
    assert_response :success
  end

  test "should update through_table" do
    put :update, id: @through_table, through_table: { description: @through_table.description }
    assert_redirected_to through_table_path(assigns(:through_table))
  end

  test "should destroy through_table" do
    assert_difference('ThroughTable.count', -1) do
      delete :destroy, id: @through_table
    end

    assert_redirected_to through_tables_path
  end
end
