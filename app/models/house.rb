class HouseValidator < ActiveModel::Validator
  def validate(record)
    record.errors.add(:location, 'Location should have longer description') if record.location.length < 6
    record.errors.add(:extras, 'extras should be an array') if record.extras.class != Array
  end
end

module ActiveModel
  module Validations
    module HelperMethods
      def validates_house_config(*attr_names)
        validates_with HouseValidator, _merge_attributes(attr_names)
      end
    end
  end
end

class House
  include ActiveModel::Validations

  attr_accessor :rooms, :baths, :location, :size, :extras

  validate :size_format # Type 1 --> with class method
  validates_house_config :house_config # Type 2 --> with custom validator class (record)

  def initialize(rooms = 2, baths = 2, location = 'central building', size = '50m2', extras = [])
    @rooms = rooms
    @baths = baths
    @location = location
    @size = size
    @extras = extras
  end

  validates_each :baths do |house, attr, value| # Type 3 --> with custom validator for attribute
    house.errors.add attr, 'should have at least one bathroom.' if value <= 0
  end

  def size_format
    errors.add :size, 'House size does not match format' unless size.match(/[0-9]m2+/)
  end
end

