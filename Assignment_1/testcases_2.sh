cur_date1=$(date '+%d/%m/%Y' -d "+1 day -22 year")
cur_date2=$(date '+%d/%m/%Y' -d "-1 day -22 year")
cur_date3=$(date '+%d/%m/%Y' -d "-22 year")
cur_date4=$(date '+%d/%m/%Y' -d "+1 day -22 year")

mkdir testcases

echo "iris west allen "$cur_date1 > testcases/in1
echo "iris "$cur_date2 > testcases/in2
echo "iris "$cur_date3 > testcases/in3
echo "iris "$cur_date4 > testcases/in4

echo "iris west allen "21 > testcases/out1
echo "iris "22 > testcases/out2
echo "iris "22 > testcases/out3
echo "iris "21 > testcases/out4