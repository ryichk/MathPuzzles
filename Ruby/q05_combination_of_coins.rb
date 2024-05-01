# 10円玉、50円玉、100円玉、500円玉の硬貨に両替できる機会がある。
# 1,000円札を入れた時に出てくる硬貨の組み合わせは何通りあるか求めよ。(硬貨の順番は区別しない。最大で15枚)

# 数学で考えたら: 10x + 50y + 100z + 500w = 1000
# 500円玉の枚数は0~2枚
# 100円玉の枚数は0~10枚
# 50円玉の枚数は0~15枚
# 10円玉の枚数は0~15枚

cash_1000 = 1000
coin_10 = 10
count_10 = 15
coin_50 = 50
count_50 = 15
coin_100 = 100
count_100 = 10
coin_500 = 500
count_500 = 2
answer = 0

while count_10 >= 0
  while count_50 >= 0
    while count_100 >= 0
      while count_500 >= 0
        if cash_1000 == coin_10 * count_10 + coin_50 * count_50 + coin_100 * count_100 + coin_500 * count_500 &&
           count_10 + count_50 + count_100 + count_500 <= 15
             answer += 1
        end
        count_500 -= 1
      end
      count_100 -= 1
      count_500 = 2
    end
    count_50 -= 1
    count_100 = 10
  end
  count_10 -= 1
  count_50 = 15
end
p answer

# 拡張性を考慮した場合
coins = [10, 50, 100, 500]
answer = 0
(2..15).each do |i|
  coins.repeated_combination(i).each do |coin_set|
    answer += 1 if coin_set.inject(:+) == 1000
  end
end
p answer

# 再帰処理を使った場合
@answer = 0
def exchange(cash, coins, max_count)
  coin = coins.shift
  if coins.size == 0
    @answer += 1 if cash / coin <= max_count
  else
    (0..cash/coin).each do |i|
      exchange(cash - coin * i, coins.dup, max_count - i)
    end
  end
end
exchange(1000, [500, 100, 50, 10], 15)
p @answer
