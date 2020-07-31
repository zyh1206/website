module JekyllOptionalFrontMatter
  class Generator
    def markdown_files
      files = site.static_files
      coll_files = site.collections.map do |name, collection|
        next [] if name == 'posts'
        collection.files
      end.flatten
      (files + coll_files).select { |file| markdown_converter.matches(file.extname) }
    end
  end
end
