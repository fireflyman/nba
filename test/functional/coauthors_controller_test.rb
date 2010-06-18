require 'test_helper'

class CoauthorsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:coauthors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create coauthor" do
    assert_difference('Coauthor.count') do
      post :create, :coauthor => { }
    end

    assert_redirected_to coauthor_path(assigns(:coauthor))
  end

  test "should show coauthor" do
    get :show, :id => coauthors(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => coauthors(:one).to_param
    assert_response :success
  end

  test "should update coauthor" do
    put :update, :id => coauthors(:one).to_param, :coauthor => { }
    assert_redirected_to coauthor_path(assigns(:coauthor))
  end

  test "should destroy coauthor" do
    assert_difference('Coauthor.count', -1) do
      delete :destroy, :id => coauthors(:one).to_param
    end

    assert_redirected_to coauthors_path
  end
end
