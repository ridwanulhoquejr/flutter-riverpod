# Riverpod: A tour of `Flutter` state management

---

## Why we need Riverpod?

Riverpod is built on top of Provider, which is essentially fulfilled the lackings of Provider.

Lets first understand the problem with Provider:

- **Provider** is entirely based on **InheritedWidget**. in other words, it depends on the widget tree. So, we can't use it outside the widget tree.
- On the other hand **Riverpod** does not depend on the widget tree. We declared it globally and can use it anywhere in the app.
- It is more like a global variable. We can use it anywhere in the app.

- Another benefit of Riverpod i would like to mention is, we can use a riverpod provider inside another riverpod provider. (which is not possible in Provider)

## Riverpod Installation

The first step is to add the latest version of `flutter_riverpod` as a dependency to our `pubspec.yaml` file:

```flutter
dependencies:
  flutter:
    sdk: flutter
  flutter_riverpod: ^2.3.1
```

## ProviderScope

Once Riverpod is installed, we have to wrap our root widget with a ProviderScope:

![ProviderScopre](https://user-images.githubusercontent.com/52696988/224392012-02f3132e-35d5-4ebf-88c9-2be1dbf64bd4.png)

## Riverpod consists of two things:

- **_Provider_**
- **_Consumer_**

### Provider

`Provider` is used to provide/supply the data to the `Consumer` widget. So that, we can show the data in the UI.

#### Different types of Provider:

    1. Provider:
     - This is Read Only, we can't change its value.
     - It is a simple state object

    2. StateProvider:
        - This is almost like `Provider`, but gives us more freedom and ability to change which is lackings in `Provider` .
        - It is a simple state object

    3. FutureProvider
        - This is used to fetch data from the server / API call.

    4. StreamProvider
        - This is used fot continous data fetching like time data which is continous in entire time.

    5. ChnageNotifierProvider [mutable]
        - This is highly discouraged to use in riverpod official doc. (doc link: https://riverpod.dev/docs/concepts/providers)

    6. StateNotifierProvider [immutable]
        - instead of using ChangeNotifierProvider, we can use StateNotifierProvider.
        - still we can change the state, but in a immutable way.

    7. AsyncNotifierProvider [New in Riverpod 2.0]
    8. NotifierProvider [New in Riverpod 2.0]

### Differences between `Provider`, `StateProvider`, `ChnageNotifierProvider` and `StateNotifierProvider`

This Differences are confusing at least for me when i explore those providers in first time. So, i will try to explain what i understood so far.

#### The main difference is the `return type`

- `Provider` and `StateProvider` returns a simple dart data type (int, double, bool, String, List,...)

- Whereas, `ChnageNotifierProvider` and `StateNotifierProvider` returns a `class` and the cluss which returned must have to extend `ChnageNotifier`, `StateNotifier` respectively.
- So in order to use the `Provider` and `StateProvider`, we dont have to write any class. But for the `ChnageNotifierProvider` and `StateNotifierProvider`, you must have to write and extends.

### For example:

- `Provider` and `StateProvider` declaration:

![image](https://user-images.githubusercontent.com/52696988/224529733-06c56d48-7344-4189-861b-0e6692c378db.png)

- `ChangeNotifierProvider` declation and its return class:
  ![image](https://user-images.githubusercontent.com/52696988/224529890-78e69de2-3aad-4695-9b95-63a9d0ad4105.png)

- `StateNotifierProvider` declation and its return class:
  ![image](https://user-images.githubusercontent.com/52696988/224530034-65453d3a-e2ff-4997-8adf-35409ef4e63a.png)

- if we look carefully in above two examples we could see that, in `StateNotifierProvider` we don't have to to call `notifyListener()` everytime we chnage the state. This is the beauty of `StateNotifierProvider`.

### Consumer

`Consumer` will watch/monitoring the provided data and eventually rebuild the whole widget tree/consumed widget only; if any data (i.e. state) is changed.

---

## Creating a simple Riverpod Provider

_a simple provider which returns a int value_

`final counterProvider = Provider<int>((ref) => 10);`

This is made of three things:

- **The declaration:** `final counterProvider` is the global variable that we will use to read the state of the provider.
- **The provider:** Provider<String> tells us what kind of provider we're using (more on this below), and the type of the state it holds.
- **A function that emmits / providing the state**: This gives us a `ref` parameter that we can use to `read other providers`, perform some custom dispose logic, and more.

## What `ref` does?

All Flutter widgets have a BuildContext object that we can use to access things inside the widget tree (such as Theme.of(context)).

Unlike, **Riverpod providers** live outside the widget tree and to read them we need an additional ref object. So, when we have to communicates with providers we have to have a `ref` object which is a type of `WidgetRef`

**long story short:** if we have a `ref` object we can access any riverpod provider throughout our apps.

![provider_consumer](https://user-images.githubusercontent.com/52696988/223823001-220f862f-4f9c-49f2-8812-69ad7146a07d.jpg)

<!-- ## Once we have a provider, how do we use it inside a widget?

All Flutter widgets have a **BuildContext** object that we can use to access things inside the widget tree (such as Theme.of(context)).

But **Riverpod providers live outside the widget tree** and to read them we need an additional ref object. Here are three different ways of obtaining it.

1. Using the ==ConsumerWidget==

   - Instead of extanding the `StateLessWidget`, we have to extends the `ConsumerWidget`.
   - It will gives us an extra parameter `WidgetRef ref` to recieve inside `build` method declaration.
   - So, now our build method will look like this: `Widget build(BuildContext context, WidgetRef ref)` -->
