var basePath = "/home/dockerfront/";
var config = {
    src: basePath + "input/images/*.gif",
    build: {
        stylus: basePath + "output/stylus/",
        image: basePath + "output/static/img"
    },
    options: {
        algorithm: 'binary-tree',
        imgName: 'demo.png',
        cssName: 'demo.styl',
        imgPath: './demo.png'
    }
};

module.exports=config;
