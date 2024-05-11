# 平方根を小数で表した際に0~9までの全ての数字が最も早く現れる最小の整数を求めよ。
# 整数部分を含む場合と、少数部分のみの場合をそれぞれ求めよ。

# 整数部分を含む場合
n = 2
while
  sqrts = Math.sqrt(n).to_s.chars
  numbers = sqrts.reject { |i| i == '.' }[0..9].map(&:to_i).sort
  if numbers == [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    p n
    break
  end
  n += 1
end

# 小数部分のみの場合
n = 2
while
  sqrts = Math.sqrt(n).to_s.chars
  numbers = sqrts[sqrts.index('.')+1..sqrts.index('.')+10].map(&:to_i).sort
  if numbers == [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    p n
    break
  end
  n += 1
end
