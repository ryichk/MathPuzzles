# フィボナッチ数列のうち、各桁の数字を足した数で割り切れる数を、以下の例に続けて小さい方から5個求めよ
# 2 -> 2 / 2
# 3 -> 3 / 3
# 5 -> 5 / 5
# 8 -> 8/ 8
# 21 -> 21 / 3 ...(2+1=3)
# 144 -> 144 / 9 ...(1+4+4=9)

n = 1
m = 0
count = 0
while
  l = n
  n = n + m
  m = l
  if n > 144 && n % n.to_s.chars.map(&:to_i).sum == 0
    p n
    count += 1
  end
  break if count == 5
end