class CreateAgencyClasses < ActiveRecord::Migration
  def change
    create_table :agency_classes do |t|
      t.belongs_to :agency, index: true
      t.belongs_to :course, index: true

      t.timestamps null: false
    end
  end
end
