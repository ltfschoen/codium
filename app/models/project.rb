class Project < ActiveRecord::Base

  has_many :users, :through => :memberships
  has_many :memberships  
  has_many :members, :through => :memberships


   # Image Upload functionality
  has_attached_file :image
  validates_attachment :image, 
                :content_type => { :content_type => ['image/jpeg', 'image/png'] },
                :size => { :less_than => 1.megabyte }
                
end
