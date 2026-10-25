import 'package:ai_lingo/feature/vocabulary/widgets/vocabulary_header.dart';
import 'package:flutter/material.dart';
import '../widgets/empty_vocabulary_widget.dart';

class VocabularyScreen extends StatelessWidget {
  const VocabularyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(automaticallyImplyLeading: true),
          SliverToBoxAdapter(
            child: VocabularyHeader(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: MediaQuery.of(context).size.height * 0.15),
          ),
          SliverToBoxAdapter(
            child: EmptyVocabularyWidget(),
          ),
        ],
      ),
    );
  }
}


