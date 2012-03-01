class Clippy
  def paste
    IO.read("|pbpaste").chomp
  end

  def copy(string)
    IO.popen("pbcopy", "w") do |p|
      p.puts(string)
    end
    string
  end

  def <<(string)
    copy(paste + string)
  end

  def clear
    copy("")
  end

  def to_s
    paste
  end

  def inspect
    to_s
  end
end

def clippy
  @clippy ||= Clippy.new
  @clippy.copy yield if block_given?
  @clippy
end

# https://github.com/carlhuda/bundler/issues/183#issuecomment-1149953
if defined?(::Bundler)
  global_gemset = ENV['GEM_PATH'].split(':').grep(/ruby.*@global/).first
  if global_gemset
    all_global_gem_paths = Dir.glob("#{global_gemset}/gems/*")
    all_global_gem_paths.each do |p|
      gem_path = "#{p}/lib"
      $LOAD_PATH << gem_path
    end
  end
end
