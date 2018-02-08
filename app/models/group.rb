class Group
	include Mongoid::Document

	field :name, type: String

	has_and_belongs_to_many :admins, inverse_of: :admin_of, class_name: "User"
	has_and_belongs_to_many :members, inverse_of: :member_of, class_name: "User"

end 