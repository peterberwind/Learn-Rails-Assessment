class Client < ApplicationRecord
  has_many :projects
  has_many :proposals, through: :projects
  belongs_to :user

  validates :name, :presence => true
  validates :email, :presence => true
  validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
  validates_format_of :phone, with: /\A\d{3}-\d{3}-\d{4}\z/

end
