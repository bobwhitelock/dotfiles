
# Borrowed from
# https://github.com/teoljungberg/dotfiles/blob/4f44884a99a1d7c16b4b5a4184d4b4fcd9c38fdd/irbrc#L30-L42.
class Object
  def interesting_methods
    case self.class
    when Class
      self.public_methods.sort - Object.public_methods
    when Module
      self.public_methods.sort - Module.public_methods
    else
      self.public_methods.sort - Object.new.public_methods
    end
  end
end
