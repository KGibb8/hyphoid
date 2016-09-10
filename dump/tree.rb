
class Tree
  has_many :symbiotes
  has_one :location

  validate :singular

  # attr_accessor :carbon, :sugars, :phosphates, :nitrates - - Set in migration file

  def resources
    {carbon: self.carbon, sugars: self.sugars, proteins: self.proteins, nitrates: self.nitrates}
  end

  private

  def singular
    unless self.location.nil?
      self.errors.add(:location, "A Tree cannot occupy more than one location")
    end
  end


end
