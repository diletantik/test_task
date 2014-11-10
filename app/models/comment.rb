class Comment < ActiveRecord::Base
	belongs_to :ticket

	validates :comment, :presence => true, :length => { :in => 3..500 }
end
