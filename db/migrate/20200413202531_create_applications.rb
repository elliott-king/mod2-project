class CreateApplications < ActiveRecord::Migration[6.0]
  def change
    create_table :applications do |t|
      t.integer :position_id
      t.integer :candidate_id
      t.boolean :submitted,    default: false
    end
  end
end
