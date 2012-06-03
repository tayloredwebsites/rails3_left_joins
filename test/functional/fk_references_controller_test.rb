require 'test_helper'

class FkReferencesControllerTest < ActionController::TestCase
  setup do
    @fk_reference = fk_references(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fk_references)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fk_reference" do
    assert_difference('FkReference.count') do
      post :create, fk_reference: { description: @fk_reference.description }
    end

    assert_redirected_to fk_reference_path(assigns(:fk_reference))
  end

  test "should show fk_reference" do
    get :show, id: @fk_reference
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fk_reference
    assert_response :success
  end

  test "should update fk_reference" do
    put :update, id: @fk_reference, fk_reference: { description: @fk_reference.description }
    assert_redirected_to fk_reference_path(assigns(:fk_reference))
  end

  test "should destroy fk_reference" do
    assert_difference('FkReference.count', -1) do
      delete :destroy, id: @fk_reference
    end

    assert_redirected_to fk_references_path
  end
end
