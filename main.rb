
def read_chars(number)
    contents = File.read("stroke#{number}.txt")
    contents.split('') 
end

#5,12
CHAR_1 = [4,6,20]
CHAR_2 = [[3,12],[4,3],[4,12],[5,10],[6,2],[9,6],[11,13],[12,12],[13,11]]
CHAR_3 = [[3,5],[3,15],[4,11],[4,12],[5,10],[6,9],[9,15],[12,12]]

STROKE_CHARS = {
    2 => read_chars(2),
    3 => read_chars(3),
    4 => read_chars(4),
    5 => read_chars(5),
    6 => read_chars(6),
    9 => read_chars(9),
    10 => read_chars(10),
    11 => read_chars(11),
    12 => read_chars(12),
    13 => read_chars(13),
    20 => read_chars(20)
}

# CHAR_1.map do |num| 
#     STROKE_CHARS[num].map { |char| p char } 
# end

NG_LIST = ["冬","汀","鳥","琵","琶","烈","督","偵","稟","資","巧","主","北","代","矩","卯","民","出","華","恋","姫","禄","富","夫","媛","巴","拳","勉","旅","貢","今","升","六","下","中","小","川","氏","对","琢","凱","尊","夢","誉","摂","傑","魚","亀","揚","遊","愉","湘","証","菜","萌","覚","款","猛","菊","強","偲","粛","務","斎","逸","野","曽","笙","淑","鳩","球","愛","美","耶","吏","衿","娃","帝","威","茶","妃","朱","専","彦","次","侶","神","按","宥","年","皇","仙","平","峨","恕","四","比","董","収","亡","凡","口","皓","欠","予","丑","允","愉","女","童","子","寸","琳","等","工","森","最","巾","才","万"]
CHAR1_NG_LIST = ["勢","遠","未","生","智","準","砂","可","郎","哉","虹","五","三", "也","之","介","斗"]
CHAR2_NG_LIST = ["善","朝","丸","衣", "帆","紗","江","羽"]

CHAR_2.map do |combi| 
    STROKE_CHARS[combi[0]].map do |char_1|
        next if NG_LIST.include?(char_1)
        next if CHAR1_NG_LIST.include?(char_1)

        STROKE_CHARS[combi[1]].map do |char_2|
            next if NG_LIST.include?(char_2)
            next if CHAR2_NG_LIST.include?(char_2)
            next if char_1 == char_2

            p char_1 + char_2
        end
    end
end
