class ProfileView < ActiveRecord::Base
  belongs_to :view_from, class_name: "User", foreign_key: "from"
  belongs_to :view_to, class_name: "User", foreign_key: "to"
end
