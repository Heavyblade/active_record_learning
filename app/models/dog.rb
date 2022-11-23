class DogAgeValidator < ActiveModel::Validator
  def validate(record)
    record.errors.add(:age, 'Dog is too old') if record.years > 10
  end
end

module ActiveModel
  module Validations
    module HelperMethods
      def validates_age(*attr_names)
        validates_with DogAgeValidator, _merge_attributes(attr_names)
      end
    end
  end
end

class Dog
  include ActiveModel::Validations

  attr_accessor :name, :years

  validate :with_method
  validates_numericality_of :years
  validates_age :puppy

  # Available base validators
  #
  # :validates_exclusion_of
  # :validates_acceptance_of
  # :validates_length_of
  # :validates_confirmation_of
  # :validates_format_of
  # :validates_inclusion_of
  # :validates_numericality_of
  # :validates_presence_of
  # :validates_size_of
  # :validates_absence_of
  # :validates_comparison_of

  # ActiveRecord defined validations
  # :validates_uniqueness_of
  # :validates_associated

  def initialize(name = 'zdog', years = 2)
    @name = name
    @years = years
  end

  validates_each :name do |dog, attr, value|
    dog.errors.add attr, 'starts with z.' if value.start_with?('z')
  end

  def with_method
    errors.add :name, 'Fix error'
  end
end
