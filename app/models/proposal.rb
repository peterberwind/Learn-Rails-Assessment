class Proposal < ApplicationRecord
  belongs_to :project, optional: true
  belongs_to :client, optional: true
  
  validates :title, :presence => true
  validates :status, :presence => true
end
