class CreateProposals < ActiveRecord::Migration[5.0]
  def change
    create_table :proposals do |t|
      t.string :title
      t.string :tagline
      t.string :status
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
