# イベント会場に到着した男女が1列で並んでおり、主催者が2つのグループに分ける。
# 男性20人、女性10人が到着した場合、どこで区切ってもグループ内の男性の数と女性の数が同じにならない到着順は何通りあるか？

# 模範解答
boy, girl = 20, 10
# 0人から数えるから+1
boy, girl = boy + 1, girl + 1
array = Array.new(boy * girl) { 0 }
array[0] = 1
girl.times do |g|
  boy.times do |b|
    if (b != g) && (boy - b != girl - g)
      array[b + boy * g] += array[b - 1 + boy * g] if b > 0
      array[b + boy * g] += array[b + boy * (g - 1)] if g > 0
    end
  end
end

p array[-2] + array[-boy - 1]

# 2次元配列を使用したVer
## 2次元配列の作成
array = Array.new(girl)
g = 0
while g < girl
  array[g] = Array.new(boy)
  b = 0
  while b < boy
    array[g][b] = 0
    b += 1
  end
  g += 1
end
## 経路の計算
array[0][0] = 1
g = 0
while g < girl
  b = 0
  while b < boy
    if (g != b) && (boy - b != girl - g)
      array[g][b] += array[g][b - 1] if b > 0
      array[g][b] += array[g - 1][b] if g > 0
    end
    b += 1
  end
  g += 1
end

p array[girl - 2][boy - 1] + array[girl - 1][boy - 2]
