class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :question_num
      t.integer :good
      t.string :iden

      t.timestamps null: false
    end
  end
end
