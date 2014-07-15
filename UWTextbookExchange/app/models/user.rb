class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :confirmable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

validate :email_exist
validate :email_match
validate :email_unique

validate :username_exist
validate :username_length
validate :username_unique

validate :password_conformation
validate :password_exist
validate :password_complexity

  

  def email_exist
	if !email.strip.present?
		errors.add :email, ": Email address cannot be blank"
	end
  end

  def email_match
	if email.strip.present? && !(/@uw.edu$/.match(email.strip))
		errors.add :email,  ": Please use valid UW email address"
	end
  end


  def email_unique
	if email.strip.present?
		user = User.where(:email => email.strip).first
		if user
			errors.add :email, ": Email already exist"
		end
	end
  end

  def username_exist
	if !username.strip.present?
		errors.add :username, ": Username cannot be blank"
	end
  end
  
  def username_length
	if username.strip.present? && !(username.bytesize >= 5 && username.bytesize <= 20)
		error.add :username, ": Username must have 5 to 20 characters"
	end
  end

  def username_unique
	if !username.strip.present?
		user = User.where(:username => username.strip).first
		if user
			errors.add :username, ": Username already exist"
		end
	end
  end

  def password_exist
	if !password.present?
		error.add :password, ": Password cannot be blank"
	end
  end

  def password_conformation
	if password.present? && (!password_confirmation.present? || password_confirmation.present? && password_confirmation != password)
		errors.add :password, ": Password conformation must match"
	end

  end

  def password_complexity
    if password.present? && !(password.bytesize >= 8 && password.bytesize <= 20 && /[A-Z]/.match(password) && /[a-z]/.match(password) && /[0-9]/.match(password))
      errors.add :password, ": Password must be 8 to 20 characters and include at least one lowercase letter, one uppercase letter, and one digit"
    end
  end
end
