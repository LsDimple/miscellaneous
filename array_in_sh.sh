#/bin/sh
# 在sh中模拟数组有两种方式，一种是使用set命令，通过位置参数进行模拟；另一种是使用eval命令进行模拟
# 
# 将串aaa bbb ccc ddd转换为数组
#
# 使用set命令，之后对‘数组’的所有操作与操作位置参数一样
set aaa bbb ccc
echo $1           # aaa
echo $2           # bbb
echo $3           # ccc
echo $#           # 数组的个数，即位置参数的个数
echo $@           # 数组中所有的元素
echo $*           # 同上
set -- "$@" ddd   # 向数组中添加元素

for v in "$@"   # 遍历数组
do
  echo $v
done

shift [n]     # 可从左向右删除1或n个数组元素
shift $#      # 删除所有元素
set x; shift  # 同上

# 使用eval命令
s="aaa bbb ccc"

idx=0
for i in $s
do
    eval arr$idx=$i
    idx=`expr $idx + 1`
done

i=0
while [ $i -lt $idx ]
do
    eval echo \$arr$i
    i=$((i + 1))
done
