class CreateCandidates < ActiveRecord::Migration[6.0]
  def change
    create_table :candidates do |t|
      t.string :name
      t.float  :gpa
      t.string :education_level
      t.string :native_language
      t.string :second_language
    end
  end
end
