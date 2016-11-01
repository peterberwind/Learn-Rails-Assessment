class Project < ApplicationRecord
  has_many :proposals
  belongs_to :client, optional: true

  def proposals_attributes=(proposals_attributes)
    proposals_attributes.each do |i, proposal_attributes|
      self.proposals.build(proposal_attributes)
    end
  end

  validates :title, :presence => true
  validates :status, :presence => true

  def self.most_recent(limit)
    order("created_at desc").limit(limit)
  end

end
