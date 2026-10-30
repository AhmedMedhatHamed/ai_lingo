import 'package:ai_lingo/core/utils/app_strings.dart';
import 'package:ai_lingo/feature/vocabulary/widgets/empty_vocabulary_widget.dart';
import 'package:flutter/material.dart';

class MyVocabularyScreen extends StatefulWidget {
  const MyVocabularyScreen({super.key});

  @override
  State<MyVocabularyScreen> createState() => _MyVocabularyScreenState();
}

class _MyVocabularyScreenState extends State<MyVocabularyScreen> {
  static const Color primaryColor = Color(0xFF1D4ED8);
  static const Color backgroundColor = Color(0xFFF8FAFC);

  final TextEditingController _searchController = TextEditingController();

  int _selectedFilter = 0;

  final List<Map<String, dynamic>> _words = [
    {
      'word': 'Milk',
      'translation': 'حليب',
      'example': 'Can I have a glass of milk?',
      'status': 'Mastered',
      'saved': true,
    },
    {
      'word': 'Help',
      'translation': 'مساعدة',
      'example': 'Can you help me, please?',
      'status': 'Learning',
      'saved': true,
    },
    {
      'word': 'Moral',
      'translation': 'أخلاقي',
      'example': 'It is a moral responsibility.',
      'status': 'Learning',
      'saved': true,
    },
    {
      'word': 'Patience',
      'translation': 'الصبر',
      'example': 'Patience is the key to success.',
      'status': 'Mastered',
      'saved': true,
    },
    {
      'word': 'Document',
      'translation': 'مستند',
      'example': 'Please sign this document.',
      'status': 'Mastered',
      'saved': true,
    },
    {
      'word': 'Official',
      'translation': 'رسمي',
      'example': 'This is an official announcement.',
      'status': 'Learning',
      'saved': true,
    },
  ];

  final List<String> _filters = ['All', 'Learning', 'Mastered'];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Map<String, dynamic>> get _filteredWords {
    final query = _searchController.text.trim().toLowerCase();

    return _words.where((item) {
      final matchesSearch =
          item['word'].toString().toLowerCase().contains(query) ||
          item['translation'].toString().contains(query);

      final matchesFilter =
          _selectedFilter == 0 || item['status'] == _filters[_selectedFilter];

      return matchesSearch && matchesFilter;
    }).toList();
  }

  int _countFor(String status) {
    if (status == 'All') return 12;

    if (status == 'Learning') return 4;

    return 8;
  }

  bool isEmpty = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(
          AppStrings.myVocabulary,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Color(0xFF172033),
          ),
        ),
      ),
      body: isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: .center,
                children: [EmptyVocabularyWidget()],
              ),
            )
          : SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    color: Colors.white,
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                    child: const Text(
                      'Review and practice your saved words',
                      style: TextStyle(fontSize: 13, color: Color(0xFF64748B)),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
                      children: [
                        TextField(
                          controller: _searchController,
                          onChanged: (_) => setState(() {}),
                          decoration: InputDecoration(
                            hintText: 'Search vocabulary...',
                            hintStyle: const TextStyle(
                              color: Color(0xFF94A3B8),
                              fontSize: 13,
                            ),
                            prefixIcon: const Icon(
                              Icons.search,
                              color: Color(0xFF64748B),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 14,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: const BorderSide(
                                color: Color(0xFFE2E8F0),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: const BorderSide(
                                color: Color(0xFFE2E8F0),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: const BorderSide(color: primaryColor),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(_filters.length, (index) {
                              final selected = _selectedFilter == index;
                              final filter = _filters[index];

                              return Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: ChoiceChip(
                                  selected: selected,
                                  showCheckmark: false,
                                  onSelected: (_) {
                                    setState(() {
                                      _selectedFilter = index;
                                    });
                                  },
                                  label: Text(
                                    '$filter (${_countFor(filter)})',
                                    style: TextStyle(
                                      color: selected
                                          ? Colors.white
                                          : const Color(0xFF475569),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  selectedColor: primaryColor,
                                  backgroundColor: Colors.white,
                                  side: BorderSide(
                                    color: selected
                                        ? primaryColor
                                        : const Color(0xFFE2E8F0),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(22),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 5,
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                        const SizedBox(height: 18),
                        Row(
                          children: [
                            const Expanded(
                              child: Text(
                                'Saved Words',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF172033),
                                ),
                              ),
                            ),
                            Text(
                              '${_filteredWords.length} words',
                              style: const TextStyle(
                                fontSize: 12,
                                color: Color(0xFF64748B),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        if (_filteredWords.isEmpty)
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 45),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.search_off,
                                  size: 44,
                                  color: Color(0xFF94A3B8),
                                ),
                                SizedBox(height: 12),
                                Text(
                                  'No words found',
                                  style: TextStyle(
                                    color: Color(0xFF64748B),
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          )
                        else
                          ..._filteredWords.map(
                            (item) => _VocabularyCard(
                              word: item['word'] as String,
                              translation: item['translation'] as String,
                              example: item['example'] as String,
                              status: item['status'] as String,
                              saved: item['saved'] as bool,
                              onBookmark: () {
                                setState(() {
                                  item['saved'] = !(item['saved'] as bool);
                                });
                              },
                            ),
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

class _VocabularyCard extends StatelessWidget {
  const _VocabularyCard({
    required this.word,
    required this.translation,
    required this.example,
    required this.status,
    required this.saved,
    required this.onBookmark,
  });

  final String word;
  final String translation;
  final String example;
  final String status;
  final bool saved;
  final VoidCallback onBookmark;

  @override
  Widget build(BuildContext context) {
    final mastered = status == 'Mastered';

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  word,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF172033),
                  ),
                ),
              ),
              IconButton(
                visualDensity: VisualDensity.compact,
                tooltip: 'Pronunciation',
                onPressed: () {},
                icon: const Icon(
                  Icons.volume_up_outlined,
                  size: 21,
                  color: Color(0xFF64748B),
                ),
              ),
              IconButton(
                visualDensity: VisualDensity.compact,
                tooltip: saved ? 'Remove bookmark' : 'Bookmark',
                onPressed: onBookmark,
                icon: Icon(
                  saved ? Icons.bookmark : Icons.bookmark_border,
                  size: 21,
                  color: saved
                      ? const Color(0xFF1D4ED8)
                      : const Color(0xFF64748B),
                ),
              ),
            ],
          ),
          Text(
            translation,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF1D4ED8),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 9),
          Text(
            example,
            style: const TextStyle(
              fontSize: 12,
              height: 1.5,
              color: Color(0xFF64748B),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Icon(
                Icons.menu_book_outlined,
                size: 15,
                color: mastered
                    ? const Color(0xFF16A34A)
                    : const Color(0xFFD97706),
              ),
              const SizedBox(width: 5),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
                decoration: BoxDecoration(
                  color: mastered
                      ? const Color(0xFFDCFCE7)
                      : const Color(0xFFFEF3C7),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: mastered
                        ? const Color(0xFF15803D)
                        : const Color(0xFFB45309),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
