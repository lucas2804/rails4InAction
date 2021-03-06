class User < ActiveRecord::Base
  has_many :roles, dependent: :destroy


  def role_on(project)
    roles.find_by(project_id: project)
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         # :confirmable,
         :authentication_keys => [:signin]


  # Archive User instead of destroy user
  scope :excluding_archived, lambda { where(archived_at: nil) }
  def active_for_authentication?
    super && archived_at.nil?
  end
  def archive
    self.update(archived_at: Time.now)
  end
  def inactive_message
    archived_at.nil? ? super : :archived
  end

  # DEVISE LOGIN
  attr_accessor :signin
  def signin(signin)
    @signin = signin
  end

  def signin
    @signin || self.username || self.email
  end
  validates :username, :presence => true, :uniqueness => {:case_sensitive => false} # etc

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if signin = conditions.delete(:signin)
      where(conditions.to_hash).where(["lower(username) = :value OR lower(email) = :value", { :value => signin.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_hash).first
    end
  end


end
