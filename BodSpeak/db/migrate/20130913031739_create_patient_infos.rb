class CreatePatientInfos < ActiveRecord::Migration
  def change
    create_table :patient_infos do |t|
      t.integer :age
      t.string :gender
      t.integer :user_id
      t.integer :doctor_id
      t.string :anonymous

      t.timestamps
    end
  end
end
