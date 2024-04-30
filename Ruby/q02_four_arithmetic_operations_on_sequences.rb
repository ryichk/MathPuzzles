# 並んでいる数字の各桁の間に四則演算の演算子を入れて計算し、計算結果が元の数の桁を逆から並べた数と同じになる数を求める。
# 演算子を入れない場所があっても良いが最低でも１つは演算子を入れる。
# 1,000 ≦ X ≦ 9,999
# 351 -> 3 x 51 = 153
# 621 -> 6 x 21 = 126
# 886 -> 8 x 86 = 688

opes = ['+', '-', '/', '*', '']
# 演算子として * 以外を一度でも使うと4桁の数字にならないので、opes = ['*', '']で良い。
x = 1_000
while x < 10_000
  x_str = x.to_s
  x_arr = x_str.split('')
  i = 0
  catch(:break_loop) do
    while i < opes.length
      j = 0
      while j < opes.length
        k = 0
        while k < opes.length
          x_arr_copy = x_arr.dup
          if x_arr_copy[1].to_i > 0
            x_arr_copy.insert(1, opes[i])
            if x_arr_copy[3].to_i > 0
              x_arr_copy.insert(3, opes[j])
              if x_arr_copy[5].to_i > 0
                x_arr_copy.insert(5, opes[k])
              end
            end
          end
          if x_arr_copy.join.length > 4
            r = eval(x_arr_copy.join)
            if x_str == r.to_s.reverse
              p x
              throw :break_loop
            end
          end
          k += 1
        end
        j += 1
      end
      i += 1
    end
  end
  x += 1
end
