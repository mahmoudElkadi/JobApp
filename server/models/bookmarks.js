const mongoose = require('mongoose');

const bookmarksSchema=new mongoose.Schema(
    {
        job:{
          type:String,
          required:true
        },
        userId:{
            type:String,
            required:true
          },
          title:{
            type:String,
            required:true
          },
          imageUrl:{
            type:String,
            default:"https://w7.pngwing.com/pngs/177/551/png-transparent-user-interface-design-computer-icons-default-stephen-salazar-graphy-user-interface-design-computer-wallpaper-sphere-thumbnail.png"
          },
          company:{
            type:String,
            required:true
          },
        location:{
          type:String,
          required:true
        },
      },
      {timestamps:true}
);

const bookmarksModel=mongoose.model("Bookmarks",bookmarksSchema)

module.exports=bookmarksModel;
