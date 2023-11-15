# TechSpace

<details>
<summary> Tugas 7 </summary>

## 1. Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?
Berikut ini adalah perbedaan antara stateless dan stateful widget.
+ Stateless widget adalah widget yang tidak memiliki keadaan internal (state) sehingga tampilannya tidak akan berubah setelah dibuat. Stateless widget biasanya digunakan untuk menampilkan elemen-elemen statis seperti teks, ikon, dan gambar. Widget jenis ini hanya bergantung pada argumen yang diberikan oleh widget induknya.

+ Stateful widget adalah widget yang memiliki keadaan internal (state) yang dapat berubah-ubah sehingga tampilannya dapat berubah secara dinamis. Stateful widget biasanya digunakan untuk menampilkan elemen-elemen yang menangani interaksi dari pengguna, misalnya form dan infinite scroll bar. Widget jenis ini memiliki kelas state yang terpisah.

## 2. Sebutkan seluruh widget yang digunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.
Berikut ini adalah list widget yang digunakan beserta fungsinya.

+ MyHomePage: Custom widget yang digunakan sebagai main page dari aplikasi.
+ Scaffold: Widget berisi template dasar untuk suatu page, terdiri atas appBar dan body.
+ AppBar: Widget yang digunakan untuk membuat panel di bagian atas suatu page.
+ Text: Widget untuk menampilkan tulisan.
+ SingleChildScrollView: Widget ini memungkinkan suatu page dapat di-scroll jika ukuran panjang konten dalam page melebihi ukuran panjang layar.
+ Padding: Widget untuk memberikan padding (jarak antara content dengan border).
+ Column: Widget untuk menampilkan children secara vertikal.
+ GridView.count: Widget untuk membuat grid layout dengan jumlah kolom yang sudah ditentukan.
+ ShopCard: Custom widget untuk merepresentasikan data setiap ShopItem dalam card.
+ Material: Widget untuk mengatur background color sebuah card.
+ InkWell: Widget untuk membuat suatu area dalam aplikasi responsif terhadap sentuhan.
+ ScaffoldMessenger: Widget ini digunakan untuk menampilkan SnackBar.
+ SnackBar: Widget untuk menampilkan popup message dalam periode waktu yang singkat.
+ Container: Widget untuk mengelompokkan ikon dan teks dalam ShopCard.
+ Center: Widget untuk mengatur posisi child agar tepat berada di tengah.
+ Icon: Widget untuk menampilkan ikon.

## 3. Jelaskan bagaimana cara mengimplementasikan proyek di atas secara step-by-step.
1. Buatlah proyek Flutter baru dengan menggunakan command ```flutter create techspace``` di direktori tempat proyek Flutter akan dibuat.

2. Buatlah file baru bernama menu.dart pada direktori lib.

3. Inisiasi class ShopItem dan class ShopCard di menu.dart. Class ShopItem dibuat untuk merepresentasikan data dari setiap button. Class ShopItem nantinya akan memiliki tiga atribut, yakni name, icon, dan color (implementasi bonus). Sementara itu, Class ShopCard adalah custom widget yang dibuat untuk menampilkan button-button tadi dalam representasi card.

4. Agar button menampilkan popup message ketika diklik, tambahkan barisan kode berikut di class ShopCard.
```
  ...
    onTap: () {
    ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(
            content: Text("Kamu telah menekan tombol ${item.name}")));
    },
    ...
```
Ketika button diklik, aplikasi akan menampilkan popup message berupa "Kamu telah menekan tombol X" dengan X adalah nama button yang ditekan.

5. Implementasikan appbar pada menu.dart dengan menuliskan barisan kode berikut.
```
class MyHomePage extends StatelessWidget {
    MyHomePage({Key? key}) : super(key: key);

    final List<ShopItem> items = [
        ShopItem("Lihat Item", Icons.checklist, Colors.deepOrange),
        ShopItem("Tambah Item", Icons.add_shopping_cart, Colors.teal),
        ShopItem("Logout", Icons.logout, Colors.blue),
    ];

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('TechSpace', style: TextStyle(color: Colors.white)),
          backgroundColor: const Color.fromRGBO(33, 33, 33, 1),
        ),
        ...
      )
    }
}
```
Sesuai dengan ketentuan dalam soal dan bonus, barisan kode ```final List<ShopItem> items = [...];``` ditulis sedemikian rupa untuk membuat button "Lihat Item", "Tambah Item", dan "Logout" dengan warna yang berbeda-beda.

