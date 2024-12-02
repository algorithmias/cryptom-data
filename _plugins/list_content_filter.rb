module Jekyll
    module ListContent
      def echo_folder(folder)
        puts "DirectoryIndexGenerator > echo_folder()"
        return "Folder: " + folder
      end
  
      def list_files(folder, type="*")
        puts "DirectoryIndexGenerator > list_files()"
        files = Dir
          .glob(folder + "**/" + type)
          .select { |e| File.file? e }
          .join("<br>")
        puts "File List: #{files}"
        return files
      end
  
      def list_folders(folder)
        puts "DirectoryIndexGenerator > list_folders()"
        folders = Dir
          .glob(folder + '**/*')
          .select { |e| File.directory? e }
          .join("<br>")
        puts "Folder List: #{folders}"
        return folders
      end
    end
  end
  
  Liquid::Template.register_filter(Jekyll::ListContent)