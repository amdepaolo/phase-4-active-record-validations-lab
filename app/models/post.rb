class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in: ["Fiction", "Non-Fiction"]}
    validate :title_contains_clickbait

    private

    def title_contains_clickbait
        clickbait_array = [/Won't Believe/, /Secret/, /Top \d/, /Guess/]
        if clickbait_array.none? {|phrase| phrase.match(title)}
            errors.add(:title, "Needs more clickbait")
        end
    end
end
