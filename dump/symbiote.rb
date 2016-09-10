

class Symbiote
  belongs_to :tree
  belongs_to :mycelium

  # attr_accessor :carbon, :sugars, :phosphates, :nitrates - Set in migration file
  attr_reader :time_requested

  def initialize
    @request_lodged_at = Time.now
  end

  private

  def request_fulfilled_at
    @request_fulfilled_at = Time.now
  end

end
