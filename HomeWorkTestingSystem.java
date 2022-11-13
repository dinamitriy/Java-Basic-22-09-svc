import java.util.Scanner;

public class HomeWorkTestingSystem {
    public static void main(String[] args) {
        int correctCount = 0, wrongCount = 0;
        String[] questions = new String[3];
        questions[0] = "В файл с каким расширением компилируется java-файл?";
        questions[1] = "Как называется операция для выделения памяти под элементы массива?";
        questions[2] = "Какой применяется цикл, когда не известно количество итераций?";
        String[][] answerOptions = {
                {"*.class", "*.java", "*.exe", "*.com"},
                {"add",     "clone",  "new",   "insert"},
                {"while",   "for",    "loop"}
        };
        int[] correctAnswers = new int[3];
        correctAnswers[0] = 1;
        correctAnswers[1] = 3;
        correctAnswers[2] = 1;
        Scanner scanner = new Scanner(System.in);
        for (int i = 0; i < questions.length; i++) {
            System.out.println(questions[i]);
            for (int j = 0; j < answerOptions[i].length; j++) {
                System.out.println((j + 1) + ". " + answerOptions[i][j]);
            }
            System.out.print("Ваш ответ: ");
            int answerForQuestion0 = 0;
            while (scanner.hasNext()) {
                if (scanner.hasNextInt()) {
                    answerForQuestion0 = scanner.nextInt();
                   if (answerForQuestion0 <= 0 || answerForQuestion0 > answerOptions[i].length) {
                       System.out.println("Введено число вне диапазона");
                       System.out.print("Ваш ответ: ");
                   } else {break;}
                } else {
                    System.out.println("Введено не число");
                    System.out.print("Ваш ответ: ");
                    scanner.next();
                }
            }
            if (answerForQuestion0 == correctAnswers[i]) {
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