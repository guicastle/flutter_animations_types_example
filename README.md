## A classic problem is to show something in a **smooth and pleasant** way, avoiding that harsh "jump" that happens with `Visibility`.

## ✅ **Best approach**: use `AnimatedSwitcher` or `AnimatedOpacity`

These two are the **most recommended and idiomatic** approaches in Flutter for this kind of situation.

---

## ✅ **Example with `AnimatedSwitcher`** — **most recommended** when toggling between "nothing" and a widget.

```dart
AnimatedSwitcher(
  duration: const Duration(milliseconds: 300),
  transitionBuilder: (child, animation) => FadeTransition(
    opacity: animation,
    child: child,
  ),
  child: controller.attempted
      ? loginState.when(
          data: (_) => const Text('✅ Login successful'),
          loading: () => const SizedBox.shrink(),
          error: (err, _) => const Text('❌ Warning: incorrect username or password.'),
        )
      : const SizedBox.shrink(),  // Empty placeholder to "hide"
),
```

✅ Advantages:

* **Smooth** fade transition.
* **No jump** or sudden layout shift.
* `AnimatedSwitcher` detects widget changes and animates them.

---

## ✅ **Example with `AnimatedOpacity`** — if you always want to reserve fixed space

If you want the message area to **always occupy space** (even when invisible), and only fade in or out smoothly, use `AnimatedOpacity`:

```dart
AnimatedOpacity(
  opacity: controller.attempted ? 1.0 : 0.0,
  duration: const Duration(milliseconds: 300),
  child: loginState.when(
    data: (_) => const Text('✅ Login successful'),
    loading: () => const SizedBox.shrink(),
    error: (err, _) => const Text('❌ Warning: incorrect username or password.'),
  ),
),
```

✅ Advantages:

* Keeps **space reserved**.
* **Smooth** opacity transition.

⚠️ Disadvantage:

* Even when invisible, the widget stays in the layout, occupying space.

---

## ✅ **Which one to choose?**

| Criteria                                                  | Use                |
| --------------------------------------------------------- | ------------------ |
| Want the message space to disappear and reappear smoothly | `AnimatedSwitcher` |
| Want the space to stay fixed, even when invisible         | `AnimatedOpacity`  |

---

## ✅ **Final recommendation**:

Use `AnimatedSwitcher` — it feels more natural for login forms.

---


=======================================================================

## Um problema clássico é mostrar de forma **suave e agradável**, evitando aquele "pulo" bruto que acontece com `Visibility`. (PT)

## ✅ **Melhor abordagem**: usar `AnimatedSwitcher` ou `AnimatedOpacity`

Essas duas são as abordagens **mais recomendadas e idiomáticas** em Flutter para esse tipo de caso.

---

## ✅ **Exemplo com `AnimatedSwitcher`** — **mais recomendado** para mudar entre "nada" e um widget.

```dart
AnimatedSwitcher(
  duration: const Duration(milliseconds: 300),
  transitionBuilder: (child, animation) => FadeTransition(
    opacity: animation,
    child: child,
  ),
  child: controller.attempted
      ? loginState.when(
          data: (_) => const Text('✅ Login bem-sucedido'),
          loading: () => const SizedBox.shrink(),
          error: (err, _) => const Text('❌ Atenção: usuário e senha incorretos.'),
        )
      : const SizedBox.shrink(),  // Placeholder vazio para "sumir"
),
```

✅ Vantagens:

* **Suave** transição de fade.
* **Sem pulo** ou deslocamento brusco.
* `AnimatedSwitcher` detecta mudança de widget e faz a animação.

---

## ✅ **Exemplo com `AnimatedOpacity`** — se você sempre quiser reservar espaço fixo

Se quiser que o espaço para a mensagem **sempre exista** (mesmo que invisível), e só apareça ou suma suavemente, use `AnimatedOpacity`:

```dart
AnimatedOpacity(
  opacity: controller.attempted ? 1.0 : 0.0,
  duration: const Duration(milliseconds: 300),
  child: loginState.when(
    data: (_) => const Text('✅ Login bem-sucedido'),
    loading: () => const SizedBox.shrink(),
    error: (err, _) => const Text('❌ Atenção: usuário e senha incorretos.'),
  ),
),
```

✅ Vantagens:

* Mantém **espaço reservado**.
* Transição **suave** de opacidade.

⚠️ Desvantagem:

* Mesmo invisível, o widget continua no layout, ocupando espaço.

---

## ✅ **Qual escolher?**

| Critério                                                    | Use                |
| ----------------------------------------------------------- | ------------------ |
| Quer que o espaço da mensagem desapareça e volte suavemente | `AnimatedSwitcher` |
| Quer que o espaço fique fixo, mesmo quando invisível        | `AnimatedOpacity`  |

---

## ✅ **Recomendação final**:

Prefiro usar o `AnimatedSwitcher` — fica mais natural em formulários de login.

---

