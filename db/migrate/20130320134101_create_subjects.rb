class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :assuntos do |t|
      t.string :subject
      t.string :description

      t.timestamps
    end
  end
end
