import java.util.Scanner;
class Main {
  public static void main(String[] args) {
    Scanner scan = new Scanner(System.in);
    System.out.println("Enter a word: ");
    String word = scan.nextLine();
    String firstLetter = word.substring(0,1);
    String lastPart = word.substring(1);
    String result = lastPart + firstLetter + "ay";
    System.out.println(result);
  }
}
