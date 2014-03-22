import java.io.BufferedWriter;
import java.io.FileWriter;
String outFilename="out.csv";
PImage img;
color temp;
int m,i;
PrintWriter output;
void setup() 
{
 appendTextToFile(outFilename,"No ");
 appendTextToFile(outFilename,",File Name ");
 appendTextToFile(outFilename,",Status ");
 appendTextToFile(outFilename,",Serial No. ");
 for(i=1;i<=25;i++)
 {
   appendTextToFile(outFilename,",A "+i);
 }
 for(i=1;i<=25;i++)
 {
   appendTextToFile(outFilename,",B "+i);
 }
  for(m=1;m<=50;m++){
  size(100,100);
  String dup;
  if(m<10)
    dup="C:\\Users\\SHUB\\Desktop\\sketch_140308a\\data\\Good\\scan000";
  else
    dup="C:\\Users\\SHUB\\Desktop\\sketch_140308a\\data\\Good\\scan00";  
  String imgURL=dup+m+".jpg";
  
  img=loadImage(imgURL,"jpeg");
  
  int j,k,n,y,count;
  char a;
  float mean;
  

 appendTextToFile(outFilename,"\n");
 //////////------------------------------------------------SECTION--1-----
  j=223;
  int dec=0;//count will help if there are 2 no. of ans are marked
  
  for(i=15;i>=0;i--)
  {
    mean=0.0;
    n=j;
    
    for(;j<=n+44;j++)
    {
      temp=img.get(j,348);
      mean+=((temp>>16)& 0xFF)/45; 
    }
    if((int)mean<135)
    dec+=pow(2,i);
   else
     dec+=0;
  }
 appendTextToFile(outFilename,m + ",");
 appendTextToFile(outFilename,"scan" +m+ ","); 
 appendTextToFile(outFilename,"OK,");
 //text("unique code for sheet is: " + dec,100,500);
 appendTextToFile(outFilename,dec + ",");

  y=551;  
for(i=1;i<=25;i++)
{
  k=367;
  count=0;
  for(j=1;j<=5;j++)
  {
    mean=0.0;
    n=k;
    for(;k<=n+45;k++)
    {
        temp=img.get(k,y);
        mean+=((temp>>16)& 0xFF)/46;
    }
    if((int)mean<180)
    {
      a=(char)(64+j);
      count=1;
      //answers[i]=a;
      /////--------------
      //text(i + " :- option is " + a,100,i*10);
      appendTextToFile(outFilename, a + ",");
    }
    
  }
  if(count==0)
      appendTextToFile(outFilename, "none ,");
  y+=60;
}
//////////------------------------------------------------SECTION--2-----

y=551;  
for(i=1;i<=25;i++)
{
  count=0;
  k=1084;
  for(j=1;j<=5;j++)
  {
    mean=0.0;
    n=k;
    for(;k<=n+45;k++)
    {
        temp=img.get(k,y);
        mean+=((temp>>16)& 0xFF)/46;
    }
    if((int)mean<180)
    {
      a=(char)(64+j);
      count=1;
      appendTextToFile(outFilename,a +",");
    }
  }
  if(count==0)
      appendTextToFile(outFilename, "none ,");
  y+=59;
  
}
}
}

void appendTextToFile(String filename, String text)
{
  File f = new File(dataPath(filename));
  if(!f.exists()){
  createFile(f);
  }
  try{
  PrintWriter out = new PrintWriter(new BufferedWriter(new FileWriter(f, true)));
  out.print(text);
  out.close();
  }catch (IOException e){
  e.printStackTrace();
  }
}

void createFile(File f){

File parentDir = f.getParentFile();
try{
parentDir.mkdirs();
f.createNewFile();
}catch(Exception e){
e.printStackTrace();
}
}
