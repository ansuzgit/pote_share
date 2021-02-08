class AddPersonNumToReservations < ActiveRecord::Migration[6.0]
  def change
    add_column :reservations, :person_num, :integer
  end
end
