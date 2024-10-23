class PropertyModel {
  static List<String> type = [
    "House",
    "Apartment",
    "Villa",
  ];
  static List<String> furnishing = [
    "Furnished",
    "Semi-Furnished",
    "Unfurnished",
  ];
  static List<String> constructstatus = [
    "New Launch",
    "Ready to Move",
    "Under Construction",
  ];
  static List<String> enviornment = [
    "Garden",
    "Gym",
    "Park",
    "Home theater",
    "Swiming pool"
  ];
  static List<String> listedby = ["Dealer", "Owner"];
  static const List<String> categoryFilter = [
    "All",
    "House",
    "Apartment",
    "Villa",
    "Land"
  ];
  static const List<String> typeFilter = ["All", "Rent", "Sale"];
  static const List<String> listedbyFilter = ["All", "Dealer", "Owner"];
}
