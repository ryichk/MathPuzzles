# 同じ場所を通らない掃除ロボットを考える。
# このロボットは前後左右にのみ移動できる。
# このロボットが12回移動する時、移動経路がパターンあるか求めよ。

N = 12

def move(log)
  return 1 if log.size == N + 1

  count = 0
  [[0, 1], [0, -1], [1, 0], [-1, 0]].each do |d|
    next_position = [log[-1][0] + d[0], log[-1][1] + d[1]]
    if !log.include?(next_position)
      count += move(log + [next_position])
    end
  end
  count
end

p move([[0, 0]])
