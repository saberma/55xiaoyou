class Swf
  def self.get
    Game.all(:conditions => ["url like ?", "http%"]).each do |g|
      url = URI.parse(g.url).path
      filename = url[(url.rindex('/')+1)..url.size]
      full_filename = File.join(RAILS_ROOT, "public", "swfs", filename)

      if !File.exists?(full_filename)
        system("wget #{g.url} -O #{full_filename}") 
      else
        p "File #{g.url} exist!"
      end

      g.update_attribute :url, "/swfs/#{filename}"
    end
    nil
  end
end
