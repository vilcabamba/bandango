class AddDefaultValueToSaniRequest < ActiveRecord::Migration
  def change
    change_table :sani_requests do |t|
      t.change :last_id, :integer, null: false, default: 0
    end
  end
end
