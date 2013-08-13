class Role < ActiveRecord::Base

  # Relations
  has_many :user

  # Validations
  validates :title, :uniqueness => true, :presence => true

  # enable history
  has_paper_trail

  # Rails Admin config
  rails_admin do
    list do
      field :title

    end

    edit do
      field :title
    end
  end

end
