module LemmasHelper
 def tag_cloud(tags)
  ERB.new(%{
    <% tags.each do |tag| %>
       <%= link_to tag.name, { :action => :tag, :id => tag.name }
            %>
    <% end %>}).result(binding)
 end
 
 def tag_style(tags,name)
  arr = []
  weight = 0
  tags.each do |tag|
   if tag.name == name
       weight = tag.count
   end
    arr << tag.count
  end
  arr = arr.uniq.sort
  index = arr.rindex(weight)
  return style_of_tag(arr.size, index)
 end
 
 def style_of_tag
   max = 2, min = 0.8, size = 1
   fonts = [min,max]
   if level == 1
    size = 1
    elsif level == 2
        size = fonts[index] #取出索引所在的值.
    else
        (0...level-2).each do
           fonts << ((max - min) / (level.to_f-1 ) + min )
        end
      size = fonts.sort[index]  
   end
   color = "#"+ rand(255).to_s(16)+rand(255).to_s(16)+rand(255).to_s(16)  #隨機生成一個16進制顏色值
   size_txt = "font-size:#{size}em;"#生成css字符串
   color_txt = "color:#{color};"
   return [size_txt, color_txt].join
 end
 
  #---------------------------------
  def hot_tag(tags)
    a = 0
    result = nil
    tags.each do |tag|
      if a < tag.count
        a = tag.count
        result = tag
      end
    end
    return result
 end
 #---------------------------------
 def seo_meta lemma
    unless lemma.blank?
      keywords h(lemma.tag_list.to_s)
      description h(lemma.title + "——"+ truncate(lemma.body ,:length => 120))
    end
  end
 #---------------------------------
 
end
