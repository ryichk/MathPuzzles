# 10進数、2進数、8進数のいずれでも回文数であるような数のうち、10進数の10以上で最小値を求める

num = 11
while true do
  if num.to_s == num.to_s.reverse &&
     num.to_s(2) == num.to_s(2).reverse &&
     num.to_s(8) == num.to_s(8).reverse
    p num
    p num.to_s(2)
    p num.to_s(8)
    break
  end
  num += 2
end
