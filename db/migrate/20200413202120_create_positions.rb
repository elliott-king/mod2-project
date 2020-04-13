class CreatePositions < ActiveRecord::Migration[6.0]
  def change
    create_table :positions do |t|
      t.string   :api_id
      t.string   :position_type
      t.string   :url
      t.datetime :created_at
      t.string   :location
      t.string   :title
      t.string   :description
      t.string   :how_to_apply
      t.integer  :company_id
    end
  end
end
