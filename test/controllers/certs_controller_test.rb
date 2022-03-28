require "test_helper"

class CertsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cert = certs(:one)
  end

  test "should get index" do
    get certs_url
    assert_response :success
  end

  test "should get new" do
    get new_cert_url
    assert_response :success
  end

  test "should create cert" do
    assert_difference("Cert.count") do
      post certs_url, params: { cert: { date_awarded: @cert.date_awarded, title: @cert.title } }
    end

    assert_redirected_to cert_url(Cert.last)
  end

  test "should show cert" do
    get cert_url(@cert)
    assert_response :success
  end

  test "should get edit" do
    get edit_cert_url(@cert)
    assert_response :success
  end

  test "should update cert" do
    patch cert_url(@cert), params: { cert: { date_awarded: @cert.date_awarded, title: @cert.title } }
    assert_redirected_to cert_url(@cert)
  end

  test "should destroy cert" do
    assert_difference("Cert.count", -1) do
      delete cert_url(@cert)
    end

    assert_redirected_to certs_url
  end
end
