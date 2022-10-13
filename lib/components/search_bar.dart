import 'package:flutter/material.dart';
import 'package:hi_beat/src/res.dart';
import 'package:hi_beat/src/utils.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
    required this.searchTextInputController,
  });

  final TextEditingController searchTextInputController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: fullWidth(context),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.grey,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Expanded(
              flex: 9,
              child: TextField(
                controller: searchTextInputController,
                onChanged: (value) {},
                style: const TextStyle(color: Colors.black87),
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Color(0xff4338CA),
                  ),
                  filled: true,
                  fillColor: AppColors.white,
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.grey),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
