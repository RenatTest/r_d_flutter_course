# Завдання: Декодування складного JSON

## 📚 Опис попереднього уроку

На лекції ми реалізували декодування маленького JSON-файлу.

Для цього ми зробили:

1. Декодували JSON у `Map<String, dynamic>`
2. Створили клас `PersonDto`
3. Конвертували `Map<String, dynamic>` у `PersonDto`
4. Створили `PersonEntity`
5. Конвертували `PersonDto` у `PersonEntity`

## 📝 Що треба зробити у цій роботі

Вам потрібно виконати ті самі кроки, але для більш складного JSON.

**Файл із JSON знаходиться за шляхом:**
```
flutter_lab/lib/features/rest_api/json_examples/silpo_cheque_example.json
```

## 📌 Вимоги

### 1. Створення DTO

- Клас DTO має містити всі поля, які є у вихідному JSON

### 2. Створення Entity

Клас Entity повинен містити лише такі поля:

- `int chequeId` — Номер чеку (`chequeId` у DTO)
- `double totalAmount` — Вартість (`sumReg` у DTO)
- `List<String> items` — Список назв (`lagerNameUA` з кожного елемента масиву `chequeLines` у DTO)
- `String prediction` — Передбачення (`chPrediction` у DTO)

## 🔄 Заміна логіки

Після створення класів:

1. У файлі `flutter_lab/lib/features/rest_api/encode_decode/encode_decode.dart`
2. Виведіть усі поля Entity в UI за аналогією з `PersonEntity`