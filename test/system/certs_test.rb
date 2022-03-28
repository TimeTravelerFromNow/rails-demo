require "application_system_test_case"

class CertsTest < ApplicationSystemTestCase
  setup do
    @cert = certs(:one)
  end

  test "visiting the index" do
    visit certs_url
    assert_selector "h1", text: "Certs"
  end

  test "should create cert" do
    visit certs_url
    click_on "New cert"

    fill_in "Date awarded", with: @cert.date_awarded
    fill_in "Title", with: @cert.title
    click_on "Create Cert"

    assert_text "Cert was successfully created"
    click_on "Back"
  end

  test "should update Cert" do
    visit cert_url(@cert)
    click_on "Edit this cert", match: :first

    fill_in "Date awarded", with: @cert.date_awarded
    fill_in "Title", with: @cert.title
    click_on "Update Cert"

    assert_text "Cert was successfully updated"
    click_on "Back"
  end

  test "should destroy Cert" do
    visit cert_url(@cert)
    click_on "Destroy this cert", match: :first

    assert_text "Cert was successfully destroyed"
  end
end
