class User
	include Mongoid::Document

	field :name, type: String 
	field :email, type: String 

	 auto_increment :sequence

	has_and_belongs_to_many :admin_of, inverse_of: :admins, class_name: "Group"
	has_and_belongs_to_many :member_of, inverse_of: :members, class_name: "Group"

end
