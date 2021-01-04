const express = require('express');
const server = express();
const cors = require('cors');
const mysql = require('mysql')
const bodyParser = require('body-parser')
const md5 = require('md5')

const pool = mysql.createPool({
    host: '127.0.0.1',
    port: 3306,
    user: 'root',
    password: '',
    database: 'bk_h',
    connectionLimit: 20
})

server.use(bodyParser.urlencoded({
    extended: false
    // 不使用第三方拓展的组件
}))

// server.use(cors({
//     origin: ['http://127.0.0.1:8080', 'http://localhost:8080','http://127.0.0.1:8081','http://localhost:8081']
// }));

//托管静态资源到public目录
server.use('/public', express.static('./public'));

//1.轮播图
//往路由器对象中添加路由
server.get('/home/banner', (req, res) => {
    pool.query(`select * from Banners`, (err, result) => {
        if (err) throw err;
        res.json(result)
    })
})

// 1.1 详情页轮播图
server.get('/details/one', (req, res) => {
    pool.query(`select * from One`, (err, result) => {
        if (err) throw err;
        res.json(result)
    })
})

// 1.2 主页的详情页
server.get('/home/details', (req, res) => {
    let pid = req.query.pid;
    // console.log(pid);
    pool.query(`select * from Product where pid = ${pid}`, (err, result) => {
        if (err) throw err;
        res.json(result)
    });
})

// 搜索页面
server.get('/search',(req,res) => {
    let keyword = req.query.keyword;
    // console.log(`select * from Product where title like '%${keyword}%'`)
    pool.query(`select * from Product where title like '%${keyword}%'`,(err,result) => {
        if (err) throw err;
        console.log(result);
        res.json(result);
    })
})

//2.1L
server.get('/home/Bestsell', (req, res) => {
    pool.query(`select * from Bestsell`, (err, result) => {
        if (err) throw err;
        res.json(result)
    })
})


//3. series
server.get('/home/Series', (req, res) => {
    pool.query(`select * from Series`, (err, result) => {
        if (err) throw err;
        res.json(result)
    })
})


// 分页接口
server.get('/home/product',(req,res) => {
    // 获取地址栏URL参数 --- 文章分类ID
    // let id = req.query.pid;
    // 获取地址栏URL参数 --- 页码
    let page = req.query.page;
    // 每页显示的记录数量
    let pagesize = 10; 
    // 根据当前的页码,并且结合LIMIT语句的标准公
    // 式来计算机出offset参数值
    let offset = (page - 1) * pagesize;
    //执行SQL语句,以获取总记录数
    let sql = 'SELECT * FROM Product';
    // 声明变量，用于储存总记录数
    let rowcount;
    // console.log("2222");
    pool.query(sql,(error,results) => {
        // console.log("11111");
        if (error) throw error;
        // console.log(results.length);
        rowcount = results.length;
        //计算出总页数
        let pagecount = Math.ceil(rowcount / pagesize);
        // 查找特定分类下包含的数据
        let sql2 = 'SELECT * FROM Product LIMIT ?,?'; 
        // console.log(sql2)
        // 执行SQL查询
        pool.query(sql2,[offset,pagesize],(error,results) => {
            if (error) throw error;
            // console.log(results)
            res.json({
              code: 200,
              message: "查询成功",
              results: results,
              pagecount: pagecount
            });
        })
    })
})

// 购物车接口
server.get('/proinfo',(req,res) => {
    let pid = req.query.pid;
    // console.log(pid)
    pool.query('select * from Product where pid = ?',[pid],(err,result) => {
        if (err) throw err;
        res.send(result)
    })
})
// insert user-cart
// server.post('/usercart',(req,res) => {
//     var data = qs.parse(req.body).cartList
//     console.log(data);
//     for(var i in data){
//         pool.query('insert into Product(pid,title,price) values (?,?,?)',[data[i].pid,data[i].title,data[i].price],(err,result) => {
//             if (err) throw err;
//         })
//     }
//     res.send({code:'200',msg:'可进行结算'})
// })
// // get cart-list
// server.post('/cartlist',(req,res) => {
//     let userid =req.body.pid;
//     pool.query('select * from Product where pid=?',[userid],(err,result) => {
//         if(err) throw err;
//         console.log('cartlist',result);
//         res.send(result)
//     })
// })




// 用户登录的接口
server.post('/login', (req, res) => {
    //  获取用户输入的用户名和密码信息
    let username = req.body.username;
    let password = md5(req.body.password);
    // console.log(username);
    // console.log(password);
    // 现在要以输入的用户名和密码为条件进行查找
    let sql = 'SELECT * from user WHERE username=? and password=?';
    pool.query(sql, [username, password], (error, result) => {
        if (error) throw error;
        // 如果找到,则代表用户名登录成功
        if (result.length > 0) {
            // console.log(result)
            res.send({ message: '登录成功', code: 1, info: result[0] })
        } else {  // 否则代表用户登录失败
            res.send({ message: "登录失败", code: 0 })
            console.log(result)

        }
    })
})

// 用户注册的接口
// 需要body-parser中间件,故需要安装body-parser,在服务器端执行npm install --save body-parser即可
server.post('/register', (req, res) => {
    // 接收用户以post方式提交的数据
    let username = req.body.username;
    let password = req.body.password;
    // console.log(username)
    // console.log(md5(password))
    let sql = 'SELECT * from user WHERE username=?';
        pool.query(sql,[username],(error,result)=>{
            if (error) throw error;
            if(result.length == 0){
                // 将相关信息写入到用户数据表
                sql = 'INSERT INTO user(username,password) VALUES(?,MD5(?))';
                pool.query(sql,[username,password],(error,result)=>{
                    if (error) throw error;
                    res.send({message:'注册成功',code:1})
                })
            }else{
                // 产生合理的错误信息到客户端
                res.send({message:'用户名已存在',code:0})
            }
        })
})

server.listen(5050, () => {
    console.log(`server is running...`)
})                                                                              