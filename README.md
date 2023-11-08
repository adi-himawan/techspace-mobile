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