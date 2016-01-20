class User < ActiveRecord::Base
  has_secure_password
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  scope :safe_houses, where(:safe_house => true)

  has_many :orders

  enum role: %w(default admin)

  after_validation :geocode
  geocoded_by :full_street_address

  def full_street_address
    unless address.nil? || city.nil? || state.nil? || zipcode.nil?
      address + ", " + city + ", " + state + ", " + zipcode
    end
  end

  
end
