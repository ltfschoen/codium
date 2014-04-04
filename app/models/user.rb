class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  include ActiveRecordHelpers

  has_many :posts
  has_many :recommendations
  has_many :comments
  has_many :memberships, foreign_key: "member_id"

  has_many :users_skills, :dependent => :destroy # not need to preserve if user deleted
  has_many :skills, :through => :users_skills

  has_many :projects, :through => :memberships
  has_many :post_members
  has_many :posts, :through => :post_members
  has_many :jobs

  validates_format_of :username, :with => /\A[A-Za-z0-9]+\Z/

  # TODO validation
  #validates :given_name, :family_name,
  #          presence: {message: 'You need to insert family name and given name'},
  #          unless: :omniauth?
  #
  #validates :tagline, length: {maximum: 255, message: 'Your tag line must have less then 255 characters'}
  #
  #def omniauth?
  #  uid && provider
  #end


  # Image Upload functionality
  has_attached_file :image
  validates_attachment :image, 
                :content_type => { :content_type => ['image/jpeg', 'image/png'] },
                :size => { :less_than => 1.megabyte }

  def admin?
    self.role == "admin"
  end

  def is_owner?(current_user)
    current_user && current_user.id == self.id
  end

  # Friendly Id
  extend FriendlyId
  friendly_id :username, use: :slugged

  before_save :set_username_and_slug


  private
  def set_username_and_slug
    if username.nil?
      first_part = email[/[^@]+/]
      first_part = first_part.split('').map do |letter|
        if letter.match(/\A[\w]+\z/)
          letter
        else
          ''
        end
      end.join('')

      self.username = self.slug = first_part
    else
      self.slug = self.username
    end
  end

end
