class User < ActiveRecord::Base

  # Relations
  belongs_to :role

  # Validations
  validates :password_confirmation, :presence => true
  validates :password, :confirmation => true
  validates :role, :presence => true

  # enable history
  has_paper_trail

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  # Rails Admin config
  rails_admin do
    list do
      field :email
      field :role
      field :last_sign_in_at
      field :current_sign_in_at
      field :sign_in_count

    end

    edit do
      field :email
      field :password
      field :password_confirmation
      field :role
    end
  end

  # Object methods
  def is string
    unless self.role.nil?
      self.role.title.downcase.scan(/[a-zA-Z]/).to_s == string.downcase.scan(/[a-zA-Z]/).to_s
    end
  end

end
