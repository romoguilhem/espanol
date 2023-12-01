class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.integer :number_of_words

      t.timestamps
    end
  end
end
