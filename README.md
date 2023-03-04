# Riverpod: A tour of Riverpod

---

## Riverpod consists of two things:

- **_Provider_**
- **_Consumer_**

### Provider

`Provider` is used to provide/supply the data to the `Consumer` widget. So that, we can show the data in the UI.

#### Different types of Provider:

    1. Provider:
     - This is Read Only, we can't change its value.
    2. StateProvider
    3. FutureProvider
    4. StreamProvider
    5. ChnageNotifierProvider [mutable]
    6. StateNotifierProvider [immutable]
    7. AsyncNotifierProvider [Riverpod 2.0]
    8. NotifierProvider [Riverpod 2.0]

### Consumer

- Consumer will watch/monitoring the provided data and eventually rebuild the whole widget tree/consumed widget only; if any data (i.e. state) is changed.

---

---

## Creating a Riverpod Provider

_a simple provider which returns a string value_

`final stringProvider = Provider<int>((ref) => 10);`

This is made of three things:

**The declaration:** final helloWorldProvider is the global variable that we will use to read the state of the provider
**The provider:** Provider<String> tells us what kind of provider we're using (more on this below), and the type of the state it holds.
**A function that creates the state**: This gives us a ref parameter that we can use to read other providers, perform some custom dispose logic, and more.

## Once we have a provider, how do we use it inside a widget?

All Flutter widgets have a **BuildContext** object that we can use to access things inside the widget tree (such as Theme.of(context)).

But **Riverpod providers live outside the widget tree** and to read them we need an additional ref object. Here are three different ways of obtaining it.

1. Using the ==ConsumerWidget==

   - Instead of extanding the `StateLessWidget`, we have to extends the `ConsumerWidget`.
   - It will gives us an extra parameter `WidgetRef ref` to recieve inside `build` method declaration.
   - So, now our build method will look like this: `Widget build(BuildContext context, WidgetRef ref)`
