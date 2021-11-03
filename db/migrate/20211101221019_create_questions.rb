class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.string :title, null: false
      t.boolean :is_private, null: false, default: false
      t.references :asker,
                   null: false,
                   index: true,
                   foreign_key: { to_table: :users, name: 'fk_question_to_user' }

      t.timestamps
    end
  end
end
