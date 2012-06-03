require 'test_helper'

class ThroughReferencesControllerTest < ActionController::TestCase
  setup do
    @through_reference = through_references(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:through_references)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create through_reference" do
    assert_difference('ThroughReference.count') do
      post :create, through_reference: { description: @through_reference.description }
    end

    assert_redirected_to through_reference_path(assigns(:through_reference))
  end

  test "should show through_reference" do
    get :show, id: @through_reference
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @through_reference
    assert_response :success
  end

  test "should update through_reference" do
    put :update, id: @through_reference, through_reference: { description: @through_reference.description }
    assert_redirected_to through_reference_path(assigns(:through_reference))
  end

  test "should destroy through_reference" do
    assert_difference('ThroughReference.count', -1) do
      delete :destroy, id: @through_reference
    end

    assert_redirected_to through_references_path
  end
end
