import 'package:flutter/material.dart';

void main() {
  runApp(const BookStoreApp());
}

class BookStoreApp extends StatelessWidget {
  const BookStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HoneyStory',
      theme: ThemeData(
        primaryColor: Colors.purple,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.purple,
          foregroundColor: Colors.white,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black),
          bodyMedium: TextStyle(color: Colors.black54),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, String>> books = const [
    {
      'title': 'ගම්පෙරළිය – Gamperaliya',
      'author': 'Martin Wickramasinghe',
      'price': 'Rs.490.00',
      'image': 'assets/Gamperaliya.jpg'
    },
    {
      'title': 'Kaliyugaya - කලියුගය',
      'author': 'Martin Wickramasinghe',
      'price': 'Rs.900.00',
      'image': 'assets/Kaliyugaya.jpg'
    },
    {
      'title': 'Malaunge Aurudu Da - මළවුන්ගේ අවුරුදු දා',
      'author': 'එදිරිවීර සරත්චන්ද්‍ර',
      'price': 'Rs.850.00',
      'image': 'assets/Malaunge_Aurudu_Da.jpg'
    },
    {
      'title': 'Chathurarya Sathya - චතුරාය්‍ය සත්‍යය',
      'author': 'Sri Chandrawimala Dharmapusthaka Mandalaya',
      'price': 'Rs.400.00',
      'image': 'assets/Chathurarya_Sathya.jpg'
    },
    {
      'title': 'GURU GEETHAYA',
      'author': 'Dadigama V Rodrigo',
      'price': 'Rs.315.00',
      'image': 'assets/GURU_GEETHAYA.jpg'
    },
    {
      'title': 'Ape Gama - අපේ ගම',
      'author': 'මාර්ටින් වික්‍රමසිංහ',
      'price': 'Rs.450.00',
      'image': 'assets/Ape_gama.jpg'
    },
    {
      'title': 'MADOL DOOVA - ENGLISH',
      'author': 'Martin Wickramasinghe',
      'price': 'Rs.225.00',
      'image': 'assets/Madol_duwa.jpg'
    },
    {
      'title': 'SENKOTTAN',
      'author': 'Mahinda Prasad Masimbula',
      'price': 'Rs.810.00',
      'image': 'assets/Senkottan.jpg'
    },
    {
      'title': 'Malagiya Aththo - මළගිය ඇත්තෝ',
      'author': 'එදිරිවීර සරත්චන්ද්‍ර',
      'price': 'Rs.450.00',
      'image': 'assets/Malagiya_aththo.jpg'
    },
    {
      'title': 'Baddegama - බැද්දේගම',
      'author': 'M.D. Gunasena - ඒම්.ඩී. ගුණසේන',
      'price': 'Rs.650.00',
      'image': 'assets/Baddegame.jpg'
    },
  ];

  final List<Map<String, String>> cart = [];
  final List<Map<String, String>> buyHistory = [];

  void addToCart(Map<String, String> book) {
    setState(() {
      cart.add(book);
    });
  }

  void purchaseBooks() {
    setState(() {
      buyHistory.addAll(cart);
      cart.clear();
    });
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HoneyStory'),
        actions: [
          if (_selectedIndex == 0)
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                _onItemTapped(1);
              },
            ),
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          // Home Page
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              itemCount: books.length,
              itemBuilder: (context, index) {
                final book = books[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 3,
                  child: ListTile(
                    leading: Image.asset(book['image']!,
                        width: 50, height: 75, fit: BoxFit.cover),
                    title: Text(book['title']!),
                    subtitle: Text('${book['author']} - ${book['price']}'),
                    trailing: ElevatedButton(
                      onPressed: () => addToCart(book),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('Add to Cart'),
                    ),
                  ),
                );
              },
            ),
          ),

          // Cart Page
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: cart.isEmpty
                ? const Center(child: Text('Your cart is empty'))
                : ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      final item = cart[index];
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 3,
                        child: ListTile(
                          leading: Image.asset(item['image']!,
                              width: 50, height: 75, fit: BoxFit.cover),
                          title: Text(item['title']!),
                          subtitle:
                              Text('${item['author']} - ${item['price']}'),
                        ),
                      );
                    },
                  ),
          ),

          // Buy History Page
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: buyHistory.isEmpty
                ? const Center(child: Text('No purchases yet'))
                : ListView.builder(
                    itemCount: buyHistory.length,
                    itemBuilder: (context, index) {
                      final item = buyHistory[index];
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 3,
                        child: ListTile(
                          leading: Image.asset(item['image']!,
                              width: 50, height: 75, fit: BoxFit.cover),
                          title: Text(item['title']!),
                          subtitle:
                              Text('${item['author']} - ${item['price']}'),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Buy History',
          ),
        ],
      ),
      floatingActionButton: _selectedIndex == 1
          ? FloatingActionButton(
              onPressed: purchaseBooks,
              backgroundColor: Colors.purple,
              child: const Icon(Icons.check),
            )
          : null,
    );
  }
}
