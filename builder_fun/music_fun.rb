require 'forwardable'

class MusicFun
  extend Forwardable
  def_delegators :@music, :[], :has_key?, :fetch

  attr_reader :music

  def initialize music
    @music = music
  end

  def last
    self.class.new music.last
  end

  def first
    self.class.new music.first
  end

  def method_missing(method_id, *args, &block)
    key = method_id.to_s
    value = music.fetch(key, nil)

    case value
    when Hash, MusicFun, Array
      return self.class.new(value)
    when nil?
      return super(method_id, args, &block)
    else
      value
    end
  end
end
