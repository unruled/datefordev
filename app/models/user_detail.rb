class UserDetail < ActiveRecord::Base
  
  belongs_to :user
  
  has_attached_file :avatar1, 
    :styles => { :medium => ["256x256#"], :thumb => ["100x100>"], :small => ["48x48>"]  },
    :convert_options => { :all => '-auto-orient' },
    :default_url => "/noimage.gif",
    :s3_protocol => :https
  
  validates_attachment :avatar1,  :content_type => { :content_type => ["image/jpeg", "image/png", "image/gif"] }, :size => { :in => 0..5000.kilobytes }, :if => :avatar1_attached?
  
  has_attached_file :avatar2, 
    :styles => { :medium => ["256x256#"], :thumb => ["100x100>"], :small => ["48x48>"]  },
    :convert_options => { :all => '-gravity center -auto-orient' },
    :default_url => "/noimage.gif",
    :s3_protocol => :https
  
  validates_attachment :avatar2,  :content_type => { :content_type => ["image/jpeg", "image/png", "image/gif"] }, :size => { :in => 0..5000.kilobytes }, :if => :avatar2_attached?  

  validates_presence_of :from, :fav_movie, :last_movie, :last_book, :fav_singer,
    :make_laugh, :make_cry, :like_animals, :my_dream, :like_live
  
  def avatar1_attached?
    self.avatar1.file?
  end
  def avatar2_attached?
    self.avatar2.file?
  end  
end
