class AddPasswordDigestToCandidates < ActiveRecord::Migration[6.0]
  def change
    add_column :candidates, :password_digest, :string
  end
end
