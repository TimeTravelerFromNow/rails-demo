class WelcomeController < ApplicationController
  def index
    counter = Counter.find_or_create_by(name: "default")
    counter.value = (counter.value || 0) + 10
    counter.save!
    render plain: "Counter #{counter.value}; #{Rails.version}/#{RUBY_VERSION}"
  end
end
