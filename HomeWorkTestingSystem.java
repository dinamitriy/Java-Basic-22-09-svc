import java.util.Scanner;

public class HomeWorkTestingSystem {
    public static void main(String[] args) {
        int correctCount = 0, wrongCount = 0;
        String[] questions = new String[3];
        questions[0] = "В файл с каким расширением компилируется java-файл?";
        questions[1] = "Как называется операция для выделения памяти под элементы массива?";
        questions[2] = "Какой применяется цикл, когда не известно количество итераций?";
        String[][] answerOptions = {
                {"1. *.class", "2. *.java", "3. *.exe", "4. *.com"},
                {"1. add", "2. clone", "3. new", "4. insert"},
                {"1. while", "2. for", "3. loop"}
        };
        int[] correctAnswers = new int[3];
        correctAnswers[0] = 1;
        correctAnswers[1] = 3;
        correctAnswers[2] = 1;
        Scanner scanner = new Scanner(System.in);
        for(int i = 0; i < 1; i++) {
            System.out.println(questions[0]);
            System.out.println(answerOptions[0][0]);
            System.out.println(answerOptions[0][1]);
            System.out.println(answerOptions[0][2]);
            System.out.println(answerOptions[0][3]);
            System.out.print("Ваш ответ: ");
            int answerForQuestion0 = scanner.nextInt();
            if (answerForQuestion0 == correctAnswers[0]) {
                System.out.println("Правильно");
                correctCount ++;
            } else {
                System.out.println("Неправильно");
                wrongCount ++;
            }
            System.out.println(questions[1]);
            System.out.println(answerOptions[1][0]);
            System.out.println(answerOptions[1][1]);
            System.out.println(answerOptions[1][2]);
            System.out.println(answerOptions[1][3]);
            System.out.print("Ваш ответ: ");
            int answerForQuestion1 = scanner.nextInt();
            if (answerForQuestion1 == correctAnswers[1]) {
                System.out.println("Правильно");
                correctCount ++;
            } else {
                System.out.println("Неправильно");
                wrongCount ++;
            }
            System.out.println(questions[2]);
            System.out.println(answerOptions[2][0]);
            System.out.println(answerOptions[2][1]);
            System.out.println(answerOptions[2][2]);
            System.out.print("Ваш ответ: ");
            int answerForQuestion2 = scanner.nextInt();
            if (answerForQuestion2 == correctAnswers[2]) {
                System.out.println("Правильно");
                correctCount ++;
            } else {
                System.out.println("Неправильно");
                wrongCount ++;
            }
        }
        System.out.println("Результат: правильно " + correctCount + ", неправильно " + wrongCount);
    }
}