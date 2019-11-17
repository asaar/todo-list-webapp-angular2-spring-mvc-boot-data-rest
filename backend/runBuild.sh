#Set build number
export a=`cat num`
export a=`expr $a + 1`
echo $a > num

java -jar sl-build-scanner.jar -config -appname todo-spring-be -branchname origin/master -buildname `cat num` -pi *com.luke*
java -jar sl-build-scanner.jar -pom -configfile mvn.json -workspacepath . 
cd backend
cp ../sltoken.txt .
cp ../buildSessionId.txt .
mvn clean integration-test