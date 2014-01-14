class CreateSaniRequests < ActiveRecord::Migration
  def change
    create_table :sani_requests do |t|
      t.integer :last_id, null: false
    end
  end
end
