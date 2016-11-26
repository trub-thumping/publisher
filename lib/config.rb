require 'json'

class Config
  def initialize json
    @o = json
  end

  def respond_to?(method_sym, include_private = false)
    if @o.keys.include? method_sym.to_s
      true
    else
      super
    end
  end

  def method_missing(method_sym, *arguments, &block)
    if @o.keys.include? method_sym.to_s
      return @o[method_sym.to_s]
    else
      super
    end
  end

end
