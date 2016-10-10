class CreateClients < ActiveRecord::Migration[5.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :contact
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
