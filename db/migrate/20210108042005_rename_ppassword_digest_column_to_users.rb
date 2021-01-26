class RenamePpasswordDigestColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :ppassword_digest, :password_digest
  end
end
