class Artist < ApplicationRecord
    has_many :artist_instruments
    has_many :instruments, through: :artist_instruments
    validates :name, presence: true
    validates :title, uniqueness: { message: "Another Artist has already taken that title." }

    def instruments_attributes=(instrument_attributes)
        instrument_attributes.values.each do |instrument_attribute|
            instrument = Instrument.find_or_create_by(instrument_attribute)
            self.instruments << instrument
        end
    end
end
