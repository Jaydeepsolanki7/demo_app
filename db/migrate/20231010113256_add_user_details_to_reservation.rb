class AddUserDetailsToReservation < ActiveRecord::Migration[7.1]
  def change
    add_column :reservations, :user_name, :string
    add_column :reservations, :user_email, :string
    add_column :reservations, :gender, :string
    add_column :reservations, :user_age, :integer
  end
end
