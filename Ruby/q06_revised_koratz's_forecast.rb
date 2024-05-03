# コラッツの予想(改造版)
# 自然数nが
# ・偶数の場合 nを2で割る
# ・奇数の場合 nに3かけて1を足す
# 初期値が偶数の場合のみ初回だけnに3かけて1を足すから初め、上記操作を繰り返す
# 10,000以下の偶数のうち最初の数に戻る数字の個数を求めよ

n = 10_000
answer = 0
while n > 0
  a = n * 3 + 1
  while true
    if a.even?
      a = a / 2
    else
      a = a * 3 + 1
    end
    if a == n
      answer += 1
      break
    elsif a == 1
      break
    end
  end
  n -= 2
end
p answer


# 模範解答
def is_loop(n)
  check = n * 3 + 1
  while check != 1
    check = check.even? ? check / 2 : check * 3 + 1
    return true if check == n
  end
  return false
end

puts 2.step(10_000, 2).count { |i| is_loop(i) }
