class Job < ActiveRecord::Base
  
  default_scope { order('updated_at DESC') } 

  belongs_to :user

  acts_as_taggable
  
  acts_as_taggable_on :technologies

  scope :published, -> { where(:is_published => true).order("jobs.updated_at DESC") }

  scope :approved, -> { where(:is_approved => true).order("jobs.updated_at DESC") }

  has_attached_file :avatar, 
    :styles => { :medium => ["256x256#"], :thumb => ["100x100>"], :small => ["48x48>"]   },
    :convert_options => { :all => '-auto-orient' },
    :default_url => "noimage_gray.gif",
    :s3_protocol => :https

  validates_attachment :avatar, :presence => true, :content_type => { :content_type => ["image/jpeg", "image/png", "image/gif"] }, :size => { :in => 0..2500.kilobytes }, :if => :avatar_attached?  

  validates :title, :presence => true

  def avatar_attached?
    result = self.avatar.file? && self.avatar.url(:medium) != '/noimage.gif'
    logger.info "avatar attached " + result.to_s
    return result
  end
  
  def avatar_is_empty?
    result = self.avatar.url(:medium) == '/noimage.gif'
  end
  
end