6. Implementasikan bagian body pada menu.dart dengan barisan kode berikut. Pada bagian ini, akan ditampilkan tulisan "Hello" beserta ketiga button dalam representasi card.
```
    ...
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        ...
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Text(
                    'Hello!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                GridView.count(
                  primary: true,
                  padding: const EdgeInsets.all(20),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  children: items.map((ShopItem item) {
                    return ShopCard(item);
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      );
    }
```
Pada barisan kode di atas, widget SingleChildScrollView digunakan agar page dapat di-scroll jika konten terlalu panjang. Kemudian, agar tampilan card tersusun secara rapi, kita dapat menggunakan widget GridView.count.

7. Ubahlah class MyApp dalam main.dart hingga seperti barisan kode berikut ini.
```
...
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Root aplikasi TechSpace.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TechSpace',
      theme: ThemeData(
        // Theme aplikasi TechSpace.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}
```
Dengan begitu, page yang pertama kali ditampilkan ketika aplikasi baru berjalan adalah MyHomePage di menu.dart. 

</details>

<details>
<summary> Tugas 8 </summary> 

## 1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement(). Sertai dengan contoh mengenai penggunaan kedua metode.
Navigator.push() dan Navigator.pushReplacement() adalah dua metode yang digunakan dalam Flutter untuk mengelola navigasi antar halaman dalam aplikasi. Berikut ini adalah penjelasan dan contoh penggunaan kedua metode tersebut.

1. Navigator.push():
Metode ini digunakan untuk menambahkan halaman baru ke dalam stack navigasi. Halaman baru akan ditambahkan di atas halaman saat ini sehingga user dapat kembali ke halaman sebelumnya jika menekan tombol "back" pada perangkat mereka. Contoh penggunaannya adalah saat berpindah dari halaman utama ke halaman tambah item baru.
```
onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Menu()),
  );
}
```
2. Navigator.pushReplacement():
Metode ini digunakan untuk menambahkan halaman baru ke dalam stack navigasi dengan cara mengganti halaman saat ini. Hal ini membuat user tidak akan bisa kembali ke halaman sebelumnya. Contoh penggunaannya adalah saat user berhasil login dan akan berpindah ke halaman utama.
```
onPressed: () {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => HalamanUtama()),
  );
}
```

## 2. Jelaskan masing-masing layout widget pada Flutter.
Berikut ini adalah contoh dan penjelasan mengenai layout widget pada Flutter.

1. **Container**: Widget ini digunakan sebagai tempat untuk mengatur tata letak serta memberi styling pada elemen.
2. **Row dan Column**: Widget ini digunakan untuk mengatur elemen secara horizontal (Row) maupun vertikal (Column).
3. **ListView**: Widget ini digunakan untuk membuat suatu daftar yang bisa di-scroll.
4. **Stack**: Widget ini digunakan untuk menumpuk suatu elemen di atas elemen yang lain.
5. **Expanded dan Flexible**: Widget ini digunakan untuk mengatur elemen dalam tata letak flex.
6. **GridView**: Widget ini digunakan untuk mengatur elemen dalam tata letak tabel.

## 3. Sebutkan apa saja elemen input form yang digunakan pada tugas ini dan jelaskan alasan penggunaannya.
Elemen input yang digunakan dalam tugas ini adalah TextFormField. Selain mampu menangani input teks dari pengguna, TextFormField juga memiliki beberapa fitur lain. Salah satu di antaranya adalah mendukung penambahan validasi untuk memastikan input yang diterima sudah sesuai dengan apa yang diharapkan. Tak hanya itu, TextFormField juga mendukung penambahan label untuk memandu user dalam mengisi form. Hal-hal ini membuat TextFormField menjadi pilihan elemen input yang tepat untuk digunakan pada tugas ini.

## 4. Bagaimana penerapan clean architecture pada Flutter?
Penerapan clean architecture pada Flutter melibatkan pembagian struktur suatu proyek menjadi beberapa layer yang lebih modular. Berikut ini adalah beberapa layer dalam penerapan clean architecture.

1. **Domain**: Layer ini biasanya berisi use cases serta repository yang banyak berfokus pada logika bisnis aplikasi.
2. **Data**: Layer ini lebih banyak berfokus pada pengelolaan data, misalnya pemanggilan API, database, serta local storage.
3. **Presentation**: Layer ini berisi kode yang lebih banyak berfokus pada interaksi dengan pengguna, seperti UI dan state management.
4. **Infrastructure**: Layer ini berisi kode yang berinteraksi dengan hardware maupun operating system.

