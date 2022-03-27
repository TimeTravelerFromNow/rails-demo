require "test_helper"

class ElemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @elem = elems(:one)
  end

  test "should get index" do
    get elems_url
    assert_response :success
  end

  test "should get new" do
    get new_elem_url
    assert_response :success
  end

  test "should create elem" do
    assert_difference("Elem.count") do
      post elems_url, params: { elem: { article_id: @elem.article_id, content: @elem.content, element_type: @elem.element_type, position: @elem.position } }
    end

    assert_redirected_to elem_url(Elem.last)
  end

  test "should show elem" do
    get elem_url(@elem)
    assert_response :success
  end

  test "should get edit" do
    get edit_elem_url(@elem)
    assert_response :success
  end

  test "should update elem" do
    patch elem_url(@elem), params: { elem: { article_id: @elem.article_id, content: @elem.content, element_type: @elem.element_type, position: @elem.position } }
    assert_redirected_to elem_url(@elem)
  end

  test "should destroy elem" do
    assert_difference("Elem.count", -1) do
      delete elem_url(@elem)
    end

    assert_redirected_to elems_url
  end
end
