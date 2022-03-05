class AuthorsController < ApplicationController
  http_basic_authenticate_with name: "SebastianDetering", password: "supersecretPW!628"

  #layout 'authors'
end
