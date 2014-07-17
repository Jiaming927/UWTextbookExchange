class Message < ActiveRecord::Base
	before_save {
		self.content = Encryptor.encrypt(:value => self.content, :key => ENV["MESSAGE_KEY"])
	}
	after_save {
		self.content = Encryptor.decrypt(:value => self.content, :key => ENV["MESSAGE_KEY"]).force_encoding("UTF-8")
	}	
	after_find{
		self.content = Encryptor.decrypt(:value => self.content, :key => ENV["MESSAGE_KEY"])
	}

end
