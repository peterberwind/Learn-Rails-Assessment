class Project < ApplicationRecord
  has_many :proposals
  belongs_to :client
end
