class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_validation :lower_first_name_capitalize
  before_validation :lower_last_name_capitalize

  validates :first_name, :last_name, presence: true, uniqueness: true
  validates :address, :city, presence: true
  GENDERS = %w(male female unknown)
  validates :gender, presence: true, inclusion: { in: GENDERS }
  validates :email, presence: true, uniqueness: true, format: {
    with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
    message: "invalid email"
  }
  validates :phone_number, presence: true, uniqueness: true, format: {
    with: /\A(00?|\+d{2})[1-9]\d{11}\z/,
    message: "invalid phone number"
  }
  validates :postcode, presence: true, format: {
    with: /\A([A-PR-UWYZ0-9][A-HK-Y0-9][AEHMNPRTVXY0-9]?[ABEHMNPRVWXY0-9]? {1,2}[0-9][ABD-HJLN-UW-Z]{2}|GIR 0AA)\z/,
    message: "invalid poscode"
  }
  validates: :date_of_birth, presence: true, format: {
    with: /\A(0[1-9]|[12][0-9]|3[01])([-.]|[\/.])(0[1-9]|1[012])([-.]|[\/.])(19|20)\d\d\z/
    message: "invalid date of birth"
  }

  private

  def lower_first_name_capitalize
    self.first_name = first_name.downcase.capitalize
  end

  def lower_last_name_capitalize
    self.last_name = last_name.downcase.capitalize
  end

end
