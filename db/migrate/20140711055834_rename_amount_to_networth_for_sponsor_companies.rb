class RenameAmountToNetworthForSponsorCompanies < ActiveRecord::Migration
  def change
    rename_column :sponsor_companies, :amount, :net_worth
  end
end
