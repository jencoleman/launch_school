# pig_latin.rb

class PigLatin
  def self.translate(words)
    answer = []
    words.split(' ').each do |text|
      if text.downcase =~ /\A[aeiou]/ || text.downcase =~ /\A(yt)/ || text.downcase =~ /\A(xr)/
        answer.push("#{text}ay")
      elsif text.downcase =~ /\A(thr)/ || text.downcase =~ /\A(sch)/ || text.downcase =~ /\A[bcdfghjklmnpqrstvwxyz](qu)/
        answer.push("#{text.split('').rotate(3).join('')}ay")
      elsif text.downcase =~ /\A(ch)/ || text.downcase =~ /\A(qu)/ || text.downcase =~ /\A(th)/
        answer.push("#{text.split('').rotate(2).join('')}ay")
      elsif text.downcase =~ /\A(ye)/ || text.downcase =~ /\A(xe)/ || text.downcase =~ /\A[bcdfghjklmnpqrstvwxyz]/
        answer.push("#{text.split('').rotate(1).join('')}ay")
      end
    end
    answer.join(' ')
  end
end