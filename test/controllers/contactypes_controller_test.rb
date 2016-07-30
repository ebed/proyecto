require 'test_helper'

class ContactypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contactype = contactypes(:one)
  end

  test "should get index" do
    get contactypes_url
    assert_response :success
  end

  test "should get new" do
    get new_contactype_url
    assert_response :success
  end

  test "should create contactype" do
    assert_difference('Contactype.count') do
      post contactypes_url, params: { contactype: { name: @contactype.name } }
    end

    assert_redirected_to contactype_url(Contactype.last)
  end

  test "should show contactype" do
    get contactype_url(@contactype)
    assert_response :success
  end

  test "should get edit" do
    get edit_contactype_url(@contactype)
    assert_response :success
  end

  test "should update contactype" do
    patch contactype_url(@contactype), params: { contactype: { name: @contactype.name } }
    assert_redirected_to contactype_url(@contactype)
  end

  test "should destroy contactype" do
    assert_difference('Contactype.count', -1) do
      delete contactype_url(@contactype)
    end

    assert_redirected_to contactypes_url
  end
end
