# ルーレットの数字の配置として有名なものに「ヨーロピアンスタイル」と「アメリカンスタイル」がある。
# それぞれの配置から「連続するn個の数の和」が最大になる位置を考える。
# ヨーロピアンスタイル: 0, 32, 15, 19, 4, 21, 2, 25, 17, 34, 6, 27, 13, 36, 11, 30, 8, 23, 10, 5, 24, 16, 33, 1, 20, 14, 31, 9, 22, 18, 29, 7, 28, 12, 35, 3, 26
# アメリカンスタイル: 0, 28, 9, 26, 30, 11, 7, 20, 32, 17, 5, 22, 34, 15, 3, 24, 36, 13, 1, 00, 27, 10, 25, 29, 12, 8, 19, 31, 18, 6, 21, 33, 16, 4, 23, 35, 14, 2
# 2 ≦ n ≦ 36のそれぞれのnについて、連続するn個の数の和が最大になる場合を求め、ヨーロピアンスタイルでの和がアメリカンスタイルでの和よりも小さくなるnがいくつあるか求めよ。

europeans = [0, 32, 15, 19, 4, 21, 2, 25, 17, 34, 6, 27, 13, 36, 11, 30, 8, 23, 10, 5, 24, 16, 33, 1, 20, 14, 31, 9, 22, 18, 29, 7, 28, 12, 35, 3, 26, 0, 32, 15, 19, 4, 21, 2, 25, 17, 34, 6, 27, 13, 36, 11, 30, 8, 23, 10, 5, 24, 16, 33, 1, 20, 14, 31, 9, 22, 18, 29, 7, 28, 12, 35, 3]
americans = [0, 28, 9, 26, 30, 11, 7, 20, 32, 17, 5, 22, 34, 15, 3, 24, 36, 13, 1, 0, 27, 10, 25, 29, 12, 8, 19, 31, 18, 6, 21, 33, 16, 4, 23, 35, 14, 2, 0, 28, 9, 26, 30, 11, 7, 20, 32, 17, 5, 22, 34, 15, 3, 24, 36, 13, 1, 0, 27, 10, 25, 29, 12, 8, 19, 31, 18, 6, 21, 33, 16, 4, 23, 35, 14]
n = 2
answer = 0
while n <= 36
  max_europeans = 0
  i = 0
  while i <= europeans.size - n
    sum_europeans = europeans[i..i+n-1].sum
    max_europeans = sum_europeans if sum_europeans > max_europeans
    i += 1
  end

  max_americans = 0
  j = 0
  while j <= americans.size - n
    sum_americans = americans[j..j+n-1].sum
    max_americans = sum_americans if sum_americans > max_americans
    j += 1
  end

  if max_europeans < max_americans
    answer += 1
  end

  n += 1
end

p answer


# 模範解答1
europeans = [0, 32, 15, 19, 4, 21, 2, 25, 17, 34, 6, 27, 13, 36, 11, 30, 8, 23, 10, 5, 24, 16, 33, 1, 20, 14, 31, 9, 22, 18, 29, 7, 28, 12, 35, 3, 26]
americans = [0, 28, 9, 26, 30, 11, 7, 20, 32, 17, 5, 22, 34, 15, 3, 24, 36, 13, 1, 0, 27, 10, 25, 29, 12, 8, 19, 31, 18, 6, 21, 33, 16, 4, 23, 35, 14, 2]
def sum_max(roulette, n)
  ans = 0
  roulette.size.times do |i|
    tmp = 0
    if i + n <= roulette.size
      # 配列の両端を跨がない場合
      tmp = roulette[i, n].sum
    else
      # 配列の両端を跨ぐ場合
      tmp = roulette[0, (i + n) % roulette.size].sum + roulette[i..-1].sum
    end
    ans = [ans, tmp].max
  end
  ans
end

cnt = 0
(2..36).each do |i|
  cnt += 1 if sum_max(europeans, i) < sum_max(americans, i)
end
p cnt


# 模範解答2 (高速化)
## 最初の段階で左のn個の合計を計算しておき、1つずつ右にずらすたびに左端の数を減らし、右端の数を増やしていくことで、配列の和を求める工程を減らせる
def sum_max(roulette, n)
  ans = roulette[0, n].sum
  tmp = ans
  roulette.size.times do |i|
    tmp += roulette[(i + n) % roulette.size] - roulette[i]
    ans = [ans, tmp].max
  end
  ans
end

cnt = 0
(2..36).each do |i|
  cnt += 1 if sum_max(europeans, i) < sum_max(americans, i)
end
p cnt