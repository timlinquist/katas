require './circular_reference'

class Node
  attr_accessor :next_node
end

describe CircularReferenceDetector do
  it "initializes with a block" do
    detector = CircularReferenceDetector.new { "assertion" }
    detector.block.call.should == "assertion"
  end

  it "should identify circular references in linked list" do
    detector = CircularReferenceDetector.new do |node|
      node.next_node
    end

    node_1, node_2, node_3 = (1..3).map { |*| Node.new }

    node_1.next_node = node_2
    node_2.next_node = node_3

    detector.should_not be_circular(node_1)

    node_3.next_node = node_1
    detector.should be_circular(node_1)

  end

  it "should identify circular references in nested hashes" do
    detector = CircularReferenceDetector.new do |object|
      object.values if object.is_a?(Hash)
    end

    hash = { :a => { :b => { :c => nil, :d => nil } } }

    detector.should_not be_circular(hash)

    hash[:x] = hash[:a][:b]
    detector.should_not be_circular(hash)

    hash[:a][:b][:d] = hash[:a]

    detector.should be_circular(hash)
  end

end

