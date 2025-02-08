# New Features Added:

#🟣 1. Bottom Navigation Bar
Introduced a persistent bottom navigation bar that allows users to switch between:
Home 📚 (Browse books)
Cart 🛒 (View selected books)
Buy History 🕰️ (Track purchased books)
Ensures a smoother user experience by keeping navigation simple and accessible.

#🟣 2. Book Images
Each book now has an image, enhancing the visual appeal.
Stored images in the assets/ folder, making the UI more engaging.
Users can see book covers while browsing, making the shopping experience more intuitive.

#🟣 3. Cart Functionality with Persistent UI
Users can add books to their cart.
A dedicated Cart Page 📥 displays books in the cart.
Books in the cart persist until purchase.
Includes an "Add to Cart" button next to each book.

#🟣 4. Buy History Page
After purchasing books from the cart, they are moved to the Buy History page.
Users can track previous purchases.
If no books have been purchased yet, a message "No purchases yet" is displayed.

#🟣 5. Floating Action Button for Checkout
A floating action button (FAB) appears in the Cart Page.
When clicked, all books in the cart move to Buy History (simulating a purchase).
The cart gets cleared after purchase.

#🟣 6. Improved UI & UX
Material Design principles were followed for better usability.
Rounded Card Views for books and cart items.
Smooth navigation between pages.
Proper spacing and padding for a cleaner look.

#Technical Details

Framework: Flutter (Dart)
State Management: StatefulWidget (using setState())
Navigation: BottomNavigationBar and IndexedStack
Storage: Local state management (for cart and buy history)
Assets: pubspec.yaml is configured for book images.

# What’s Unique in This App?
✅ Visually enhanced UI with book images
✅ Bottom navigation bar for seamless user experience
✅ Cart with purchase tracking (Buy History feature)
✅ Floating action button to simulate purchases
✅ Better user interaction with material components
