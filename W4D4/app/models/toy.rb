class Toy < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :toyable_id, uniqueness: { scope: :toyable_type }

  belongs_to :toyable, polymorphic: true

end
