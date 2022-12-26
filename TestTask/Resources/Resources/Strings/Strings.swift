// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum L10n {
  public enum MainScreen {
    public enum BestSeller {
      /// Best Seller
      public static let title = L10n.tr("Localizable", "MainScreen.BestSeller.Title", fallback: "Best Seller")
    }
    public enum CityView {
      /// Lappeenranta
      public static let placeholder = L10n.tr("Localizable", "MainScreen.CityView.Placeholder", fallback: "Lappeenranta")
    }
    public enum DropdownOptions {
      public enum Brands {
        /// iPhone
        public static let iPhone = L10n.tr("Localizable", "MainScreen.DropdownOptions.Brands.IPhone", fallback: "iPhone")
        /// Samsung
        public static let samsung = L10n.tr("Localizable", "MainScreen.DropdownOptions.Brands.Samsung", fallback: "Samsung")
        /// Xiaomi
        public static let xiaomi = L10n.tr("Localizable", "MainScreen.DropdownOptions.Brands.Xiaomi", fallback: "Xiaomi")
      }
      public enum Prices {
        /// 0 - 1000
        public static let _0 = L10n.tr("Localizable", "MainScreen.DropdownOptions.Prices.0", fallback: "0 - 1000")
        /// 1000 - 3000
        public static let _1000 = L10n.tr("Localizable", "MainScreen.DropdownOptions.Prices.1000", fallback: "1000 - 3000")
        /// 3000 - 5000
        public static let _3000 = L10n.tr("Localizable", "MainScreen.DropdownOptions.Prices.3000", fallback: "3000 - 5000")
        /// 5000 - 7000
        public static let _5000 = L10n.tr("Localizable", "MainScreen.DropdownOptions.Prices.5000", fallback: "5000 - 7000")
        /// 7000 - 10000
        public static let _7000 = L10n.tr("Localizable", "MainScreen.DropdownOptions.Prices.7000", fallback: "7000 - 10000")
      }
      public enum Size {
        /// 4.5 to 5.5 inches
        public static let singleOption = L10n.tr("Localizable", "MainScreen.DropdownOptions.Size.singleOption", fallback: "4.5 to 5.5 inches")
      }
    }
    public enum FilterView {
      /// Brand
      public static let brand = L10n.tr("Localizable", "MainScreen.FilterView.Brand", fallback: "Brand")
      /// Done
      public static let done = L10n.tr("Localizable", "MainScreen.FilterView.Done", fallback: "Done")
      /// Filter options
      public static let filterOptions = L10n.tr("Localizable", "MainScreen.FilterView.FilterOptions", fallback: "Filter options")
      /// Price
      public static let price = L10n.tr("Localizable", "MainScreen.FilterView.Price", fallback: "Price")
      /// Size
      public static let size = L10n.tr("Localizable", "MainScreen.FilterView.Size", fallback: "Size")
    }
    public enum General {
      /// Localizable.strings
      ///   Resources
      /// 
      ///   Created by Anastasia Golts on 16.12.2022.
      public static let seeMore = L10n.tr("Localizable", "MainScreen.General.SeeMore", fallback: "see more")
    }
    public enum HotSales {
      /// Buy now!
      public static let buyNow = L10n.tr("Localizable", "MainScreen.HotSales.BuyNow", fallback: "Buy now!")
      /// New
      public static let new = L10n.tr("Localizable", "MainScreen.HotSales.New", fallback: "New")
      /// Hot Sales
      public static let title = L10n.tr("Localizable", "MainScreen.HotSales.Title", fallback: "Hot Sales")
    }
    public enum SearchView {
      /// Search
      public static let placeholder = L10n.tr("Localizable", "MainScreen.SearchView.Placeholder", fallback: "Search")
    }
    public enum SelectCategory {
      /// Books
      public static let books = L10n.tr("Localizable", "MainScreen.SelectCategory.Books", fallback: "Books")
      /// Comuter
      public static let computer = L10n.tr("Localizable", "MainScreen.SelectCategory.Computer", fallback: "Comuter")
      /// Health
      public static let health = L10n.tr("Localizable", "MainScreen.SelectCategory.Health", fallback: "Health")
      /// Phones
      public static let phones = L10n.tr("Localizable", "MainScreen.SelectCategory.Phones", fallback: "Phones")
      /// Select Category
      public static let title = L10n.tr("Localizable", "MainScreen.SelectCategory.Title", fallback: "Select Category")
      /// Tools
      public static let tools = L10n.tr("Localizable", "MainScreen.SelectCategory.Tools", fallback: "Tools")
      /// view all
      public static let viewAll = L10n.tr("Localizable", "MainScreen.SelectCategory.ViewAll", fallback: "view all")
    }
    public enum TabBar {
      /// Explorer
      public static let explorer = L10n.tr("Localizable", "MainScreen.TabBar.Explorer", fallback: "Explorer")
    }
  }
  public enum MyCartScreen {
    public enum ButtonView {
      /// Checkout
      public static let checkout = L10n.tr("Localizable", "MyCartScreen.ButtonView.Checkout", fallback: "Checkout")
    }
    public enum MyCartTitleView {
      /// My Cart
      public static let title = L10n.tr("Localizable", "MyCartScreen.MyCartTitleView.Title", fallback: "My Cart")
    }
    public enum NavigationBarView {
      /// Add address
      public static let address = L10n.tr("Localizable", "MyCartScreen.NavigationBarView.Address", fallback: "Add address")
    }
    public enum TotalDeliveryView {
      /// Delivery
      public static let delivery = L10n.tr("Localizable", "MyCartScreen.TotalDeliveryView.Delivery", fallback: "Delivery")
      /// Total
      public static let total = L10n.tr("Localizable", "MyCartScreen.TotalDeliveryView.Total", fallback: "Total")
    }
  }
  public enum OnboardingScreen {
    public enum StartButton {
      /// Start Main Flow
      public static let title = L10n.tr("Localizable", "OnboardingScreen.StartButton.Title", fallback: "Start Main Flow")
    }
  }
  public enum ProductDetailsScreen {
    public enum AddToCartButtonView {
      /// Add to Cart
      public static let title = L10n.tr("Localizable", "ProductDetailsScreen.AddToCartButtonView.Title", fallback: "Add to Cart")
    }
    public enum ColorCapacityView {
      /// Select color and capacity
      public static let title = L10n.tr("Localizable", "ProductDetailsScreen.ColorCapacityView.Title", fallback: "Select color and capacity")
    }
    public enum InfoViewButton {
      /// Details
      public static let details = L10n.tr("Localizable", "ProductDetailsScreen.InfoViewButton.Details", fallback: "Details")
      /// Features
      public static let features = L10n.tr("Localizable", "ProductDetailsScreen.InfoViewButton.Features", fallback: "Features")
      /// Shop
      public static let shop = L10n.tr("Localizable", "ProductDetailsScreen.InfoViewButton.Shop", fallback: "Shop")
    }
    public enum ProductNavigationBarView {
      /// Product Details
      public static let title = L10n.tr("Localizable", "ProductDetailsScreen.ProductNavigationBarView.Title", fallback: "Product Details")
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
