class Expander
  def initialize(string)
    @string = string
  end

  def to_s
    expand(3)
  end

  private

  def expand(n)
    @string * n
  end
end


expander = Expander.new('xyz')
puts expander


=begin
pre ruby 2.7 we could not call private methods with an explicit caller.
even with self.
As of ruby 2.7 it is now legal to call private methods with a literal self
=end
