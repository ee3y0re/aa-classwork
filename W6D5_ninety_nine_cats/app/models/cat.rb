# == Schema Information
#
# Table name: cats
#
#  id          :integer          not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string           not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'action_view'

class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper
    # include ActionView::Helpers::DateHelper

    CAT_COLORS = %w(black white orange brown).freeze

    validates :color, inclusion: CAT_COLORS
    validates :sex, inclusion: %w(M F)
    validates :birth_date, :color, :name, :sex, presence:true #not description

    has_many :rental_requests,
    foreign_key: :cat_id,
    class_name: :CatRentalRequest

    def age
        time_ago_in_words(birth_date)
    end
end
