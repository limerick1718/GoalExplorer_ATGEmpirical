echo "IC3"
echo "Processing dex file."

apk_path=$1
android_sdk=$2
result_dir=$3/goal_explorer
working_dir=$(pwd)

apkname=$(basename $apk_path)

apk_path=$(realpath $apk_path)
android_sdk=$(realpath $android_sdk)
if [ ! -d "$result_dir" ]; then
	mkdir -p "$result_dir"
fi
result_dir=$(realpath $result_dir)
echo "Result dir: $result_dir"

echo "APK path: $apk_path"
echo "JRE path: $android_sdk"
echo "Apk Name: $apkname"
echo "Working dir: $working_dir"

tool_dir=$(dirname "$(readlink -f "$0")")
echo "tool dir: $tool_dir"
cd $tool_dir

START=$(date +%s)
java -jar GoalExplorer-1.2-SNAPSHOT-jar-with-dependencies.jar ge -i $apk_path -s $android_sdk -o $result_dir > $result_dir/goal_explorer.log
END=$(date +%s)
DIFF=$(( $END - $START ))
echo "Processed in $DIFF seconds."  >> $result_dir/goal_explorer.log