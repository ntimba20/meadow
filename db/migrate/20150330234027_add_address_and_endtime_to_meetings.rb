class AddAddressAndEndtimeToMeetings < ActiveRecord::Migration
  def change
    add_column :meetings, :address, :string
    add_column :meetings, :end_at, :time
  end
end