Dengan pendekatan seperti ini, setiap layer dari aplikasi dapat dikembangkan secara independen. Hal ini membuat aplikasi dapat lebih mudah untuk dikembangkan serta dipelihara.

## 5. Jelaskan bagaimana cara mengimplementasikan proyek di atas secara step-by-step.
1. Buatlah direktori baru dengan nama screens dan widgets di direktori lib. Pindahkan file menu.dart ke dalam direktori screens. Setelah itu, pindahkan class ShopItem dan ShopCard ke dalam file baru bernama shop_card.dart di direktori widgets.

2. Buatlah file baru dengan nama shoplist_form.dart di direktori screens. Tambahkan barisan kode berikut ini.
```
import 'package:flutter/material.dart';
import 'package:techspace/widgets/left_drawer.dart';

class ShopFormPage extends StatefulWidget {
  const ShopFormPage({super.key});

  @override
  State<ShopFormPage> createState() => _ShopFormPageState();
}

class _ShopFormPageState extends State<ShopFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _amount = 0;
  String _description = "";
  int _price = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Form Tambah Item',
          ),
        ),
        backgroundColor: const Color.fromRGBO(33, 33, 33, 1),
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Name",
                  labelText: "Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (String? value) {
                  setState(() {
                    _name = value!;
                  });
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Name cannot be empty!";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Amount",
                  labelText: "Amount",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (String? value) {
                  setState(() {
                    if (int.tryParse(value!) != null) {
                      _amount = int.parse(value);
                    }
                  });
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Amount cannot be empty!";
                  }
                  if (int.tryParse(value) == null) {
                    return "Amount must be a number!";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Description",
                  labelText: "Description",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (String? value) {
                  setState(() {
                    _description = value!;
                  });
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Description cannot be empty!";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Price",
                  labelText: "Price",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (String? value) {
                  setState(() {
                    if (int.tryParse(value!) != null) {
                      _price = int.parse(value);
                    }
                  });
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Price cannot be empty!";
                  }
                  if (int.tryParse(value) == null) {
                    return "Price must be a number!";
                  }
                  return null;
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.indigo),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Item berhasil tersimpan!'),
                            content: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Name: $_name'),
                                  Text('Amount: $_amount'),
                                  Text('Description: $_description'),
                                  Text('Price: $_price'),
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                child: const Text('OK'),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        },
                      );
                      _formKey.currentState!.reset();
                    }
                  },
                  child: const Text(
                    "Save",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
```
Sesuaikan TextFormField dengan atribut model pada tugas Django. Selanjutnya, tambahkan validator untuk memastikan input tidak kosong dan input sudah sesuai dengan jenis data yang diharapkan. Terakhir, tambahkan ElevatedButton "Save" yang jika ditekan akan menampilkan pop-up berisi informasi mengenai data item yang baru saja ditambahkan.

3. Pada file shop_card.dart, tambahkan kode berikut.
```
...
onTap: () {
  ...
  // Navigate ke route yang sesuai (tergantung jenis tombol)
  if (item.name == "Tambah Item") {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ShopFormPage(),
        ));
  }
},
...
```
Nantinya, ketika tombol "Tambah Item" pada halaman utama ditekan, user akan diarahkan ke halaman "Tambah Item".

4. Buatlah file baru bernama left_drawer.dart di direktori widgets. Berikut ini adalah barisan kode yang harus ditambahkan.
```
import 'package:flutter/material.dart';
import 'package:techspace/screens/menu.dart';
import 'package:techspace/screens/shoplist_form.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromRGBO(33, 33, 33, 1),
            ),
            child: Column(
              children: [
                Text(
                  'TechSpace',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text(
                  "Cari semua keperluan barang elektronikmu hanya di TechSpace!",
                  style: TextStyle(
                    fontSize: 15, // Ukuran font 15
                    color: Colors.white, // Warna teks putih
                    fontWeight: FontWeight.normal, // Weight biasa
                  ),
                  textAlign: TextAlign.center, // Center alignment
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Halaman Utama'),
            // Bagian redirection ke MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_shopping_cart),
            title: const Text('Tambah Item'),
            // Bagian redirection ke ShopFormPage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ShopFormPage(),
                  ));
            },
          ),
        ],
      ),
    );
  }
}
```
Gunakan ListView berisi ListTile untuk menampilkan opsi pindah ke "Halaman Utama" dan "Tambah Item". Setelah itu, tambahkan Navigator.pushReplacement() dalam properti onTap agar user diarahkan ke halaman yang sesuai.

</details>