class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  layout :layout

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:password, :password_confirmation, :current_password) }
  end

  private

  def layout
    if devise_controller?
	return false
    end
  end

 def sendout(to, from, subject, content)
	options = { :address              => "smtp.gmail.com",
            :port                 => 587,
            :domain               => 'hustees.com',
            :user_name            => ENV["GMAIL_USERNAME"],
            :password             => ENV["GMAIL_PASSWORD"],
            :authentication       => 'plain',
            :enable_starttls_auto => true  }
            
	Mail.defaults do
	  delivery_method :smtp, options
	end

	Mail.deliver do
		to to
		from from
		subject subject
		html_part do
			content_type 'text/html; charset=UTF-8'
			body content
		end

	end
 end

end

class String
  def numeric?
    Float(self) != nil rescue false
  end
end