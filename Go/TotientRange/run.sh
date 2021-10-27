echo "-----------------Starting DS1---------------------"

echo "DS1, 1 thread"
for i in {0..2}; do go run TotientRange.go 1 15000 1; done
echo " "

echo "DS1, 2 threads"
for i in {0..2}; do go run TotientRange.go 1 15000 2; done
echo " "

echo "DS1, 4 threads"
for i in {0..2}; do go run TotientRange.go 1 15000 4; done
echo " "

echo "DS1, 8 threads"
for i in {0..2}; do go run TotientRange.go 1 15000 8; done
echo " "

echo "DS1, 16 threads"
for i in {0..2}; do go run TotientRange.go 1 15000 16; done
echo " "

echo "DS1, 32 threads"
for i in {0..2}; do go run TotientRange.go 1 15000 32; done
echo " "

echo "DS1, 48 threads"
for i in {0..2}; do go run TotientRange.go 1 15000 48; done
echo " "

echo "DS1, 64 threads"
for i in {0..2}; do go run TotientRange.go 1 15000 64; done

echo "-----------------Starting DS2---------------------"

echo " "
echo "DS2, 1 threads"
for i in {0..2}; do go run TotientRange.go 1 30000 1; done
echo " "

echo "DS2, 2 threads"
for i in {0..2}; do go run TotientRange.go 1 30000 2; done
echo " "

echo "DS2, 4 threads"
for i in {0..2}; do go run TotientRange.go 1 30000 4; done
echo " "

echo "DS2, 8 threads"
for i in {0..2}; do go run TotientRange.go 1 30000 8; done
echo " "

echo "DS2, 16 threads"
for i in {0..2}; do go run TotientRange.go 1 30000 16; done
echo " "

echo "DS2, 32 threads"
for i in {0..2}; do go run TotientRange.go 1 30000 32; done
echo " "

echo "DS2, 48 threads"
for i in {0..2}; do go run TotientRange.go 1 30000 48; done
echo " "

echo "DS2, 64 threads"
for i in {0..2}; do go run TotientRange.go 1 30000 64; done

echo "-----------------Starting DS3---------------------"

echo " "
echo "DS3, 8 threads"
for i in {0..2}; do go run TotientRange.go 1 60000 8; done
echo " "

echo "DS3, 16 threads"
for i in {0..2}; do go run TotientRange.go 1 60000 16; done
echo " "

echo "DS3, 32 threads"
for i in {0..2}; do go run TotientRange.go 1 60000 32; done
echo " "

echo "DS3, 48 threads"
for i in {0..2}; do go run TotientRange.go 1 60000 48; done
echo " "

echo "DS3, 64 threads"
for i in {0..2}; do go run TotientRange.go 1 60000 64; done