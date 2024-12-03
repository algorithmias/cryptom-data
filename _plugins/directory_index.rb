require 'json'

module Jekyll
  class DirectoryIndexGenerator < Generator

    def generate(site)
      puts "DirectoryIndexGenerator > generate()"
      moments_dir = File.join(site.source, 'moments')
      moments_structure = directory_structure(moments_dir)

      # Write the JSON file
      File.open(File.join(site.dest, 'moments_index.json'), 'w') do |file|
        file.write(JSON.pretty_generate(moments_structure))
      end
    end

    private

    def directory_structure(dir)
      puts "DirectoryIndexGenerator > directory_structure()"
      structure = {}
      Dir.foreach(dir) do |entry|
        next if entry == '.' || entry == '..'
        path = File.join(dir, entry)
        if File.directory?(path)
          structure[entry] = directory_structure(path)
        else
          structure[entry] = entry
        end
      end
      structure
    end
  end
end