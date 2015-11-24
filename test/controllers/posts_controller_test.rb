require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  
  def setup
    @post = posts(:post)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @post
    assert_response :success
  end

  test "should get show" do
    get :show, id: @post
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should create post and redirect to root" do
    assert_difference 'Post.count', 1 do 
      post :create, post: {title: "Title", body: "Body"}
    end
    assert_equal "Post created!", flash[:success]
    assert_redirected_to root_path
  end

  test "should edit" do
    patch :update, id: @post, post: {title: @post.title, body: @post.body}
    assert_equal "Post updated!", flash[:success]
    assert_redirected_to(@post)
  end

  test "should render new with invalid information" do
    get :new
    post :create, post: {title: "", body: ""}
    assert_template "posts/new"
  end

end
