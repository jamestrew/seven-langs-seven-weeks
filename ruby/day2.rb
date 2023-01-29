person = {name: 'bob', height: '6 ft', weight: '160 lbs', hair: 'brown'}
person_attrs = person.inject([]) {|attrs, attr| attrs.push(attr)}
puts person_attrs

arr = (1..16).to_a
(0..3).each {|i| puts arr[i * 4, 4].inspect}
arr.each_slice(4) {|slice| puts slice.inspect}

class HashTree
  attr_accessor :children, :name

  def initialize(hash={})
    name = hash.keys.first
    @name = name
    children = []
    hash[name].each {|k, v| children.push(HashTree.new({k => v}))}
    @children = children
  end

  def visit_all(&block)
    visit &block
    children.each {|c| c.visit_all &block}
  end

  def visit(&block)
    block.call self
  end
end

hash_tree = HashTree.new({
  'grandpa' => {
    'dad' => {
      'child1' => {}, 'child2' => {}
    },
    'uncle' => {
      'child3' => {}, 'child4' => {}
    }
  }})

hash_tree.visit_all {|node| puts node.name}

File.open("../sample.txt") do |file|
  file.each_line do |line|
    if line =~ /[Rr]uby/
      puts line
    end
  end
end
