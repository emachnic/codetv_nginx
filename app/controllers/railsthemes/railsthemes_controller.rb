class Railsthemes::RailsthemesController < ApplicationController
  before_filter :set_flash_messages, :only => ["standard_markup-flash_messages"]

  def send_email_one_column
    send_email('one_column')
  end

  def send_email_two_column
    send_email('two_column')
  end

  def set_flash_messages
    flash.now[:alert] = "This is a standard rails alert"
    flash.now[:notice] = "This is a standard rails notice"
  end

  private

  def mail_theme_installed?
    Module.const_get('RailsthemesMailer').is_a?(Class) rescue false
  end

  def send_email variety
    if mail_theme_installed?
      RailsthemesMailer.send("test_email_#{variety}", :to => params[:email]).deliver
      flash.now[:notice] = "The preview email has been sent."
      render 'index'
    else
      flash.now[:error] = "There is not a mail theme installed."
      render 'index'
    end
  end
end
