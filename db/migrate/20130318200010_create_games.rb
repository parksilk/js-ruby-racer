class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :player1_id
      t.string :player2_id
      t.float  :time
      t.string :winner_id

      t.timestamps
    end
  end
end
