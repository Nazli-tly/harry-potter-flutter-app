import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/character_provider.dart';
import '../models/character_model.dart';

class CharacterListScreen extends ConsumerWidget {
  const CharacterListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final characterData = ref.watch(characterProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Harry Potter Karakterleri")),
      body: characterData.when(
        data: (characters) => ListView.builder(
          itemCount: characters.length,
          itemBuilder: (context, index) {
            final CharacterModel c = characters[index];
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Fotoğraf
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        (c.image != null && c.image!.isNotEmpty)
                            ? c.image!
                            : "https://via.placeholder.com/80",
                        height: 100,
                        width: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Detaylar
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(c.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                          Text("Actor: ${c.actor ?? 'Bilinmiyor'}"),
                          Text("House: ${c.house ?? 'Yok'}"),
                          Text("Gender: ${c.gender ?? '-'}"),
                          Text("House: ${c.house ?? '-'}"),
                          Text("DOB: ${c.dateOfBirth ?? '-'}"),
                          Text("Ancestry: ${c.ancestry ?? '-'}"),
                          Text("Eye Color: ${c.eyeColour ?? '-'}"),
                          Text("Hair Color: ${c.hairColour ?? '-'}"),
                          Text("Wand: ${c.wand?.wood ?? '-'}, ${c.wand?.core ?? '-'}, ${c.wand?.length ?? '-'}"),
                          Text("Patronus: ${c.patronus ?? '-'}"),
                          Text("Student: ${c.hogwartsStudent == true ? "Yes" : "No"}"),
                          Text("Staff: ${c.hogwartsStaff == true ? "Yes" : "No"}"),
                          Text("Alive: ${c.alive == true ? "Yes" : "No"}"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text("Hata oluştu: $err")),
      ),
    );
  }
}