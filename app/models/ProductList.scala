/*package models

import org.jboss.netty.buffer._
import org.joda.time.DateTime
import play.api.data._
import play.api.data.Forms._
import play.api.data.format.Formats._
import play.api.data.validation.Constraints._

import reactivemongo.bson._

case class Product(
  name: String,
  quantity: Int,
  categoryId: Long,
  discountId: Long)

case class ProductList(
  id: Option[BSONObjectID],
  products: List[Product])

object Product {
  implicit object ProductBSONReader extends BSONDocumentReader[Product] {
    def read(doc: BSONDocument): Product =
      Product(
        doc.getAs[String]("name").get,
        doc.getAs[Int]("quantity").get,
        doc.getAs[Long]("categoryId").get,
        doc.getAs[Long]("discountId").get)
  }

  implicit object ProductBSONWriter extends BSONDocumentWriter[Product] {
    def write(product: Product): BSONDocument =
      BSONDocument(
        "name" -> product.name,
        "quantity" -> product.quantity,
        "categoryId" -> product.categoryId,
        "discountId" -> product.discountId)
  }
}

object ProductList {
  implicit object ProductListBSONReader extends BSONDocumentReader[ProductList] {
    def read(doc: BSONDocument): ProductList =
      ProductList(
        doc.getAs[BSONObjectID]("_id"),
        doc.getAs[List[Product]]("products").toList.flatten)
  }

  implicit object ProductListBSONWriter extends BSONDocumentWriter[ProductList] {
    def write(productList: ProductList): BSONDocument =
      BSONDocument(
        "_id" -> productList.id.getOrElse(BSONObjectID.generate),
        "products" -> productList.products)
  }
}
*/