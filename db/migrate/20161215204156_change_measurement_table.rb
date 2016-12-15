class ChangeMeasurementTable < ActiveRecord::Migration[5.0]
  def change
    add_column(:measurements, :name, :string)
  end
end
