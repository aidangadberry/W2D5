require_relative 'p04_linked_list'

class HashMap
  include Enumerable
  
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    
  end

  def set(key, val)
    
  end

  def get(key)
  end

  def delete(key)
  end

  def each
    @store.each do |bucket|
      bucket.each { |node| yield node }
    end
  end

  # uncomment when you have Enumerable included
  # def to_s
  #   pairs = inject([]) do |strs, (k, v)|
  #     strs << "#{k.to_s} => #{v.to_s}"
  #   end
  #   "{\n" + pairs.join(",\n") + "\n}"
  # end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    resized = Array.new(num_buckets * 2) { LinkedList.new }
    
    @store.each do |bucket|
      bucket.each do |node|
        resized[bucket(node.key, 2)].append(node.key, node.val)
      end
    end

    @store = resized
  end

  def bucket(key, mult = 1)
    key.hash % (num_buckets * mult)
  end
end
