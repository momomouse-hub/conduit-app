require "test_helper"

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get articles_url
    assert_response :success
  end

  test "should redirect edit when not logged in" do
    article = articles(:one)
    get edit_article_url(article)
    assert_redirected_to signin_url
  end

  test "should redirect new when not logged in" do
    get new_article_url
    assert_redirected_to signin_url
  end

  test "should get show" do
    article = articles(:one)
    get article_url(article)
    assert_response :success
  end
end
