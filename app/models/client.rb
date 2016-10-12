class Client < ApplicationRecord
  has_many :projects

  validates :name, :presence => true
  validates :email, :presence => true
  validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
  validates :phone, :numericality => true, :length => { :minimum => 10, :maximum => 15 }
end
