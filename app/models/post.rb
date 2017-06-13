class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :clickbaity


    def clickbaity
      if !title.nil?
        if title.match(/(Won't Believe)|(Secret)|(Top\s\d+)|(Guess)/).nil?
          errors.add(:clickbaity, "needs a title containing Won't Believe, Secret, Top [number], or Guess")
          false
        end
      end
    end
end
