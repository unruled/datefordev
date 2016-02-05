class ProfileAccess < ActiveRecord::Base
  belongs_to :allow_from, class_name: "User", foreign_key: "from"
  belongs_to :allow_to, class_name: "User", foreign_key: "to"
end
