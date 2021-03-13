class Book < ApplicationRecord
    has_many :book_authors
    has_many :authors, through: :book_authors

    before_create :slugify

    def slugify
        self.slug = name.parameterize
    end
end
