class Attribute < ApplicationRecord
  has_many :interviews
  has_many :second_attribute, :class_name => "Interview", :foreign_key => "attribute_2_id"
  has_many :third_attribute, :class_name => "Interview", :foreign_key => "attribute_3_id"
  has_many :fourth_attribute, :class_name => "Interview", :foreign_key => "attribute_4_id"
end
