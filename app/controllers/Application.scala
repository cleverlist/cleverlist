package controllers
/*
import play.api.mvc._
import play.modules.reactivemongo.{ MongoController, ReactiveMongoPlugin }

import reactivemongo.api.collections.default.BSONCollection
import reactivemongo.bson._

import scala.concurrent.ExecutionContext.Implicits.global

import models.ProductList
import play.api.libs.json.{Json, JsObject}

object ProductLists extends Controller with MongoController {
  val collection = db[BSONCollection]("productlists")

  def getAll() = Action {
    Async {
      val query = BSONDocument()
      val found = collection.find(query).cursor[ProductList]
      val futurePersonsJsonArray = found.toList()
      futurePersonsJsonArray.map { persons =>
        System.out.println(persons)
        Ok(persons.toString)
      }
    }
  }
}

object Discounts extends Controller with MongoController {
  val collection = db[BSONCollection]("discounts")
}

*/

import com.mongodb.casbah.Imports._
import com.mongodb.casbah.commons.MongoDBObject
import com.mongodb.casbah.commons.BaseImports._
import com.mongodb.casbah.Implicits._
import com.mongodb.DBObject
import com.mongodb.util.JSON;


import play.api.mvc._
import play.api.libs.json.Json

object ProductLists extends Controller {

  val coll = MongoClient("localhost", 27017)("db")("productlists")

  // gets all lists from user
  /*def getAll() = Action {
    implicit request =>

      val allDocs = coll.find()
      for(doc <- allDocs) println(doc)

      println ("-----------------------")

      val q = MongoDBObject("products.name" -> "shampooing")
      val json = "%s".format(
        coll.find(q).toList.mkString(",")
      )

      println(json)

      Ok(json).as("application/json")
  }      */

  def addProduct(id: Long, name: String) = Action {

    val a =  Discounts.coll.findOne(MongoDBObject("category" -> name))

    val q = MongoDBObject("user_id" -> id)

    val u = $push("products" -> MongoDBObject("name" -> name, "quantity" -> 1, "category_name" -> name, "has_discounts" -> a.isDefined))

    coll.update(q, u)

    Ok(coll.findOne(MongoDBObject("user_id" -> id)).get.toString()).as("application/json")
  }

  def getList(userId: Long) = Action {

    val q = MongoDBObject("user_id" -> userId)

    val json = "%s".format(
      coll.find(q).toList.mkString(",")
    )

    Ok(json).as("application/json")
  }

  // saves a new product list
  def save() = Action {
    implicit request =>

      val savedata = com.mongodb.util.JSON.parse(Json.stringify(request.body.asJson.get)).asInstanceOf[DBObject]
      coll.save(savedata)

      Ok("{\"id\" : %s}".format(savedata.get("_id"))).as("application/json")
  }

}

object Discounts extends Controller {

  val coll = MongoClient("localhost", 27017)("db")("discounts")

  // finds discount from category
  def findAll(id: String) = Action {
    implicit request =>

      val q = MongoDBObject("category" -> id)

      println("TEST")

      val json = "[%s]".format(
        coll.find(q).toList.mkString(",")
      )

      Ok(json).as("application/json")
  }
}

object Categories extends Controller {
  val coll = MongoClient("localhost", 27017)("db")("categories")

  def all() = Action {

    val allDocs = coll.find()
    val json = "%s".format(
      allDocs.toList.mkString(",")
    )

    Ok(json).as("application/json")
  }
}

object UserManagement extends Controller {
  val coll = MongoClient("localhost", 27017)("db")("users")


}