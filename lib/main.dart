// Projeto Flutter: Demonstração do problema clássico com Visibility e como resolver

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: VisibilityExamplePage()));
}

class VisibilityExamplePage extends StatefulWidget {
  const VisibilityExamplePage({Key? key}) : super(key: key);

  @override
  State<VisibilityExamplePage> createState() => _VisibilityExamplePageState();
}

class _VisibilityExamplePageState extends State<VisibilityExamplePage> {
  bool attempted = false;
  bool isSuccess = false;

  void attemptLogin() {
    setState(() {
      attempted = true;
      isSuccess = !isSuccess; // alterna entre sucesso e erro
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Demo Visibility vs Animated')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: attemptLogin,
              child: const Text('Start Animation'),
            ),

            const SizedBox(height: 20),

            // EXEMPLO COM VISIBILITY (abrupto)
            const Text('Exemplo com Visibility:'),
            Visibility(
              visible: attempted,
              child: Text(
                isSuccess
                    ? '✅ Login bem-sucedido'
                    : '❌ Atenção: usuário e senha incorretos.',
              ),
            ),

            const SizedBox(height: 40),

            // EXEMPLO COM AnimatedSwitcher (suave)
            const Text('Exemplo com AnimatedSwitcher:'),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder:
                  (child, animation) =>
                      FadeTransition(opacity: animation, child: child),
              child:
                  attempted
                      ? Text(
                        isSuccess
                            ? '✅ Login bem-sucedido'
                            : '❌ Atenção: usuário e senha incorretos.',
                        key: ValueKey(isSuccess),
                      )
                      : const SizedBox.shrink(),
            ),

            const SizedBox(height: 40),

            // EXEMPLO COM AnimatedOpacity (suave, mas mantém espaço)
            const Text('Exemplo com AnimatedOpacity:'),
            AnimatedOpacity(
              opacity: attempted ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 300),
              child: Text(
                isSuccess
                    ? '✅ Login bem-sucedido'
                    : '❌ Atenção: usuário e senha incorretos.',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
Resumo das diferenças:

1. Visibility:
   - ✅ Mantém performance.
   - ❌ Transição abrupta.
   - ✅ Controla presença no layout.

2. AnimatedSwitcher:
   - ✅ Transição suave.
   - ✅ Remove do layout quando invisível.
   - ⚠️ Requer cuidado com key para diferenciar estados.

3. AnimatedOpacity:
   - ✅ Transição suave.
   - ❌ Mantém espaço no layout mesmo invisível.
   - ✅ Simples de usar para fade.
*/
