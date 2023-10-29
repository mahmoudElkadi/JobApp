const bookmarksRouter=require('express').Router();
const {createBookmarks,updateBookmarks,deleteBookmarks,getBookmarks,getAllBookmarks}=require("./controller/bookmarks.controller")
const{verifyAndauth,verifyAndauthAdmin}=require('../../middleware/verifyToken')

 bookmarksRouter.post("/",verifyAndauthAdmin,createBookmarks)
 bookmarksRouter.put("/:id",verifyAndauthAdmin,updateBookmarks)
 bookmarksRouter.delete("/:id",verifyAndauthAdmin,deleteBookmarks)
 bookmarksRouter.get("/:userId",verifyAndauthAdmin,getBookmarks)
bookmarksRouter.get("/",verifyAndauthAdmin,getAllBookmarks)

module.exports=bookmarksRouter