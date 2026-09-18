
import 'package:flutter/material.dart';

void main() {
  runApp(const MockupApp());
}

class MockupApp extends StatelessWidget {
  const MockupApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Даттебайо',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'sans',
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF5B61F4)),
      ),
      home: const MockupHome(),
    );
  }
}

class MockupHome extends StatefulWidget {
  const MockupHome({super.key});

  @override
  State<MockupHome> createState() => _MockupHomeState();
}

class _MockupHomeState extends State<MockupHome> {
  int index = 0;

  final pages = const [
    SimpleMeditationPage(),
    SimpleTasksPage(),
    ComplexWalletPage(),
    ComplexOrganizerPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: pages[index]),
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (value) => setState(() => index = value),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.self_improvement_outlined),
            selectedIcon: Icon(Icons.self_improvement),
            label: 'простая модель 1',
          ),
          NavigationDestination(
            icon: Icon(Icons.check_circle_outline),
            selectedIcon: Icon(Icons.check_circle),
            label: 'простая модель 2',
          ),
          NavigationDestination(
            icon: Icon(Icons.account_balance_wallet_outlined),
            selectedIcon: Icon(Icons.account_balance_wallet),
            label: 'сложная модель 1',
          ),
          NavigationDestination(
            icon: Icon(Icons.event_outlined),
            selectedIcon: Icon(Icons.event),
            label: 'сложная модель 2',
          ),
        ],
      ),
    );
  }
}

//простые макеты:

