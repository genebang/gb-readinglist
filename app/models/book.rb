class Book < ActiveRecord::Base

  # belongs_to :genre
  has_many :book_genres
  has_many :genres, through: :book_genres

  # scope :finished, ->{ where('finished_on IS NOT NULL') }
  scope :finished, ->{ where.not(finished_on: nil) }
  scope :recent,   ->{ where('finished_on > ?', 2.days.ago) }
  # scope :search,   ->(keyword) { where(title: keyword) if keyword.present? }
  scope :search,   ->(keyword) { where('keywords LIKE ?', "%#{keyword.downcase}%") if keyword.present? }
  # scope :filter,   ->(genre_id) { joins(:book_genres).where(book_genres: { genre_id: genre_id }) }
  # scope :filter,   ->(genre_id) { joins(:book_genres).where('book_genres.genre_id = ?', genre_id) }
  scope :filter,   ->(genre_name) {
    joins(:genres).where('genres.name = ?', genre_name) if genre_name.present?
  }

  before_save :set_keywords

  # def self.recent
  #   where('finished_on > ?', 2.days.ago)
  # end

  def finished?
    finished_on.present?
  end

  # def self.search(keyword)
  #   if keyword.present?
  #     where(title: keyword)
  #   else
  #     all
  #   end
  # end

  protected

    def set_keywords
      # self.keywords = [title, author, description].map { |p| p.downcase }
      self.keywords = [title, author, description].map(&:downcase).join(' ')
    end

end
