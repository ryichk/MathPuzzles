# 年月日をYYYYMMDDの8桁の整数で表した時、これを2進数に変換して逆から並べ、さらに10進数に戻した時、元の日付と同じになるものを探せ。
# 期間は、1964年10月10日(19641010)から2024年5月4日(20240504)までとする。

require 'date'

date = Date.new(1964, 10, 10)
while date <= Date.new(2024, 5, 4)
  date_str = date.strftime('%Y%m%d')
  if date_str.to_i == date_str.to_i.to_s(2).reverse.to_i(2)
    p date_str
  end
  date += 1
end

# 模範解答1 (試行回数が多いが拡張性高い)
term = Date.parse('19641010')..Date.parse('20240504')
term_list = term.map { |d| d.strftime('%Y%m%d').to_i }
p term_list.select { |d| d == d.to_s(2).reverse.to_i(2) }

# 模範解答2 (試行回数が少ないが拡張性低い)
# 「対象な2進数」が「今回の期間に含まれる日付か」を判定する
# 19641010は「1001010111011001010110010」
# 20240504は「1001101001101100001111000」

# 対象期間で2進数の5文字目から8文字を抽出
from_left = 19641010.to_s(2)[4, 8].to_i(2)
to_left = 20240504.to_s(2)[4, 8].to_i(2)
# 左右の8文字をループ
from_left.upto(to_left) { |i|
  l = "%08b" % i
  r = l.reverse
  (0..1).each { |m|
    value = "1001#{l}#{m}#{r}1001"
    begin
      p Date.parse(value.to_i(2).to_s).strftime('%Y%m%d')
    rescue
    end
  }
}
