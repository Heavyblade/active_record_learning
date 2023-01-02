# as indicates polymorphic assosiations 
# dependent: Controls what happens to the associated object when its owner is destroyed:
   # :nullify causes the foreign key to be set to NULL. Polymorphic type column is also nullified on polymorphic associations. Callbacks are not executed.

# The :source_type option specifies the source association type for a has_one :through association that proceeds through a polymorphic association.

class Answer < ApplicationRecord
  belongs_to :question
  has_many :comments, as: :commentable
end