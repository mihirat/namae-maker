def read_chars(number)
  contents = File.read("stroke#{number}.txt")
  contents.split('')
end

def ng_chars
  contents = File.read('ng_list.txt')
  contents.split('')
end

def good_chars
  contents = File.read('good_list.txt')
  contents.split('')
end

# suitable numbers combination for family name having [5,12] strokes
CHAR_1 = [4, 6, 20]
CHAR_2 = [[3, 12], [4, 3], [4, 12], [5, 10], [6, 2], [9, 6], [11, 13], [12, 12], [13, 11]]
CHAR_3 = [[3, 5], [3, 15], [4, 11], [4, 12], [5, 10], [6, 9], [9, 15], [12, 12]]

STROKE_CHARS = [2,3,4,5,6,7,8,9,10,11,12,13,14,20].map do |i|
  [i, read_chars(i)]
end

NG_LIST = ng_chars
GOOD_LIST = good_chars

# chars not to be used at 1st position
CHAR1_NG_LIST = '加已梧勢夕湖遠未生智準砂可郎哉虹五俊三也之介'
# chars not to be used at 2nd position
CHAR2_NG_LIST = '善朝衣帆紗江羽乃仁'

case ENV['MODE']
when "1"
  CHAR_1.map { STROKE_CHARS[num].map { |char| puts char } }
when "2"
  CHAR_2.map do |combi|
    STROKE_CHARS[combi[0]].map do |char_1|
      next if NG_LIST.include?(char_1)
      next if CHAR1_NG_LIST.split('').include?(char_1)

      STROKE_CHARS[combi[1]].map do |char_2|
        next if NG_LIST.include?(char_2)
        next if CHAR2_NG_LIST.split('').include?(char_2)
        next if char_1 == char_2

        if ENV['GOOD']
          puts char_1 + char_2 if GOOD_LIST.include?(char_1) || GOOD_LIST.include?(char_2)
        else
          puts char_1 + char_2
        end
      end
    end
  end
when "3"
  CHAR_3.map do |combi|
    STROKE_CHARS[combi[0]].map do |char_1|
      next if NG_LIST.include?(char_1)
      next if CHAR1_NG_LIST.split('').include?(char_1)

      STROKE_CHARS.keys.each do |len2| 
        next if len2 >= combi[1]
        len3 = combi[1] - len2
        next unless STROKE_CHARS.keys.include?(len3)

        STROKE_CHARS[len2].map do |char_2|
          next if NG_LIST.include?(char_2)
          next if char_1 == char_2
          STROKE_CHARS[len3].map do |char_3|
            next if NG_LIST.include?(char_3)
            next if char_2 == char_3

            if ENV['GOOD']
              puts char_1 + char_2 + char_3 if GOOD_LIST.include?(char_1) || GOOD_LIST.include?(char_2) || GOOD_LIST.include?(char_3)
            else
              puts char_1 + char_2 + char_3
            end      
          end
        end
      end
    end
  end
end

