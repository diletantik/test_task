class Ticket < ActiveRecord::Base
	belongs_to :ticket_status
	has_many :comments

	validates :name, :presence => true, :length => { :in => 3..40 }
	validates :subject, :presence => true, :length => { :in => 3..40 }
	validates :body, :presence => true, :length => { :in => 3..500 }
	validates :email, :format => {:with => /\A([a-z0-9_\.-]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }, :presence => true


	before_create :set_link

		def set_link
			begin
				self.link = [*('A'..'Z')].sample(3).join.to_s+'-'+SecureRandom.hex(1).to_s+'-'+[*('A'..'Z')].sample(3).join.to_s+'-'+SecureRandom.hex(1).to_s+'-'+[*('A'..'Z')].sample(3).join.to_s
			end while self.class.exists?(link: link)
		end
end
