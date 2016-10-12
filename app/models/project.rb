class Project < ApplicationRecord
  has_many :proposals
  belongs_to :client

  validates :title, :presence => true
  validates :status, :presence => true
end
