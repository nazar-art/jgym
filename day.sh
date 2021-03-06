# first parameter is the day number (e.g. 14), second parameter are any additional JVM parameters
if [ -z $1 ]; then echo "day number is unset"; exit; fi
if [ -n $2 ]; then echo "additional JVM parameters: $2"; fi

echo Building for day $1
git pull
rm -f out/production/jgym/io/jgym/warmups/day$1/*.class
cd src/main/java
javac -d ../../../out/production/jgym io/jgym/warmups/day$1/*.java
cd ../../../

RUNCLASS=`grep -l "public static void main" src/main/java/io/jgym/warmups/day$1/*.java | sed -e 's/.*\/\(.*\)\.java/\1/'`
echo Executing io/jgym/warmups/day$1/$RUNCLASS
java -showversion $2 -cp out/production/jgym io/jgym/warmups/day$1/$RUNCLASS
