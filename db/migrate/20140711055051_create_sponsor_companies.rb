class CreateSponsorCompanies < ActiveRecord::Migration
  def change
    create_table :sponsor_companies do |t|
      t.string :name
      t.string :type
      t.integer :amount

      t.timestamps
    end
  end
end
