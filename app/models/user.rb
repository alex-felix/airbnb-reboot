class User < ApplicationRecord
  # has_many :attendances
  # has_many :events
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :trackable, :validatable,
  #        :omniauthable, omniauth_providers: [:facebook]

  # # before_validation :lower_first_name_capitalize
  # # before_validation :lower_last_name_capitalize

  # validates :first_name, :last_name, presence: true, uniqueness: true
  # validates :address, :city, presence: true
  # GENDERS = %w(Male Female Unknown)
  # validates :gender, presence: true, inclusion: { in: GENDERS }
  # validates :email, presence: true, uniqueness: true, format: {
  #   with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
  #   message: "invalid email"
  # }
  # # validates :phone_number, presence: true, uniqueness: true, format: {
  # #   with: /\A(00?|\+d{2})[1-9]\d{9,11}\z/,
  # #   message: "invalid phone number"
  # # }
  # validates :postcode, presence: true, format: {
  #   with: /\A([A-PR-UWYZ0-9][A-HK-Y0-9][AEHMNPRTVXY0-9]?[ABEHMNPRVWXY0-9]? {1,2}[0-9][ABD-HJLN-UW-Z]{2}|GIR 0AA)\z/,
  #   message: "invalid poscode"
  }
  # validates :date_of_birth, presence: true, format: {
  #   with: /\A(0[1-9]|[12][0-9]|3[01])([-.]|[\/.])(0[1-9]|1[012])([-.]|[\/.])(19|20)\d\d\z/,
  #   message: "invalid date of birth"
  # }

  private

  def lower_first_name_capitalize
    self.first_name = first_name.downcase.capitalize
  end

  def lower_last_name_capitalize
    self.last_name = last_name.downcase.capitalize
  end

  # method for FB login
  def self.find_for_facebook_oauth(auth)
      user_params = auth.to_h.slice(:provider, :uid)
      user_params.merge! auth.info.slice(:email, :first_name, :last_name)
      user_params[:facebook_picture_url] = auth.info.image
      user_params[:token] = auth.credentials.token
      user_params[:token_expiry] = Time.at(auth.credentials.expires_at)

      user = User.where(provider: auth.provider, uid: auth.uid).first
      user ||= User.where(email: auth.info.email).first # User did a regular sign up in the past.
      if user
        user.update(user_params)
      else
        user = User.new(user_params)
        user.password = Devise.friendly_token[0,20]  # Fake password for validation
        user.save
      end
      return user
    end
end
