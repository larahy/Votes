class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string :validity
      t.string :choice

      t.timestamps
    end
  end
end