class SimpleMeditationPage extends StatelessWidget {
  const SimpleMeditationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF4F2FF),
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(22, 20, 22, 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _RoundButton(
                  icon: Icons.arrow_back_ios_new,
                  onTap: () {},
                ),
                const Spacer(),
                const Text(
                  'Медитация и тд',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    letterSpacing: 2,
                  ),
                ),
                const Spacer(),
                _RoundButton(
                  icon: Icons.favorite_border,
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 28),
            const Text(
              'Найди себе\nуже девушку',
              style: TextStyle(
                fontSize: 38,
                height: 1.05,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Короткий набор заданий для того, чтобы MOGGать',
              style: TextStyle(
                color: Colors.grey.shade700,
                fontSize: 16,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 24),
            Container(
              height: 235,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF676FF5), Color(0xFF9D7CF6)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Stack(
                children: [
                  Positioned(
                    right: -25,
                    top: -20,
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(.13),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 24,
                    top: 25,
                    child: Icon(
                      Icons.nightlight_round,
                      size: 48,
                      color: Colors.white.withOpacity(.9),
                    ),
                  ),
                  const Positioned(
                    left: 24,
                    bottom: 28,
                    child: Text(
                      'Нормальный сон',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const Positioned(
                    left: 24,
                    bottom: 8,
                    child: Text(
                      '10 мин. | Заслуженный отдых',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                  Positioned(
                    right: 22,
                    bottom: 24,
                    child: FloatingActionButton(
                      mini: true,
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF676FF5),
                      onPressed: () {},
                      child: const Icon(Icons.play_arrow),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 26),
            const Text(
              'Короткие задания',
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 14),
            const Row(
              children: [
                Expanded(
                  child: _SessionCard(
                    icon: Icons.cloud_outlined,
                    title: 'Отдых',
                    time: '5 минут',
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: _SessionCard(
                    icon: Icons.wb_sunny_outlined,
                    title: 'Другой отдых',
                    time: '8 минут',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
              ),
              child: const Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: Color(0xFFEAE8FF),
                    child: Icon(Icons.auto_awesome, color: Color(0xFF676FF5)),
                  ),
                  SizedBox(width: 14),
                  Expanded(
                    child: Text(
                      'Продолжайте свою 7-дневную серию.',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  Icon(Icons.chevron_right),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class SimpleTasksPage extends StatefulWidget {
  const SimpleTasksPage({super.key});

  @override
  State<SimpleTasksPage> createState() => _SimpleTasksPageState();
}

class _SimpleTasksPageState extends State<SimpleTasksPage> {
  final tasks = <String>[
    'Прочитать 20 страниц',
    'Пойти на прогулку',
    'Сьесть бургер',
    'Сьесть бургер (2)',
  ];
  final done = <bool>[true, false, false, true];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF7F8FC),
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(22, 20, 22, 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 24,
                  backgroundColor: Color(0xFFDDE2FF),
                  child: Icon(Icons.person, color: Color(0xFF4E59D9)),
                ),
                const SizedBox(width: 12),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Доброе утро', style: TextStyle(color: Colors.grey)),
                    Text(
                      'Егорио Цыпадрыпа',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                _RoundButton(icon: Icons.notifications_none, onTap: () {}),
              ],
            ),
            const SizedBox(height: 28),
            const Text(
              'Сегодня',
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 6),
            Text(
              'Мохитонедельник, 19 сентября',
              style: TextStyle(color: Colors.grey.shade600),
            ),
            const SizedBox(height: 22),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF303A91),
                borderRadius: BorderRadius.circular(26),
              ),
              child: const Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Прогресс за день',
                          style: TextStyle(color: Colors.white70),
                        ),
                        SizedBox(height: 6),
                        Text(
                          '2 из 4 задач',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 66,
                    height: 66,
                    child: CircularProgressIndicator(
                      value: .5,
                      strokeWidth: 7,
                      backgroundColor: Colors.white24,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),
            Row(
              children: [
                const Text(
                  'Мои задачи',
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.w800),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  child: const Text('See all'),
                ),
              ],
            ),
            const SizedBox(height: 8),
            ...List.generate(tasks.length, (i) {
              return Container(
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: CheckboxListTile(
                  value: done[i],
                  onChanged: (value) {
                    setState(() => done[i] = value ?? false);
                  },
                  title: Text(
                    tasks[i],
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      decoration:
                          done[i] ? TextDecoration.lineThrough : null,
                    ),
                  ),
                  subtitle: Text(i.isEven ? 'Личное' : 'Автоматическое'),
                  secondary: Icon(
                    i.isEven ? Icons.home_outlined : Icons.school_outlined,
                    color: const Color(0xFF5964DF),
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                ),
              );
            }),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: const Text('Add new task'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


//сложные макеты:

class _MastercardIcon extends StatelessWidget {
  const _MastercardIcon();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 27,
      height: 18,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            child: Container(
              width: 17,
              height: 17,
              decoration: const BoxDecoration(
                color: Color(0xFFFF5A36),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: Container(
              width: 17,
              height: 17,
              decoration: const BoxDecoration(
                color: Color(0xFFFFB31A),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TransactionItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String date;
  final String amount;
  final String type;
  final bool negative;

  const _TransactionItem({
    required this.icon,
    required this.title,
    required this.date,
    required this.amount,
    required this.type,
    required this.negative,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 9,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
      ),
      child: Row(
        children: [
          Container(
            width: 43,
            height: 43,
            decoration: BoxDecoration(
              color: const Color(0xFFF0F1F4),
              borderRadius: BorderRadius.circular(13),
            ),
            child: Icon(
              icon,
              color: const Color(0xFF44464D),
              size: 22,
            ),
          ),
          const SizedBox(width: 11),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  date,
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 9.5,
                  ),
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    Text(
                      type,
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 9,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      negative
                          ? Icons.circle
                          : Icons.circle,
                      size: 5,
                      color: negative
                          ? Colors.redAccent
                          : Colors.blueAccent,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Text(
            amount,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}

class _WalletNavItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool selected;

  const _WalletNavItem({
    required this.icon,
    required this.title,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 19,
          color: selected
              ? const Color(0xFF22242A)
              : Colors.grey.shade500,
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: TextStyle(
            fontSize: 8,
            fontWeight: selected ? FontWeight.w700 : FontWeight.w400,
            color: selected
                ? const Color(0xFF22242A)
                : Colors.grey.shade500,
          ),
        ),
      ],
    );
  }
}

class ComplexWalletPage extends StatelessWidget {
  const ComplexWalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF7F8FC),
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(18, 18, 18, 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.account_balance_wallet,
                  size: 27,
                  color: Color(0xFF22242A),
                ),
                const SizedBox(width: 10),
                const Text(
                  'Мой Эмо-Кошелёк',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const Spacer(),
                _RoundButton(
                  icon: Icons.search,
                  onTap: () {},
                ),
                const SizedBox(width: 8),
                _RoundButton(
                  icon: Icons.more_horiz,
                  onTap: () {},
                ),
              ],
            ),

            const SizedBox(height: 20),

            // BANK CARD
            Container(
              height: 155,
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF454545),
                    Color(0xFF1F1F21),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(26),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.12),
                    blurRadius: 15,
                    offset: const Offset(0, 7),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Positioned(
                    right: -25,
                    top: -35,
                    child: Container(
                      width: 125,
                      height: 125,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(.05),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Text(
                      'Тёмыч Казимирити',
                      style: TextStyle(
                        color: Colors.white.withOpacity(.9),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const Positioned(
                    right: 0,
                    top: 0,
                    child: Row(
                      children: [
                        Text(
                          'ИНОАГЕНТ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        SizedBox(width: 7),
                        _MastercardIcon(),
                      ],
                    ),
                  ),
                  const Positioned(
                    left: 0,
                    top: 36,
                    child: Text(
                      '•••• •••• •••• 1488',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                  const Positioned(
                    left: 0,
                    bottom: 40,
                    child: Text(
                      'Баланс',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 11,
                      ),
                    ),
                  ),
                  const Positioned(
                    left: 0,
                    bottom: 7,
                    child: Text(
                      '\$0,015',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 4,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 13,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.add,
                            size: 16,
                            color: Color(0xFF303030),
                          ),
                          SizedBox(width: 5),
                          Text(
                            'Прикол',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            Row(
              children: [
                const Text(
                  'История переводов',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Больше',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 4),

            const _TransactionItem(
              icon: Icons.chair_outlined,
              title: 'Мебель продажа',
              date: '05/08/2024 | 10:01',
              amount: '\$120',
              type: 'Заказ',
              negative: true,
            ),

            const _TransactionItem(
              icon: Icons.account_balance_wallet,
              title: 'Прикол кошелек',
              date: '05/08/2024 | 10:01',
              amount: '\$400',
              type: 'Прикол',
              negative: false,
            ),

            const _TransactionItem(
              icon: Icons.table_restaurant_outlined,
              title: 'Параноик привет',
              date: '05/08/2024 | 15:40',
              amount: '\$170',
              type: 'Заказ',
              negative: true,
            ),

            const _TransactionItem(
              icon: Icons.table_bar_outlined,
              title: 'Микроприкол',
              date: '05/08/2024 | 11:23',
              amount: '\$165',
              type: 'Заказ',
              negative: true,
            ),

            const _TransactionItem(
              icon: Icons.account_balance_wallet,
              title: 'Кошелёк приколов',
              date: '05/08/2024 | 10:15',
              amount: '\$300',
              type: 'Прикол',
              negative: false,
            ),

            const SizedBox(height: 12),

            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 12,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _WalletNavItem(
                    icon: Icons.home_outlined,
                    title: 'Главная',
                  ),
                  _WalletNavItem(
                    icon: Icons.shopping_bag_outlined,
                    title: 'Корзина',
                  ),
                  _WalletNavItem(
                    icon: Icons.receipt_long_outlined,
                    title: 'Заказы',
                  ),
                  _WalletNavItem(
                    icon: Icons.account_balance_wallet,
                    title: 'Кошелёк',
                    selected: true,
                  ),
                  _WalletNavItem(
                    icon: Icons.person_outline,
                    title: 'Профиль',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class _OrganizerStat extends StatelessWidget {
  final String value;
  final String title;

  const _OrganizerStat({
    required this.value,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          title,
          style: TextStyle(
            fontSize: 9,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }
}

class _OrganizerTab extends StatelessWidget {
  final String title;
  final bool selected;
  final VoidCallback onTap;

  const _OrganizerTab({
    required this.title,
    this.selected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        backgroundColor:
            selected ? const Color(0xFF6475FF) : Colors.white,
        foregroundColor:
            selected ? Colors.white : const Color(0xFF6475FF),
        side: BorderSide(
          color: const Color(0xFF6475FF),
        ),
        minimumSize: const Size(0, 38),
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(
        title,
        style: const TextStyle(fontSize: 11),
      ),
    );
  }
}

class _OrganizerEvent extends StatelessWidget {
  final IconData icon;
  final String title;
  final String date;

  const _OrganizerEvent({
    required this.icon,
    required this.title,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: const Color(0xFFE9ECFF),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              icon,
              color: const Color(0xFF6475FF),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  date,
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.chevron_right,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}

class ComplexOrganizerPage extends StatelessWidget {
  const ComplexOrganizerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF7F8FC),
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(18, 18, 18, 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.arrow_back_ios_new,
                  size: 19,
                  color: Color(0xFF6475FF),
                ),
                const SizedBox(width: 13),
                const Text(
                  'Профиль',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Spacer(),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE9ECFF),
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: const Icon(
                    Icons.more_vert,
                    color: Color(0xFF6475FF),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            Center(
              child: Container(
                width: 82,
                height: 82,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFFD9D8E4),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.08),
                      blurRadius: 12,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.person,
                  size: 48,
                  color: Color(0xFF555563),
                ),
              ),
            ),

            const SizedBox(height: 14),

            const Center(
              child: Text(
                'Антонити Веритити',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),

            const SizedBox(height: 18),

            Container(
              padding: const EdgeInsets.symmetric(vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Row(
                children: [
                  Expanded(
                    child: _OrganizerStat(
                      value: '2.368',
                      title: 'Подписота',
                    ),
                  ),
                  Expanded(
                    child: _OrganizerStat(
                      value: '346',
                      title: 'Подписота',
                    ),
                  ),
                  Expanded(
                    child: _OrganizerStat(
                      value: '13',
                      title: 'События',
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 14),

            Row(
              children: [
                Expanded(
                  child: FilledButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.person_add_alt_1,
                      size: 15,
                    ),
                    label: const Text(
                      'Подписаться',
                      style: TextStyle(fontSize: 12),
                    ),
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color(0xFF6475FF),
                      foregroundColor: Colors.white,
                      minimumSize: const Size(0, 42),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.chat_bubble_outline,
                      size: 14,
                    ),
                    label: const Text(
                      'Сообщения',
                      style: TextStyle(fontSize: 12),
                    ),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: const Color(0xFF6475FF),
                      side: const BorderSide(
                        color: Color(0xFF6475FF),
                      ),
                      minimumSize: const Size(0, 42),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 14),

            // TABS
            Row(
              children: [
                Expanded(
                  child: _OrganizerTab(
                    title: 'Обо мне',
                    selected: true,
                    onTap: () {},
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _OrganizerTab(
                    title: 'События',
                    onTap: () {},
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _OrganizerTab(
                    title: 'Обзоры',
                    onTap: () {},
                  ),
                ),
              ],
            ),

            const SizedBox(height: 22),

            const Text(
              'Обо мне',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
            ),

            const SizedBox(height: 9),

            Text(
              'Очень много текста должно быть здесь однако мне, '
              'ОЧЕНЬ лень писать такие массивы текстов, ведь я '
              'Довольно ленивый паренек, простите. И на последок ',
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 12,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 8),

            GestureDetector(
              onTap: () {},
              child: const Text(
                'Читать далее...',
                style: TextStyle(
                  color: Color(0xFF6475FF),
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              'События',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
            ),

            const SizedBox(height: 12),

            const _OrganizerEvent(
              icon: Icons.music_note,
              title: 'Летний фестиваль',
              date: '03/06/2026',
            ),

            const _OrganizerEvent(
              icon: Icons.palette_outlined,
              title: 'Креативные приколы',
              date: '03/10/2026',
            ),
          ],
        ),
      ),
    );
  }
}


class _RoundButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _RoundButton({
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: SizedBox(
          width: 44,
          height: 44,
          child: Icon(icon, size: 20),
        ),
      ),
    );
  }
}

class _SessionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String time;

  const _SessionCard({
    required this.icon,
    required this.title,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: const Color(0xFF676FF5), size: 30),
          const SizedBox(height: 16),
          Text(title, style: const TextStyle(fontWeight: FontWeight.w800)),
          const SizedBox(height: 3),
          Text(time, style: TextStyle(color: Colors.grey.shade600)),
        ],
      ),
    );
  }
}

class _TravelStat extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _TravelStat({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 24, color: const Color(0xFF2C7A91)),
          const SizedBox(height: 12),
          Text(title, style: TextStyle(color: Colors.grey.shade600)),
          const SizedBox(height: 3),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w800)),
        ],
      ),
    );
  }
}

class _TripItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String status;

  const _TripItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: const Color(0xFFE6F1F4),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: const Color(0xFF2C7A91)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.w800)),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                ),
              ],
            ),
          ),
          Text(
            status,
            style: const TextStyle(
              color: Color(0xFF2C7A91),
              fontWeight: FontWeight.w700,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

class _MetricCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String unit;
  final String title;

  const _MetricCard({
    required this.icon,
    required this.value,
    required this.unit,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 24),
          const SizedBox(height: 14),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(width: 4),
              Padding(
                padding: const EdgeInsets.only(bottom: 3),
                child: Text(
                  unit,
                  style: TextStyle(color: Colors.grey.shade600),
                ),
              ),
            ],
          ),
          const SizedBox(height: 3),
          Text(title, style: TextStyle(color: Colors.grey.shade600)),
        ],
      ),
    );
  }
}

class _WorkoutCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _WorkoutCard({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: const Color(0xFFE9E9E5),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, size: 28),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.w800)),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                ),
              ],
            ),
          ),
          const Icon(Icons.play_circle_fill, size: 31),
        ],
      ),
    );
  }
}

class _Bar extends StatelessWidget {
  final double height;
  final String label;

  const _Bar({required this.height, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 27,
          height: height,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        const SizedBox(height: 7),
        Text(label, style: const TextStyle(color: Colors.white60)),
      ],
    );
  }
}
