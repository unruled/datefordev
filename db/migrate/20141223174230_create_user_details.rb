class CreateUserDetails < ActiveRecord::Migration
  def change
    create_table :user_details do |t|
      t.references :user
      t.string :from
      t.string :fav_movie
      t.string :last_movie
      t.string :last_book
      t.string :fav_singer
      t.text :make_laugh
      t.text :make_cry
      t.string :like_animals
      t.text :my_dream
      t.string :like_live
      t.string :skype_name
      t.string :facebook_link
      t.text :social_network_links 
      t.timestamps
    end
  end
end