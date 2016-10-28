class Project < ApplicationRecord
  has_many :proposals
  belongs_to :client, optional: true
  accepts_nested_attributes_for :proposals

  validates :title, :presence => true
  validates :status, :presence => true
end
