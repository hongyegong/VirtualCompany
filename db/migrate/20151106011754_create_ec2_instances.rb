class CreateEc2Instances < ActiveRecord::Migration
  def change
    create_table :ec2_instances do |t|

      t.timestamps null: false
    end
  end
end
