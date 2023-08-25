abstract class Account {
  int accountNumber;
  double balance;
  Account(this.accountNumber, this.balance);
  deposit(double amount) {
    balance += amount;
    print('$amount deposited. New balance: $balance');
  }

  void withdraw(double amount);
}

class SavingsAccount extends Account {
  double interestRate;
  SavingsAccount(int accountNumber, double balance, this.interestRate)
      : super(accountNumber, balance);
  @override
  void withdraw(amount) {
    if (amount <= balance) {
      balance -= amount;
      balance += balance * interestRate;
      print('$amount withdrawn. New balance: $balance');
    } else {
      print('Insufficient funds');
    }
  }
}

class CurrentAccount extends Account {
  double overdraftLimit;
  CurrentAccount(int accountNumber, double balance, this.overdraftLimit)
      : super(accountNumber, balance);

  @override
  void withdraw(double amount) {
    if (amount <= balance + overdraftLimit) {
      balance -= amount;
      print('$amount withdrawn. New balance: $balance');
    } else {
      print('Insufficient funds');
    }
  }
}