class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :message
      t.integer :patient_id

      t.timestamps
    end
	add_index :messages, [:patient_id, :created_at]
  end
end
