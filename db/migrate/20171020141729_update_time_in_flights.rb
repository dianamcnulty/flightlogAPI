class UpdateTimeInFlights < ActiveRecord::Migration[5.1]
  def change
    change_column :flights, :time, :string
  end
end
