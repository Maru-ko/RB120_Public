def rotate(array)
  (0...array.size).map { |column| (0...array.size).map { |row| array[row][column] }.reverse }
end



class PascalTriangle
  def initialize
    @triangle = [[1]]
  end

  def get_file(param)
    return @triangle[param] if @triangle[param]

    previous_file = get_file(param - 1)
    @triangle << calculate_new(previous_file)

    @triangle[param]
  end

  private

  def calculate_new(previous_file)
    current_file = [1]
    (0..(previous_file.size - 1)).each do |idx|
      next if idx == previous_file.size - 1

      current_file << previous_file[idx] + previous_file[idx + 1]
    end
    current_file << 1

    current_file
  end
end

data = {
  id: 1,
  items: [
    {id: 2},
    {id: 3, items: [
      {id: 4},
      {id: 5}
    ]}
  ]
}

#extract_ids(data) # should return [1,2,3,4,5]
#extract_ids({}) # should return []
p data
puts
def dataz(data)
#  integers = []
#  arrays = []
#  hashes = []
#  idk = []
#  data.flatten.each { |sm| sm.class == Integer ? integers << sm : sm.class == Array ? arrays << sm.flatten : sm.class == Hash ? hashes << sm.flatten : idk << sm }#

#  stuff =  arrays.flatten.each { |sm| sm.class == Integer ? integers << sm : sm.class == Array ? arrays << sm.flatten : sm.class == Hash ? hashes << sm.flatten : idk << sm }
#  p integers
#  p arrays
#  p hashes
#  p stuff
#  idk
  #stuff = data.flat_map(&:flatten).flatten.map { |hu| hu.is_a?(Array) || hu.is_a?(Hash) ? hu.flatten : hu }
  #stuff = data.values.flat_map { |one| one.is_a?(Integer) ? one : one.is_a?(Hash) && one.keys.include?(:items) ? [one[:id], a[:items].map { |h| h.values}] : one.flatten}
  #stuff.values.flat_map { |one| one.is_a?(Integer) ? one : one.is_a?(Hash) && one.keys.include?(:items) ? [one[:id], a[:items].map { |h| h.is_a?(hash) ? h.values : h.flatten }] : one.flatten}
  idk = []
  s = []
  i = []
  a = []
  h = []

  data.to_a.flatten.each { |t| t.is_a?(Integer) ? i << t : t.is_a?(Array) ? a << t.flatten : t.is_a?(Hash) ? h << t.to_a.flatten : idk << t }
  dataset = [idk, s, i, a, h].flatten
  result = []
  dataset.each { |ok| ok.is_a?(Integer) ? result << ok : ok.is_a?(Hash) ? result << ok.values : next}
  result.flatten
end
p dataz(data)
puts 
#p data.flat_map(&:flatten).flatten.map { |hu| hu.is_a?(Array) || hu.is_a?(Hash) ? hu.flatten : hu }
#p data[:items]


#p rotate([[1,2],[3,4]])#,[[3,1],[4,2]])