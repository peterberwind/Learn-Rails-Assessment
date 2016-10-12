class Proposal < ApplicationRecord
  belongs_to :project
  belongs_to :client

  validates :title, :presence => true
  validates :status, :presence => true
end
