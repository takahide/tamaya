class AddTimeIntToClicks < ActiveRecord::Migration
  def change
    add_column :clicks, :time_int, :integer
  end
end
