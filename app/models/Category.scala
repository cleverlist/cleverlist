/*package models

import reactivemongo.bson.{BSONDocumentWriter, BSONDocument, BSONDocumentReader, BSONObjectID}

/**
 * Created with IntelliJ IDEA.
 * User: sdj
 * Date: 19/10/13
 * Time: 03:29
 * To change this template use File | Settings | File Templates.
 */
case class Category(
  id: Option[BSONObjectID],
  name: String)

object Category {
  implicit object CategoryBSONReader extends BSONDocumentReader[Category] {
    def read(doc: BSONDocument): Category =
      Category(
        doc.getAs[BSONObjectID]("_id"),
        doc.getAs[String]("name").get)
  }

  implicit object CategoryBSONWriter extends BSONDocumentWriter[Category] {
    def write(category: Category): BSONDocument =
      BSONDocument(
        "_id" -> category.id.getOrElse(BSONObjectID.generate),
        "name" -> category.name)
  }
}
*/