class Article < ApplicationRecord	
	validates :name, presence: true, length: { minimum: 3 }
	has_many :comments
	searchkick word_start: [:name,:description]
	#binding.pry
=begin
	def search_data
		#binding.pry
		{
			#binding.pry
			name: name,
			description: description
		}
  end
=end
end
