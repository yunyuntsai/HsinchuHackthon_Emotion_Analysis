int aa = 120;
int bb = 30;
int mode = 0;
//0 nothing
//1 happy
//2 sad

void setup(){
  Serial.begin(115200);
  pinMode(A3, INPUT);
  pinMode(A4, INPUT);
}

void loop(){

  int a = analogRead(A3);
  int b = analogRead(A4);
  //Serial.print("a:");
  //Serial.println(a);
  //Serial.print("b:");
  //Serial.println(b);
  
  mode=3;//nothing
  if(b<30) mode=2;//sad
  if(a<30) mode=1;//happy
  
  //Serial.print("mode:");
  Serial.println(mode);
  
  delay(500);
}
