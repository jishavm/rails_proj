class Columnnamechange < ActiveRecord::Migration
  def up
   rename_column :messages, :patient_id, :user_id
  end

  def down
  end
end
