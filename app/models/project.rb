class Project < ApplicationRecord
  has_many :proposals
  belongs_to :client, optional: true
  # accepts_nested_attributes_for :proposals

  def proposals_attributes=(proposals_attributes)
    # proposals_attributes = {
    #   0 => {:title => "Some title", :tagline => "Some Tagline", :status => "approved"},
    #   1 => {:title => "Some title", :tagline => "Some Tagline", :status => "pending"}
    # }
    proposals_attributes.each do |i, proposal_attributes|
      self.proposals.build(proposal_attributes)
    end
  end

  validates :title, :presence => true
  validates :status, :presence => true
end
