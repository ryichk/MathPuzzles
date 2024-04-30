# 長さNcmの棒を1cm単位に切り分ける。
# 1本の棒を一度に切れるのは1人。（切り分けられた棒が3本あれば同時に切れるのは3人）
# 最大M人いる時、最短何回で切り分けられるか？

def count_cutting_sticks(n, m, x = 1) # xは棒の数
  if x >= n
    0
  elsif x < m
    1 + count_cutting_sticks(n, m, x * 2)
  else
    1 + count_cutting_sticks(n, m, x + m)
  end
end

# 問1: N=20, M=3の時
n = 20
m = 3
p count_cutting_sticks(n, m)

# 問2: N=100, M=5の時
n = 100
m = 5
p count_cutting_sticks(n, m)
