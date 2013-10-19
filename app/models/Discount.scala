/*package models

import reactivemongo.bson.{BSONDocumentWriter, BSONDocument, BSONDocumentReader, BSONObjectID}

case class Discount(
  id: Option[BSONObjectID],
  brand: String,
  categoryId: Long,
  discount: Int)

object Discount {
  implicit object DiscountBSONReader extends BSONDocumentReader[Discount] {
    def read(doc: BSONDocument): Discount =
      Discount(
        doc.getAs[BSONObjectID]("_id"),
        doc.getAs[String]("brand").get,
        doc.getAs[Long]("categoryId").get,
        doc.getAs[Int]("discount").get)
  }

  implicit object CategoryBSONWriter extends BSONDocumentWriter[Discount] {
    def write(discount: Discount): BSONDocument =
      BSONDocument(
        "_id" -> discount.id.getOrElse(BSONObjectID.generate),
        "brand" -> discount.brand,
        "categoryId" -> discount.categoryId,
        "discount" -> discount.discount)
  }
}
*/