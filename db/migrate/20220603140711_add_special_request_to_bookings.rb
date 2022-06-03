class AddSpecialRequestToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :special_request, :text
  end
end
