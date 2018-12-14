import java.util.*;
import java.io.File;
int num1,num2;
File Senttest;
String Sent;
String [] splitSent;
String [] splitSent2;

void setup() {
  //size(750, 750);
  noStroke();
  smooth();
  cursor(WAIT);
  frameRate(15);
  //copy from Dr. R.
  Senttest = new File("C:\\Users\\lilga\\Documents\\Processing\\sketch_181205a\\data\\StringP");
  Sent = Senttest.toString();
  splitSent=Sent.split("[\\,!.\\s]+");
  splitSent2=Sent.split("[\\?!.]+");

  StringParser sp=new StringParser();
  println("words " + sp.countWords(splitSent));
  println("vowels " + sp.countVowels(Sent));
  println("syllables " + sp.countSyllables(splitSent));
  println("sentences " + sp.countSentences(splitSent2));
  println("readablity " + sp.countSentences(splitSent,splitSent2));
  println(Sent);
}
void draw() {
  background(0);
  textSize(20);
  color(255);
  StringParser sp=new StringParser();
  text(Sent, 20, 20);
  text("words " + sp.countWords(splitSent), 20, 40);
  text("vowels " + sp.countVowels(Sent), 20, 60);
  text("syllables " + sp.countSyllables(splitSent), 20, 80);
  text("sentences " + sp.countSentences(splitSent2), 20, 100);
}
public class StringParser {

  public StringParser() {
  }
  public int countWords(String [] splitSent) {
    return splitSent.length;
  }
  public int countVowels(String Sent) {
    char c;
    int count = 0;

    for (int i = 0; i<=Sent.length()-1; i ++) {
      c=Sent.charAt(i);
      if (c == 'a' || c == 'e' || c == 'i' ||c == 'o' || c == 'u' || c == 'y') {
        count++;
      }
    }
    return count;
  }


  public int countSyllables(String [] splitSent) {
    int count = 0;
    for (int i = 0; i < splitSent.length; i++ ) {
      for (int j = 1; j < splitSent[i].length(); j++ ) {
        if (isVowel(splitSent[i].charAt(j))) {
          if (isVowel(splitSent[i].charAt(j-1))==false) {
            count=count+1;
          }
        }
      }
    }

    return count;
  }
  public boolean isVowel(char c) {
    if (c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u') {
      return true;
    } else {
      return false;
    }
  }

  public int countSentences(String [] splitSent) {
    return splitSent.length;
  }

  public float countSentences(String [] splitSent,String [] splitSent2) {
    num1=countWords(splitSent)/splitSent.length;
    num2=countSyllables(splitSent)/countSentences(splitSent2);
    return 206.835-1.015*num1-84.6*num2;
  }
}


