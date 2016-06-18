var gulp = require("gulp");
var config = require('/usr/local/share/config/Configfile.js');
var spritesmith = require("gulp.spritesmith");

gulp.task("default", function(){
    var spriteSelf = gulp.src(config.src)
            .pipe(spritesmith(config.options));
    spriteSelf.img.pipe(gulp.dest(config.build.image));
    spriteSelf.css.pipe(gulp.dest(config.build.stylus));
    return spriteSelf;
});
