import Foundation
import CoreImage

struct BarCodeGenerator {
  
  /// An enumeration representing the types of barcodes supported.
  enum BarcodeType: String {
    case qr = "CIQRCodeGenerator"
    case barcode128 = "CICode128BarcodeGenerator"
    case barcpdePDF417 = "CIPDF417BarcodeGenerator"
    case aztec = "CIAztecCodeGenerator"
  }
  
  private var barcodeFilter: CIFilter
  private var customCharacterSet: String
  private var filter: BarcodeType
  private var maxSymbolsPerLine: Int
  
  /// Initialize the BarCodeGenerator with the specified options.
    ///
    /// - Parameters:
    ///   - filter: The type of barcode to generate.
    ///   - maxSymbolsPerLine: The maximum number of symbols per line in ASCII representation.
    ///   - customCharacterSet: The custom character set used for ASCII representation.
  init(filter: BarcodeType = .qr, maxSymbolsPerLine: Int = 20, customCharacterSet: String = "#") {
    self.filter = filter
    self.maxSymbolsPerLine = maxSymbolsPerLine
    self.customCharacterSet = customCharacterSet
    let filterName = self.filter.rawValue
    guard let barFilter = CIFilter(name: filterName) else {
      fatalError("Unable to create QR code filter.")
    }
    barcodeFilter = barFilter
  }
  
  // A private helper function to generate ASCII code from a given CIImage.
  private func generateAsciiCode(from image: CIImage) -> String {
    let width = Int(image.extent.width)
    let height = Int(image.extent.height)
    
    var asciiCode = ""
    
    for y in 0..<height {
      for x in 0..<width {
        let pixel = image.getPixel(x: x, y: y)
        let randomStringElement = getRandomElementFromCustomCharacterSet()
        asciiCode += pixel > 0 ? " " : randomStringElement
      }
      asciiCode += "\n"
    }
    return asciiCode
  }
  
  // Generate and print the ASCII representation of the barcode.
  func printAsciiCode(from input: String) {
    let barcodeImage = generatBarcodeImage(from: input)
    let asciiString = generateAsciiCode(from: barcodeImage)
    print(asciiString)
  }
  
  // Generate a barcode image from the given input string.
  func generatBarcodeImage(from input: String) -> CIImage {
    let data = input.data(using: String.Encoding.ascii)
    barcodeFilter.setValue(data, forKey: "inputMessage")
    
    guard let barcodeImage = barcodeFilter.outputImage else {
      fatalError("Unable to process Image.")
    }
    // If we need to make non-squere barcodes, we need to change input to width/length or calculate it manualy on barcode type. For example we can move width and height in properties and add setter with logic connected with barcode type.
    
    // Calculate scale modificators.
    let scaleX = Double(maxSymbolsPerLine) / Double(barcodeImage.extent.width)
    let scaleY = Double(maxSymbolsPerLine) / Double(barcodeImage.extent.height)
    
    let transformedImage = barcodeImage.transformed(by: CGAffineTransform(scaleX: CGFloat(scaleX), y: CGFloat(scaleY)))
    
    return transformedImage
  }
  
  // A private helper function to get a random character from the customCharacterSet.
  private func getRandomElementFromCustomCharacterSet() -> String {
    guard let randomCharacter = customCharacterSet.randomElement()  else {
      return "#"
    }
    return String(randomCharacter)
  }
}


extension CIImage {
  /// Get the pixel value at the specified x and y coordinates.
  ///
  /// - Parameters:
  ///   - x: The x coordinate of the pixel.
  ///   - y: The y coordinate of the pixel.
  /// - Returns: The pixel value as UInt8.
  func getPixel(x: Int, y: Int) -> UInt8 {
    let bitmap = self.bitmap()
    
    if x < 0 || x >= bitmap.width || y < 0 || y >= bitmap.height {
      return 0
    }
    
    return bitmap.getPixel(x: x, y: y)
  }
  
  /// Create a bitmap representation of the image.
  ///
  /// - Returns: A CGContext representing the bitmap.
  func bitmap() -> CGContext {
    let width = Int(self.extent.width)
    let height = Int(self.extent.height)
    
    let bytesPerRow = width * MemoryLayout<UInt8>.size
    
    let context = CGContext(
      data: nil,
      width: width,
      height: height,
      bitsPerComponent: 8,
      bytesPerRow: bytesPerRow,
      space: CGColorSpaceCreateDeviceGray(),
      bitmapInfo: CGImageAlphaInfo.none.rawValue
    )!
    
    let ciContext = CIContext(options: nil)
    guard let cgImage = ciContext.createCGImage(self, from: self.extent) else {
      fatalError("Failed to create CGImage from CIImage.")
    }
  
    context.draw(cgImage, in: self.extent)
    return context
  }
}

// An extension of CGContext to add a method for getting pixel values.
extension CGContext {
  /// Get the pixel value at the specified x and y coordinates.
  ///
  /// - Parameters:
  ///   - x: The x coordinate of the pixel.
  ///   - y: The y coordinate of the pixel.
  /// - Returns: The pixel value as UInt8.
  func getPixel(x: Int, y: Int) -> UInt8 {
    let data = self.data!
    let bytesPerRow = self.bytesPerRow
    let dataIndex = y * bytesPerRow + x
    let pixel = data.load(fromByteOffset: dataIndex, as: UInt8.self)
    return pixel
  }
}


let barcodeGenerator = BarCodeGenerator(filter: .barcode128, customCharacterSet: "123")
barcodeGenerator.printAsciiCode(from: "123")
print("\n")

let qrGenerator = BarCodeGenerator(filter: .qr)
qrGenerator.printAsciiCode(from: "Hello World")
print("\n")

let aztecCodeGenerator = BarCodeGenerator(filter: .aztec, maxSymbolsPerLine: 40)
aztecCodeGenerator.printAsciiCode(from: "123")
