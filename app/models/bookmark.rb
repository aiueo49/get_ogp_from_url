class Bookmark < ApplicationRecord
  def fetch_ogp_info
    # OGP情報を取得する処理
    html = open(url)
    doc = Nokogiri::HTML(html)
    ogp_info = {}

    ogp_info[:title] = doc.css('meta[property="og:title"]').first&.attributes['content']&.value
    ogp_info[:description] = doc.css('meta[property="og:description"]').first&.attributes['content']&.value
    ogp_info[:image] = doc.css('meta[property="og:image"]').first&.attributes['content']&.value
    
    update(ogp_info)
  end
end
