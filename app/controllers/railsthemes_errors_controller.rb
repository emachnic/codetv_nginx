class RailsthemesErrorsController < ApplicationController
  before_filter do
    flash.now[:notice] = "This is just a sample error page, not a real one! Remove this test message at app/controllers/railsthemes_errors_controller.rb"
  end
end
