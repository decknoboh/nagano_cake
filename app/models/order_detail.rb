class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item
  enum making_status: { not_ready: 0, waiting_to_make: 1, making: 2, finished_making: 3}
end
