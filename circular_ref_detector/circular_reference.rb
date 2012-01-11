class CircularReferenceDetector
  attr_reader :block

  def initialize(&block)
    @block = block
  end

  def circular? node, visited=[]
    return true if visited.include? node
    node.extend SmartNil

    *next_nodes = @block.call(node)
    visited += [node]

    next_nodes.compact.any? do |next_node|
      circular? next_node, visited
    end
  end
end


module SmartNil
  def method_missing(*args); end
end
