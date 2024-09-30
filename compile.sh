if [ -z "$1" ];then
	echo "Usage: $0 <source_file>"
	exit 1
fi

SOURCE_FILE=$1
EXT="${SOURCE_FILE##*.}"
BASENAME=$(basename "$SOURCE_FILE" ."$EXT")


if [ "$EXT" == 'cpp' ]; then
	COMPILER="g++"
	
elif [ "$EXT" == 'c'];then
	COMPILER="gcc"
else
	echo "Unsupported file extension: $EXT"
	exit 1
fi

OUTPUT_FILE="${BASENAME}_${EXT}.out"

#编译源文件
echo "Compiling $SOURCE_FILE..."
$COMPILER -o $OUTPUT_FILE $SOURCE_FILE

if [ $? -eq 0 ]; then
    echo "Compilation successful!"

    # 运行可执行文件
    ./$OUTPUT_FILE
    echo "Program exited with code $?"
else
    echo "Compilation failed!"
    exit 1
fi

