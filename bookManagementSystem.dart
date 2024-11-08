import 'dart:ffi';
import 'dart:io';

class Book {
  String title;
  String author;
  String isbn;
  BookStatus status = BookStatus.Available;
  Book(this.title, this.author, this.isbn) {}

  String get getTitle => title;
  set setTitle(String title) => this.title = title;

  String get getAuthor => author;
  set setAuthor(String author) => this.author = author;

  String get getIsbn => isbn;
  set setIsbn(String isbn) => this.isbn = isbn;

  BookStatus get getStatus => status;
  set setStatus(BookStatus status) => this.status = status;

  bool isValidIsbn(String isbn) {
    return isbn.length == 13;
  }

  void updateStatus(BookStatus newStatus) {
    status = newStatus;
  }
}

class TextBook extends Book {
  String subject;
  String grade;
  TextBook(String title, String author, String isbn, this.subject, this.grade)
      : super(title, author, isbn);

  String get getSubject => subject;
  set setSubject(String subject) => this.subject = subject;

  String get getGrade => grade;
  set setGrade(String grade) => this.grade = grade;
}

enum BookStatus { Available, Borrowed }

class OperationClass {
  List<Book> book = [];
  bool addABook() {
    return true;
  }

  bool updateBook() {
    return true;
  }

  bool deleteBook() {
    return true;
  }

  bool searchBook() {
    return true;
  }
}

class ConsolePrints {
  void welcomeScreen() {
    print("\n");
    print(
        """▄▄▌   ▄· ▄▌▄▄▄▄· ▄▄▄   ▄▄▄· ▄▄▄   ▄· ▄▌  • ▌ ▄ ·.  ▄▄▄·  ▐ ▄  ▄▄▄·  ▄▄ • ▄▄▄ .• ▌ ▄ ·. ▄▄▄ . ▐ ▄ ▄▄▄▄▄  .▄▄ ·  ▄· ▄▌.▄▄ · ▄▄▄▄▄▄▄▄ .• ▌ ▄ ·. 
██•  ▐█▪██▌▐█ ▀█▪▀▄ █·▐█ ▀█ ▀▄ █·▐█▪██▌  ·██ ▐███▪▐█ ▀█ •█▌▐█▐█ ▀█ ▐█ ▀ ▪▀▄.▀··██ ▐███▪▀▄.▀·•█▌▐█•██    ▐█ ▀. ▐█▪██▌▐█ ▀. •██  ▀▄.▀··██ ▐███▪
██ ▪ ▐█▌▐█▪▐█▀▀█▄▐▀▀▄ ▄█▀▀█ ▐▀▀▄ ▐█▌▐█▪  ▐█ ▌▐▌▐█·▄█▀▀█ ▐█▐▐▌▄█▀▀█ ▄█ ▀█▄▐▀▀▪▄▐█ ▌▐▌▐█·▐▀▀▪▄▐█▐▐▌ ▐█.▪  ▄▀▀▀█▄▐█▌▐█▪▄▀▀▀█▄ ▐█.▪▐▀▀▪▄▐█ ▌▐▌▐█·
▐█▌ ▄ ▐█▀·.██▄▪▐█▐█•█▌▐█▪ ▐▌▐█•█▌ ▐█▀·.  ██ ██▌▐█▌▐█▪ ▐▌██▐█▌▐█▪ ▐▌▐█▄▪▐█▐█▄▄▌██ ██▌▐█▌▐█▄▄▌██▐█▌ ▐█▌·  ▐█▄▪▐█ ▐█▀·.▐█▄▪▐█ ▐█▌·▐█▄▄▌██ ██▌▐█▌
.▀▀▀   ▀ • ·▀▀▀▀ .▀  ▀ ▀  ▀ .▀  ▀  ▀ •   ▀▀  █▪▀▀▀ ▀  ▀ ▀▀ █▪ ▀  ▀ ·▀▀▀▀  ▀▀▀ ▀▀  █▪▀▀▀ ▀▀▀ ▀▀ █▪ ▀▀▀    ▀▀▀▀   ▀ •  ▀▀▀▀  ▀▀▀  ▀▀▀ ▀▀  █▪▀▀▀
""");
  }

  String menu(){
     print("\n\n");
  print("Dashboard :- ");
  print("1) Add a Book");
  print("2) Update a Book");
  print("3) Delete a Book");
  print("4) Search a Book");
  print("5) Exit");
  print("/n/n");
  print("Enter Your Option No :-");
  String ? choice = stdin.readLineSync();
  return choice.toString();
  }
}

void main() {
  new ConsolePrints().welcomeScreen();
  String? choice=null;
  
  
  OperationClass operationClass = new OperationClass();
  bool isContinuing = true;
  while (isContinuing == true) {
    choice= ConsolePrints().menu();
    switch (choice) {
      case "1":
        isContinuing = operationClass.addABook();
        break;
      case "2":
        operationClass.updateBook();
        break;
      case "3":
        operationClass.deleteBook();
        break;
      case "4":
        operationClass.searchBook();
        break;
      case "5":
        isContinuing = false;
        break;
      default:
        print("Invalid Option");
    }
  }
}
