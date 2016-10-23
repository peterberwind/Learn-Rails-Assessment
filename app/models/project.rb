class Project < ApplicationRecord
  has_many :proposals
  belongs_to :client
  accepts_nested_attributes_for :proposals

  validates :title, :presence => true
  validates :status, :presence => true
end
