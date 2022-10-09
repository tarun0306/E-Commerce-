package eshop.homedecor.shopapi.vo.helper;


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.math.BigDecimal;
import java.sql.Date;
import java.text.DecimalFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVParser;
import org.apache.commons.csv.CSVRecord;
import org.springframework.web.multipart.MultipartFile;



import eshop.homedecor.shopapi.entity.ProductInfo;
public class CSVHelper {
  public static String TYPE = "text/csv";
  static String[] HEADERs = { "ProductId","ProductName", "Price", "Stock","Description","ProductIcon","CategoryType" };
  public static boolean hasCSVFormat(MultipartFile file) {
    if (!TYPE.equals(file.getContentType())) {
      return false;
    }
    return true;
  }
  
public static List<ProductInfo> csvToTutorials(InputStream is) {
    try (BufferedReader fileReader = new BufferedReader(new InputStreamReader(is, "UTF-8")) ;
    	
		CSVParser csvParser = new CSVParser(fileReader,
            CSVFormat.DEFAULT.withFirstRecordAsHeader().withIgnoreHeaderCase().withTrim());) {
    	System.out.println("Inside tyr");
    
      List<ProductInfo> productList = new ArrayList<ProductInfo>();
      Iterable<CSVRecord> csvRecords = csvParser.getRecords();
      Date date = Date.valueOf(LocalDate.now());
      for (CSVRecord csvRecord : csvRecords) {
    	  ProductInfo product = new ProductInfo();
	  	product.setProductId(csvRecord.get("ProductId"));
    	  	product.setProductName(csvRecord.get("ProductName"));
    	  	product.setProductPrice(BigDecimal.valueOf(Double.parseDouble(csvRecord.get("Price"))));
    	  	product.setProductStock(Integer.parseInt(csvRecord.get("Stock")));
    	  	product.setProductDescription(csvRecord.get("Description"));
    	  	product.setProductStatus(0);
    	  	product.setProductIcon(csvRecord.get("ProductIcon"));
    	  	product.setCategoryType(Integer.parseInt(csvRecord.get("CategoryType")));
    	  	productList.add(product);
    	  	System.out.println(product.getProductId());
      }
      return productList;
//      for (CSVRecord csvRecord : csvRecords) {
//    	  System.out.println("inside try");
//    	  System.out.println(csvRecord);
//    	  ProductInfo p = new ProductInfo(
//    			 csvRecord.get("ProductId"),
//    			 csvRecord.get("ProductName"),
//    			 BigDecimal.valueOf(Double.valueOf(csvRecord.get("Price"))),
//    			 Integer.parseInt(csvRecord.get("Stock")),
//    			 csvRecord.get("Description"),
//    			 csvRecord.get("ProductIcon"),
//    			 Integer.parseInt(csvRecord.get("Status")),
//    			 Integer.parseInt(csvRecord.get("CaregoryType")),
//    			 date,
//    			 date);
//    			  productList.add(p);
//    			  System.out.println(productList);
//      }
//      return productList;
    } catch (IOException e) {
      throw new RuntimeException("fail to parse CSV file: " + e.getMessage());
    }
}
}
  