class CreatePainRatings < ActiveRecord::Migration
  def change
    create_table :pain_ratings do |t|
      t.integer :rating
      t.references :clockwork_event

      t.timestamps
    end
  end
end
