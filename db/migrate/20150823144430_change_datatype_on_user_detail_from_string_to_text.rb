class ChangeDatatypeOnUserDetailFromStringToText < ActiveRecord::Migration
  def up
    # change the column type to text with limit to 3kb
    change_column :user_details, :from, :text, :limit => 3072
    change_column :user_details, :fav_movie, :text, :limit => 3072
    change_column :user_details, :last_movie, :text, :limit => 3072
    change_column :user_details, :last_book, :text, :limit => 3072
    change_column :user_details, :fav_singer, :text, :limit => 3072
    change_column :user_details, :like_animals, :text, :limit => 3072
    change_column :user_details, :like_live, :text, :limit => 3072
  end
  
  def down
    change_column :user_details, :from, :string
    change_column :user_details, :fav_movie, :string
    change_column :user_details, :last_movie, :string
    change_column :user_details, :last_book, :string
    change_column :user_details, :fav_singer, :string
    change_column :user_details, :like_animals, :string
    change_column :user_details, :like_live, :string
  end
  
end
