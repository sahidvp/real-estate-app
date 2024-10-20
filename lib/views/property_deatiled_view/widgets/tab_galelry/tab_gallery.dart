import 'package:flutter/material.dart';

Container tabGallery(List<String> imageUrls) {
  return Container(
    padding: const EdgeInsets.all(16.0), // Optional padding
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Align title to the left
      children: [
        // Title for the gallery
        const Padding(
          padding: EdgeInsets.only(bottom: 8.0),
          child: Text(
            "Gallery",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        // GridView for displaying images
        imageUrls.isNotEmpty
            ? GridView.builder(
                shrinkWrap: true, // Ensures the grid fits the content
                physics:
                    const NeverScrollableScrollPhysics(), // Disables grid scrolling inside a scrollable view
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of images per row
                  crossAxisSpacing: 8, // Space between columns
                  mainAxisSpacing: 8, // Space between rows
                ),
                itemCount: imageUrls.length, // Number of images
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(25), // Rounded corners
                    child: Image.network(
                      imageUrls[index],
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child:
                              CircularProgressIndicator(), // Show a loading indicator while images load
                        );
                      },
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.error), // Handle error
                    ),
                  );
                },
              )
            : const Text(
                "No images uploaded."), // Display when there are no images
      ],
    ),
  );
}
