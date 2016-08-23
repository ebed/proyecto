require 'test_helper'

class StatusordersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @statusorder = statusorders(:one)
  end

  test "should get index" do
    get statusorders_url
    assert_response :success
  end

  test "should get new" do
    get new_statusorder_url
    assert_response :success
  end

  test "should create statusorder" do
    assert_difference('Statusorder.count') do
      post statusorders_url, params: { statusorder: { value: @statusorder.value } }
    end

    assert_redirected_to statusorder_url(Statusorder.last)
  end

  test "should show statusorder" do
    get statusorder_url(@statusorder)
    assert_response :success
  end

  test "should get edit" do
    get edit_statusorder_url(@statusorder)
    assert_response :success
  end

  test "should update statusorder" do
    patch statusorder_url(@statusorder), params: { statusorder: { value: @statusorder.value } }
    assert_redirected_to statusorder_url(@statusorder)
  end

  test "should destroy statusorder" do
    assert_difference('Statusorder.count', -1) do
      delete statusorder_url(@statusorder)
    end

    assert_redirected_to statusorders_url
  end
end
