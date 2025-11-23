
echo "console on 3270, web on 8038."
echo "admin: HERC01 , CUL8TR"
echo " user: HERC02 , CUL8TR"
echo "container will run without --rm, remove it manually"

docker run -it \
    --name hercules \
    -p 3270:3270 \
    -p 8038:8038 \
    skunklabs/tk5-hercules

