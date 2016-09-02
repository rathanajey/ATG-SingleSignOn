
package atg.commerce.pricing;

import java.util.Locale;
import java.util.Map;
import atg.commerce.order.CommerceItem;

import atg.commerce.pricing.priceLists.ItemPriceCalculator;
import atg.repository.RepositoryItem;

/**
 * A sample price pre-calculator which shows how we can 
 * customize ATG pricing service
 *
 * @author 
 * 
 */
public class TestPriceCalculator 
  extends ItemPriceCalculator
{

/**
 *  
 * @param pPriceQuote ItemPriceInfo representing the current price quote for the item
 * @param pItem The item to price
 * @param pPricingModel A RepositoryItem representing a PricingModel
 * @param pLocale the locale in which this item should be priced
 * @param pProfile The user's profile
 * @param pExtraParameters A Map of extra parameters to be used in the pricing, may be null
 * @exception PricingException if there was a problem pricing the input pItem
 */
public void priceItem(ItemPriceInfo itemPriceInfo, CommerceItem pItem,
		RepositoryItem pPricingModel, Locale pLocale, RepositoryItem pProfile, Map pExtraParameters)
		throws PricingException {
	try {
    	
	      double pPrice = 2000;
	      //double totalPrice = pPrice * pItem.getQuantity();
	      double totalPrice = 100;
	      double listPrice = pPrice;

	      if (isLoggingDebug()) {
	        logDebug("input price: " + pPrice);
	        logDebug("quantity: " + pItem.getQuantity());
	        logDebug("item price: " + totalPrice);
	        logDebug("rounding item price.");
	      }

	      totalPrice = getPricingTools().round(totalPrice);
	      listPrice = getPricingTools().round(listPrice);
	      System.out.println("totalPrice........"+totalPrice);
	      System.out.println("listPrice........"+listPrice);

	      if (isLoggingDebug()) {
			logDebug("rounded total price to: " + totalPrice);
			logDebug("rounded item list price to: " + listPrice);
	      }

	      // set the total price of the item before discounts, this will be unaffected by later calcs
	      itemPriceInfo.setRawTotalPrice(totalPrice);

	      // set the itempriceInfo's list price attribute to the input price
	      itemPriceInfo.setListPrice(listPrice);

	      // set the ItemPriceInfo's amount to the above price
	      itemPriceInfo.setAmount(totalPrice);
	      
	      System.out.println("itemPriceInfo.getListPrice............"+ itemPriceInfo.getListPrice());
	      System.out.println("itemPriceInfo.setAmount............"+ itemPriceInfo.getAmount());

	    }
	    catch (Exception e) {}
	
}


} // end of class


