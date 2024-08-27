const express = require('express');// 引入express
const bodyParser = require('body-parser');// 用于接收post数据
const cors = require('cors');// 创建服务器对象
const mysql = require('mysql2');// 引入 MySQL 数据库驱动
const path = require('path');// 处理文件路径
const jwt = require('jsonwebtoken'); // 引入jsonwebtoken
const multer = require('multer'); // 用于处理文件上传

// 创建服务器对象
const app = express();
const port = 4000;

app.use(express.json());// 使用 express 内置的 json 中间件来解析 JSON 请求体
app.use(cors()); // 使用 cors 中间件,解决跨域

// 配置数据库连接
const db = mysql.createConnection({
    host: 'localhost',
    user: 'root', // 数据库用户名
    password: 'fym416315', // 数据库密码
    database: 'neverland',
    multipleStatements: true,
    port: 3306
});

// 连接到数据库
db.connect(error => {
    if (error) {
        console.error('数据库连接错误:', error.stack);
        return;
    }
    console.log('数据库已连接.');
});

//范娱萌----------------------------------------------------------------------------
//modify.html
// 提供静态文件服务
app.use('/images', express.static(path.join(__dirname, 'image')));// 将 '/images' 路径映射到本地 'image' 文件夹下，用于提供静态文件服务
// 配置multer用于文件上传（用户头像）
const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, 'image/profile_photo'); // 指定文件存储的目录
    },
    filename: function (req, file, cb) {
        const userId = req.body.user_id; // 获取用户ID
        const fileExt = path.extname(file.originalname); // 获取文件的扩展名
        cb(null, `${userId}${fileExt}`); // 以用户ID命名文件
    }
});

const upload = multer({ storage: storage }); // 创建Multer实例，并将其配置为使用指定的存储选项

// 登录接口
app.post("/login", (req, res) => {
    var userName = req.body.userName;
    var passWord = req.body.passWord;
    if (!userName || !passWord) {
        res.send({
            code: 0,
            msg: "用户名与密码为必传参数...",
        });
        return;
    }
    const sqlStr = "SELECT * FROM user WHERE user_name=? AND password=?";
    db.query(sqlStr, [userName, passWord], (err, result) => {
        if (err) throw err;
        if (result.length > 0) {
            // 生成token
            var token = jwt.sign(
                {
                    user_id: result[0].user_id,
                    userName: result[0].user_name,
                    profilePhoto: result[0].profile_photo // 添加头像信息
                },
                "secret",
                { expiresIn: "1h" },
            );
            console.log(token);
            res.send({ code: 1, msg: "登录成功", token: token, user: result[0] });
        } else {
            res.send({ code: 0, msg: "用户名或密码错误" });
        }
    });
});

// 注册接口
app.post("/register", (req, res) => {
    var userName = req.body.userName;
    var passWord = req.body.passWord;
    var profilePhoto = 'image/default-profile.png'; // 使用默认头像路径
    if (!userName || !passWord) {
        res.send({
            code: 0,
            msg: "用户名与密码为必传参数...",
        });
        return;
    }
    if (userName && passWord) {
        const result = `SELECT * FROM user WHERE user_name = ?`;
        db.query(result, [userName], (err, results) => {
            if (err) throw err;
            if (results.length >= 1) {
                // 如果有相同用户名，则注册失败，用户名重复
                res.send({ code: 0, msg: "注册失败，用户名重复" });
            } else {
                const sqlStr = "INSERT INTO user(user_name, password, profile_photo) VALUES(?, ?, ?)";
                db.query(sqlStr, [userName, passWord, profilePhoto], (err, results) => {
                    if (err) throw err;
                    if (results.affectedRows === 1) {
                        res.send({ code: 1, msg: "注册成功" });
                    } else {
                        res.send({ code: 0, msg: "注册失败" });
                    }
                });
            }
        });
    }
    console.log("接收", req.body);
});
//modify.html
// 处理用户信息更新请求的路由
app.post("/updateProfile", upload.single('profile_photo'), (req, res) => {
    const userId = req.body.user_id; // 从请求中获取用户ID
    const newUserName = req.body.user_name; // 从请求中获取新的用户名
    const profilePhoto = req.file ? `image/profile_photo/${req.file.filename}` : null; // 如果有上传文件，获取新的头像路径

    if (!newUserName) { // 检查用户名是否为空
        res.send({ code: 0, msg: "用户名不能为空" }); 
        return;
    }

    // 查询数据库中是否存在相同用户名且不同用户ID的记录
    db.query("SELECT * FROM user WHERE user_name = ? AND user_id != ?", [newUserName, userId], (err, results) => {
        if (err) throw err; 
        if (results.length > 0) { 
            res.send({ code: 0, msg: "用户名已存在" });
        } else {
            let sqlStr = "UPDATE user SET user_name = ?"; // 更新用户名的SQL语句
            let params = [newUserName]; // SQL语句的参数
            if (profilePhoto) { // 如果有新的头像
                sqlStr += ", profile_photo = ?"; // 将头像更新加入SQL语句
                params.push(profilePhoto); // 将新的头像路径加入参数
            }
            sqlStr += " WHERE user_id = ?"; // 指定更新条件
            params.push(userId); // 将用户ID加入参数

            // 执行更新操作
            db.query(sqlStr, params, (err, results) => {
                if (err) throw err; // 处理更新错误
                if (results.affectedRows === 1) { // 如果更新成功
                    res.send({ code: 1, msg: "用户信息更新成功", profile_photo: profilePhoto }); // 返回成功消息并包含新的头像路径
                } else {
                    res.send({ code: 0, msg: "用户信息更新失败" }); // 返回失败消息
                }
            });
        }
    });
});

//checkpoint.html
// 获取checkpoints表所有打卡点信息的接口，连同图片信息
app.get("/checkpoints", (req, res) => {
    const sqlStr = `
        SELECT c.*, ci.image_url 
        FROM checkpoints c 
        LEFT JOIN checkpoint_images ci 
        ON c.checkpoint_id = ci.checkpoint_id
    `;
    db.query(sqlStr, (err, results) => {
        if (err) {
            res.status(500).json({ code: 0, message: "服务器错误" });
            return;
        }
        
        // 按照 checkpoint_id 进行分组，将相同 checkpoint 的图片放在一起
        const data = results.reduce((acc, row) => {
            const checkpoint = acc.find(cp => cp.checkpoint_id === row.checkpoint_id);
            if (checkpoint) {
                if (row.image_url) {
                    checkpoint.images.push(row.image_url);
                }
            } else {
                acc.push({
                    checkpoint_id: row.checkpoint_id,
                    name: row.name,
                    description: row.description,
                    latitude: row.latitude,
                    longitude: row.longitude,
                    likes_count: row.likes_count,
                    artist: row.artist,
                    images: row.image_url ? [row.image_url] : []
                });
            }
            return acc;
        }, []);

        res.json({
            code: 1,
            message: "Checkpoints retrieved successfully",
            data: data
        });
    });
});


// 获取指定用户的收藏 checkpoint_id 列表
app.get("/user_favorites/:userId", (req, res) => {
    
    // 从 URL 路径参数中提取用户 ID
    const userId = req.params.userId;
    
    // 定义 SQL 查询字符串，用于从 user_favorites 表中获取该用户的收藏记录
    const sqlStr = "SELECT checkpoint_id FROM user_favorites WHERE user_id = ?";
    
    // 执行数据库查询，使用用户 ID 作为查询参数
    db.query(sqlStr, [userId], (err, results) => {
        
        // 如果查询过程中出现错误，抛出异常并停止执行
        if (err) throw err;
        
        // 从查询结果中提取 checkpoint_id 列表
        // 使用 map 方法遍历结果集，将每个结果中的 checkpoint_id 提取出来形成一个新数组
        const favoriteIds = results.map(result => result.checkpoint_id);
        
        // 返回 JSON 格式的响应，包含一个 code 字段表示操作成功，和一个 favorites 字段包含用户收藏的 checkpoint_id 列表
        res.json({
            code: 1,  // 表示操作成功的状态码
            favorites: favoriteIds  // 包含所有收藏的 checkpoint_id 的数组
        });
    });
});

//收藏功能
app.post('/favorite', (req, res) => {
    const { user_id, checkpoint_id } = req.body;

    // 检查是否已经收藏
    const checkFavoriteQuery = 'SELECT * FROM user_favorites WHERE user_id = ? AND checkpoint_id = ?';
    db.query(checkFavoriteQuery, [user_id, checkpoint_id], (err, results) => {
        if (err) throw err;

        if (results.length > 0) {
            // 已经收藏，执行取消收藏操作
            const deleteFavoriteQuery = 'DELETE FROM user_favorites WHERE user_id = ? AND checkpoint_id = ?';
            db.query(deleteFavoriteQuery, [user_id, checkpoint_id], (err, results) => {
                if (err) {
                    res.send({ code: 0, msg: '操作失败' });
                    throw err;
                }
                res.send({ code: 2, msg: '已取消收藏' });
            });
        } else {
            // 插入新收藏
            const insertFavoriteQuery = 'INSERT INTO user_favorites (user_id, checkpoint_id) VALUES (?, ?)';
            db.query(insertFavoriteQuery, [user_id, checkpoint_id], (err, results) => {
                if (err) {
                    res.send({ code: 0, msg: '操作失败' });
                    throw err;
                }

                if (results.affectedRows === 1) {
                    res.send({ code: 1, msg: '收藏成功' });
                } else {
                    res.send({ code: 0, msg: '操作失败' });
                }
            });
        }
    });
});

//热力JSON数据
app.get('/heatdata', (req, res) => {
    const sql = 'SELECT latitude, longitude, likes_count FROM checkpoints';
    db.query(sql, (err, results) => {
        if (err) throw err;
        res.json(results);
    });
});
    
//获取帖子
app.get('/posts', (req, res) => {
    let sql = `
        SELECT posts.post_id, posts.content, posts.publish_time, posts.location, posts.likes_count, posts.checkpoint_id, posts.user_id, post_images.image_url
        FROM posts
        LEFT JOIN post_images ON posts.post_id = post_images.post_id
    `;

    db.query(sql, (err, results) => {
        if (err) {
            console.error('数据库查询失败:', err);
            res.status(500).json({ error: '数据库查询失败' });
            return;
        }

        // 处理结果，将相同帖子ID的图片合并到一个数组中
        const posts = {};
        results.forEach(row => {
            if (!posts[row.post_id]) {
                posts[row.post_id] = {
                    post_id: row.post_id,
                    content: row.content,
                    publish_time: row.publish_time,
                    location: row.location,
                    likes_count: row.likes_count,
                    checkpoint_id: row.checkpoint_id,
                    user_id: row.user_id,
                    images: []
                };
            }
            if (row.image_url) {
                posts[row.post_id].images.push(row.image_url);
            }
        });

        res.json({
            code: 1,
            message: "Posts retrieved successfully",
            data: Object.values(posts)  // 转换为数组形式
        });
    });
});



//home.html

// 获取用户赞过的帖子
app.get('/likedPosts/:userId', (req, res) => {
    const userId = req.params.userId;
    const sqlStr = `
        SELECT p.post_id, p.content, p.location, p.publish_time, pi.image_url 
        FROM likes l 
        JOIN posts p ON l.post_id = p.post_id 
        LEFT JOIN post_images pi ON p.post_id = pi.post_id 
        WHERE l.user_id = ?
    `;
    db.query(sqlStr, [userId], (err, results) => {
        if (err) {
            res.status(500).json({ code: 0, message: "服务器错误" });
            return;
        }
        
        // 将相同 post_id 的图片聚合到一起
        const data = results.reduce((acc, row) => {
            const post = acc.find(pt => pt.post_id === row.post_id);
            if (post) {
                if (row.image_url) {
                    post.images.push(row.image_url);
                }
            } else {
                acc.push({
                    post_id: row.post_id,
                    content: row.content,
                    location: row.location,
                    publish_time: row.publish_time,
                    images: row.image_url ? [row.image_url] : []
                });
            }
            return acc;
        }, []);

        res.json({
            code: 1,
            message: "Liked posts retrieved successfully",
            data: data
        });
    });
});

// 获取用户收藏的帖子
app.get('/favoritePosts/:userId', (req, res) => {
    const userId = req.params.userId;
    const sqlStr = `
        SELECT p.post_id, p.content, p.location, p.publish_time, pi.image_url 
        FROM user_favorites uf 
        JOIN posts p ON uf.post_id = p.post_id 
        LEFT JOIN post_images pi ON p.post_id = pi.post_id 
        WHERE uf.user_id = ?
    `;
    db.query(sqlStr, [userId], (err, results) => {
        if (err) {
            res.status(500).json({ code: 0, message: "服务器错误" });
            return;
        }
        
        const data = results.reduce((acc, row) => {
            const post = acc.find(pt => pt.post_id === row.post_id);
            if (post) {
                if (row.image_url) {
                    post.images.push(row.image_url);
                }
            } else {
                acc.push({
                    post_id: row.post_id,
                    content: row.content,
                    location: row.location,
                    publish_time: row.publish_time,
                    images: row.image_url ? [row.image_url] : []
                });
            }
            return acc;
        }, []);

        res.json({
            code: 1,
            message: "Favorite posts retrieved successfully",
            data: data
        });
    });
});

// 获取用户收藏的地点及其相关图片信息
app.get("/favoritePlaces/:userId", (req, res) => {
    const userId = req.params.userId;
    const sqlStr = `
        SELECT c.checkpoint_id, c.name, c.description, ci.image_url 
        FROM user_favorites uf 
        JOIN checkpoints c ON uf.checkpoint_id = c.checkpoint_id 
        LEFT JOIN checkpoint_images ci ON c.checkpoint_id = ci.checkpoint_id 
        WHERE uf.user_id = ?
    `;

    db.query(sqlStr, [userId], (err, results) => {
        if (err) {
            res.status(500).json({ code: 0, message: "服务器错误" });
            return;
        }

        // 按照 checkpoint_id 进行分组，将相同 checkpoint 的图片放在一起
        const data = results.reduce((acc, row) => {
            const place = acc.find(cp => cp.checkpoint_id === row.checkpoint_id);
            if (place) {
                if (row.image_url) {
                    place.images.push(row.image_url);
                }
            } else {
                acc.push({
                    checkpoint_id: row.checkpoint_id,
                    name: row.name,
                    description: row.description,
                    images: row.image_url ? [row.image_url] : []
                });
            }
            return acc;
        }, []);

        res.json({
            code: 1,
            message: "Favorite places retrieved successfully",
            data: data
        });
    });
});

//获取用户发布的帖子
app.get('/myPosts/:userId', (req, res) => {
    const userId = req.params.userId;
    const sqlStr = `
        SELECT p.post_id, p.content, p.location, p.publish_time, pi.image_url 
        FROM posts p 
        LEFT JOIN post_images pi ON p.post_id = pi.post_id 
        WHERE p.user_id = ?
    `;
    db.query(sqlStr, [userId], (err, results) => {
        if (err) {
            res.status(500).json({ code: 0, message: "服务器错误" });
            return;
        }
        
        const data = results.reduce((acc, row) => {
            const post = acc.find(pt => pt.post_id === row.post_id);
            if (post) {
                if (row.image_url) {
                    post.images.push(row.image_url);
                }
            } else {
                acc.push({
                    post_id: row.post_id,
                    content: row.content,
                    location: row.location,
                    publish_time: row.publish_time,
                    images: row.image_url ? [row.image_url] : []
                });
            }
            return acc;
        }, []);

        res.json({
            code: 1,
            message: "User's posts retrieved successfully",
            data: data
        });
    });
});

// 取消收藏的地点
app.delete('/unfavoritePlace/:checkpointId', (req, res) => {
    const checkpointId = req.params.checkpointId;
    const userId = req.body.userId;  // 从请求体中获取userId

    if (!userId) {
        res.status(400).json({ code: 0, message: '缺少用户ID' });
        return;
    }

    const sqlStr = 'DELETE FROM user_favorites WHERE checkpoint_id = ? AND user_id = ?';
    db.query(sqlStr, [checkpointId, userId], (err, result) => {
        if (err) {
            console.error('取消收藏错误:', err);
            res.status(500).json({ code: 0, message: '服务器错误' });
            return;
        }
        res.json({ code: 1, message: '地点已取消收藏' });
    });
});

// 删除用户发布的帖子
app.delete('/deletePost/:postId', (req, res) => {
    const postId = req.params.postId;
    const userId = req.body.userId;  // 确保在请求中发送userId

    if (!userId) {
        res.status(400).json({ code: 0, message: '缺少用户ID' });
        return;
    }

    console.log(`Deleting post with ID: ${postId} for user ID: ${userId}`);

    // 先删除与该帖子相关的所有评论
    const deleteCommentsSql = 'DELETE FROM comments WHERE post_id = ?';
    db.query(deleteCommentsSql, [postId], (err, result) => {
        if (err) {
            console.error('删除评论错误:', err);
            res.status(500).json({ code: 0, message: '服务器错误' });
            return;
        }

        console.log(`Deleted ${result.affectedRows} comments for post ID: ${postId}`);

        // 然后删除与该帖子相关的所有点赞
        const deleteLikesSql = 'DELETE FROM likes WHERE post_id = ?';
        db.query(deleteLikesSql, [postId], (err, result) => {
            if (err) {
                console.error('删除likes错误:', err);
                res.status(500).json({ code: 0, message: '服务器错误' });
                return;
            }

            console.log(`Deleted ${result.affectedRows} likes for post ID: ${postId}`);

            // 删除与该帖子相关的所有图像
            const deleteImagesSql = 'DELETE FROM post_images WHERE post_id = ?';
            db.query(deleteImagesSql, [postId], (err, result) => {
                if (err) {
                    console.error('删除图片错误:', err);
                    res.status(500).json({ code: 0, message: '服务器错误' });
                    return;
                }

                console.log(`Deleted ${result.affectedRows} images for post ID: ${postId}`);

                // 最后删除帖子本身
                const deletePostSql = 'DELETE FROM posts WHERE post_id = ? AND user_id = ?';
                db.query(deletePostSql, [postId, userId], (err, result) => {
                    if (err) {
                        console.error('删除帖子错误:', err);
                        res.status(500).json({ code: 0, message: '服务器错误' });
                        return;
                    }

                    console.log(`Deleted post with ID: ${postId} for user ID: ${userId}`);

                    res.json({ code: 1, message: '帖子已删除' });
                });
            });
        });
    });
});




//胡冰-----------------------------------------------------------
// 提供静态文件服务
app.use('/images', express.static(path.join(__dirname, 'image')));// 将 '/images' 路径映射到本地 'image' 文件夹下，用于提供静态文件服务

// 配置multer用于文件上传（帖子图片）
const postImageStorage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, 'image/post_images'); // 将文件存储到 'image/post_images' 目录
    },
    filename: function (req, file, cb) {
        const fileExt = path.extname(file.originalname); // 获取文件的扩展名
        cb(null, Date.now() + fileExt); // 使用时间戳加文件扩展名命名文件
    }
});

// 配置multer实例处理多文件上传
const postImageUpload = multer({ storage: postImageStorage }).array('images[]', 10); // 接受最多10张图片

// 假设此函数实现了地理编码功能，返回一个对象包含纬度和经度
const geocodeLocation = async (location) => {
    // 示例实现，需替换为实际的地理编码服务调用
    return {
        latitude: 39.9042,
        longitude: 116.4074
    };
};

// 保存帖子接口
app.post('/savePost', (req, res) => {
    postImageUpload(req, res, function (err) {
        if (err instanceof multer.MulterError) {
            return res.status(400).json({ code: 0, msg: '文件上传错误: ' + err.message });
        } else if (err) {
            return res.status(500).json({ code: 0, msg: '服务器错误: ' + err.message });
        }

        const { title, content, location, latitude, longitude, publish_time, user_id } = req.body;

        // 如果地理位置为空，调用地理编码函数获取经纬度
        if (!latitude || !longitude) {
            geocodeLocation(location).then(coords => {
                processPost(coords.latitude, coords.longitude);
            }).catch(error => {
                console.error('地理编码错误:', error);
                res.status(500).json({ code: 0, msg: '地理编码失败' });
            });
        } else {
            processPost(latitude, longitude);
        }

        function processPost(lat, lng) {
            // 地点名称存入checkpoints作为name
            const processedLocation = title;

            // 先查找checkpoints表中的数据
            const findCheckpointSql = "SELECT checkpoint_id FROM checkpoints WHERE latitude = ? AND longitude = ?";
            db.query(findCheckpointSql, [lat, lng], (err, results) => {
                if (err) {
                    console.error('数据库查询错误:', err);
                    res.status(500).json({ code: 0, msg: '数据库查询失败' });
                    return;
                }

                let checkpointId;

                if (results.length > 0) {
                    checkpointId = results[0].checkpoint_id;
                } else {
                    const insertCheckpointSql = "INSERT INTO checkpoints (name, latitude, longitude) VALUES (?, ?, ?)";
                    db.query(insertCheckpointSql, [processedLocation, lat, lng], (err, insertResult) => {
                        if (err) {
                            console.error('数据库插入错误:', err);
                            res.status(500).json({ code: 0, msg: '保存新位置失败' });
                            return;
                        }
                        checkpointId = insertResult.insertId;
                        savePostToDatabase(checkpointId);
                    });
                    return;
                }

                savePostToDatabase(checkpointId);
            });
        }

        function savePostToDatabase(checkpointId) {
            const postSqlStr = "INSERT INTO Posts (user_id, content, location, publish_time, checkpoint_id) VALUES (?, ?, ?, ?, ?)";
            const postParams = [user_id, content, location, publish_time, checkpointId];

            db.query(postSqlStr, postParams, (err, result) => {
                if (err) {
                    console.error('数据库插入错误:', err);
                    res.status(500).json({ code: 0, msg: '保存帖子失败' });
                    return;
                }

                const postId = result.insertId; // 获取插入的post_id

                // 将图片路径存储到post_images表中
                const images = req.files.map(file => `/image/post_images/${file.filename}`);
                if (images.length > 0) {
                    const imageSqlStr = "INSERT INTO post_images (post_id, image_url) VALUES ?";
                    const imageValues = images.map(image => [postId, image]);

                    db.query(imageSqlStr, [imageValues], (err) => {
                        if (err) {
                            console.error('图片路径插入错误:', err);
                            res.status(500).json({ code: 0, msg: '保存图片路径失败' });
                            return;
                        }
                        res.json({ code: 1, msg: '帖子和图片保存成功' });
                    });
                } else {
                    res.json({ code: 1, msg: '帖子保存成功，没有图片上传' });
                }
            });
        }
    });
});

// 获取用户收藏的地点及其经纬度信息
app.get('/favoritePlaceswithlatlon/:userId', (req, res) => {
    const userId = req.params.userId;
    const sqlStr = `
        SELECT c.checkpoint_id, c.name, c.description, 
               COALESCE(c.latitude, '0.000000') AS latitude, 
               COALESCE(c.longitude, '0.000000') AS longitude
        FROM user_favorites uf 
        JOIN checkpoints c ON uf.checkpoint_id = c.checkpoint_id 
        WHERE uf.user_id = ?
    `;
    db.query(sqlStr, [userId], (err, results) => {
        if (err) {
            res.status(500).json({ code: 0, message: "服务器错误" });
            return;
        }

        console.log("查询结果:", results); // 检查结果是否包含经纬度数据

        res.json({
            code: 1,
            message: "Favorite places retrieved successfully",
            data: results
        });
    });
});

//王艺霖-------------------------------------------------------------------------

// 获取所有场馆信息
app.get('/api/venues', (req, res) => {
    let sql = 'SELECT * FROM venues';
    db.query(sql, (err, results) => {
        if (err) {
            throw err;
        }
        res.json(results);
    });
});

// 添加新的场馆信息
app.post('/api/venues', (req, res) => {
    let venue = req.body;
    let sql = 'INSERT INTO venues SET ?';
    db.query(sql, venue, (err, result) => {
        if (err) {
            throw err;
        }
        res.send('Venue added...');
    });
});

// 修改场馆信息
app.put('/api/venues/:id', (req, res) => {
    let id = req.params.id;
    let updatedVenue = req.body;
    let sql = 'UPDATE venues SET ? WHERE id = ?';
    db.query(sql, [updatedVenue, id], (err, result) => {
        if (err) {
            throw err;
        }
        res.send('Venue updated...');
    });
});

// 删除场馆信息
app.delete('/api/venues/:id', (req, res) => {
    let id = req.params.id;
    let sql = 'DELETE FROM venues WHERE id = ?';
    db.query(sql, id, (err, result) => {
        if (err) {
            throw err;
        }
        res.send('Venue deleted...');
    });
});

// 获取所有帖子信息
app.get('/api/posts', (req, res) => {
    let sql = `
        SELECT posts.post_id,posts.content, posts.publish_time, posts.location, posts.checkpoint_id,user.user_name, user.profile_photo, post_images.image_url, comments.comment_content, comments.user_post_id, comments.user_id,posts.likes_count,
        (SELECT COUNT(*) FROM likes WHERE likes.post_id = posts.post_id) as likes_count
        FROM posts 
        INNER JOIN user ON posts.user_id = user.user_id
        LEFT JOIN post_images ON posts.post_id = post_images.post_id
        LEFT JOIN comments ON posts.post_id = comments.post_id
        LEFT JOIN likes ON posts.post_id = likes.post_id
    `;

    db.query(sql, (err, results) => {
        if (err) {
            console.error('数据库查询失败:', err);
            res.status(500).json({ error: '数据库查询失败' });
            return;
        }

        const posts = {};//初始化一个空对象 posts，用于存储每个帖子的相关信息
        results.forEach(row => {//遍历数据库查询的结果集 results，其中每一条记录对应一个 row
            if (!posts[row.post_id]) {
                posts[row.post_id] = {
                    post_id: row.post_id,
                    content: row.content,
                    publish_time: row.publish_time,
                    location: row.location,
                    checkpoint_id: row.checkpoint_id,
                    user_name: row.user_name,
                    profile_photo: row.profile_photo,
                    images: new Set(), // 使用Set防止重复
                    comments: [],
                    likes_count:row.likes_count
                };
            }
            if (row.image_url) {
                posts[row.post_id].images.add(row.image_url);
            }
            if (row.comment_content && !posts[row.post_id].comments.some(c => c.user_post_id === row.user_post_id)) {
                posts[row.post_id].comments.push({
                    user_post_id: row.user_post_id,
                    user_id: row.user_id,
                    comment_content: row.comment_content,
                    user_name: row.user_name,
                    profile_photo: row.profile_photo,
                });
            }
        });

               // 将Set转换回数组
        Object.values(posts).forEach(post => {
            post.images = Array.from(post.images);
        });

        res.json(Object.values(posts));
    });
});

// 获取指定用户的点赞列表
app.get("/post_like/:userId", async(req, res) => {
    
    // 从 URL 路径参数中提取用户 ID
    const userId = req.params.userId;
    
    // 定义 SQL 查询字符串，用于从 likes表中获取该用户的点赞记录
    const sqlStr = "SELECT post_id FROM likes WHERE user_id = ?";
    
    // 执行数据库查询，使用用户 ID 作为查询参数
    db.query(sqlStr, [userId], (err, results) => {
        
        // 如果查询过程中出现错误，抛出异常并停止执行
        if (err){
            throw err;
           
         } 
        
        // 从查询结果中提取点赞列表
        // 使用 map 方法遍历结果集，将每个结果中的like提取出来形成一个新数组
        const likeIds = results.map(result => result.post_id);
        
        // 返回 JSON 格式的响应，包含一个 code 字段表示操作成功，和一个 favorites 字段包含用户收藏的 checkpoint_id 列表
        res.json({
            code: 1,  // 表示操作成功的状态码
            likes: likeIds  // 包含所有收藏的 checkpoint_id 的数组
        });
    });
});

// 获取指定用户的帖子收藏列表
app.get("/post_favorites/:userId", async(req, res) => {
    
    // 从 URL 路径参数中提取用户 ID
    const userId = req.params.userId;
    
    // 定义 SQL 查询字符串，用于从 表中获取该用户的收藏记录
    const sqlStr = "SELECT post_id FROM user_favorites WHERE user_id = ?";
    
    // 执行数据库查询，使用用户 ID 作为查询参数
    db.query(sqlStr, [userId], (err, results) => {
        
        // 如果查询过程中出现错误，抛出异常并停止执行
        if (err) throw err;
        
        // 从查询结果中提取点赞列表
        // 使用 map 方法遍历结果集，将每个结果中的like提取出来形成一个新数组
        const favIds = results.map(result => result.post_id);
        
        // 返回 JSON 格式的响应，包含一个 code 字段表示操作成功，和一个 favorites 字段包含用户收藏的 checkpoint_id 列表
        res.json({
            code: 1,  // 表示操作成功的状态码
            favorite: favIds  // 包含所有收藏的 checkpoint_id 的数组
        });
    });
});
// 获取所有用户数据
app.get('/api/user', (req, res) => {
    let sql = 'SELECT * FROM user';

    db.query(sql, (err, results) => {
        if (err) {
            console.error('数据库查询失败:', err);
            res.status(500).json({ error: '数据库查询失败' });
            return;
        }
        res.json(results);
    });
});

// 处理新评论的提交
app.post('/api/comments', (req, res) => {
    const { post_id, user_id, comment_content } = req.body;

    if (!post_id || !user_id || !comment_content) {
        return res.status(400).json({ error: '缺少必要的字段' });
    }

    let sql = 'INSERT INTO comments (post_id, user_id, comment_content) VALUES (?, ?, ?)';
    db.query(sql, [post_id, user_id, comment_content], (err, result) => {
        if (err) {
            console.error('无法保存评论:', err);
            return res.status(500).json({ error: '无法保存评论' });
        }
        res.status(200).json({ success: true, comment_id: result.insertId });
    });
});

// 删除评论
app.delete('/api/comments/:comment_id', (req, res) => {
    const { comment_id } = req.params;
    const { user_id } = req.body;

    if (!comment_id || !user_id) {
        return res.status(400).json({ error: '缺少必要的字段' });
    }

    // 仅允许删除用户自己的评论
    let sql = 'DELETE FROM comments WHERE user_post_id = ? AND user_id = ?';
    db.query(sql, [comment_id, user_id], (err, result) => {
        if (err) {
            console.error('无法删除评论:', err);
            return res.status(500).json({ error: '无法删除评论' });
        }
        if (result.affectedRows === 0) {
            return res.status(404).json({ error: '评论未找到或没有权限删除' });
        }
        res.status(200).json({ success: true });
    });
});

//设置静态文件服务
app.use('/image/post_images', express.static('public/image/post_images'));

// 点赞路由
app.post('/api/posts/like', (req, res) => {
    const { user_id, post_id } = req.body;

    const checkLikeQuery = 'SELECT * FROM likes WHERE user_id = ? AND post_id = ?';
    db.query(checkLikeQuery, [user_id, post_id], (err, results) => {
        if (err) {
            console.error('Error checking like:', err);
            return res.status(500).json({ success: false, message: 'Server error' });
        }

        if (results.length > 0) {
            return res.status(400).json({ success: false, message: 'You have already liked this post.' });
        }

        const likeQuery = 'INSERT INTO likes (user_id, post_id) VALUES (?, ?)';
        db.query(likeQuery, [user_id, post_id], (err, result) => {
            if (err) {
                console.error('Error inserting like:', err);
                return res.status(500).json({ success: false, message: 'Server error' });
            }

            const updatePostQuery = 'UPDATE posts SET likes_count = likes_count + 1 WHERE post_id = ?';
            db.query(updatePostQuery, [post_id], (err, updateResult) => {
                if (err) {
                    console.error('Error updating post likes count:', err);
                    return res.status(500).json({ success: false, message: 'Server error' });
                }

                //更新打卡点likes_count
                const getCheckpointIdQuery = 'SELECT checkpoint_id FROM posts WHERE post_id = ?';
                    db.query(getCheckpointIdQuery, [post_id], (err, result) => {
                        if (err) {
                            console.error('Error retrieving checkpoint_id:', err);
                            return res.status(500).json({ success: false, message: 'Server error' });
                        }

                        const checkpoint_id = result[0].checkpoint_id;

                        // 继续后续的更新逻辑
                        const updateCheckpointQuery = 'UPDATE checkpoints SET likes_count = likes_count + 1 WHERE checkpoint_id = ?';
                        db.query(updateCheckpointQuery, [checkpoint_id], (err, updateResult) => {
                            if (err) {
                                console.error('Error updating checkpoint likes count:', err);
                                return res.status(500).json({ success: false, message: 'Server error' });
                            }

                            // 继续处理其他逻辑或返回响应
                            res.status(200).json({ success: true, message: 'Liked successfully.' });
                        });
                    });

                const getLikesCountQuery = 'SELECT likes_count FROM posts WHERE post_id = ?';
                db.query(getLikesCountQuery, [post_id], (err, likesResult) => {
                    if (err) {
                        console.error('Error fetching updated likes count:', err);
                        return res.status(500).json({ success: false, message: 'Server error' });
                    }

                    const updatedLikesCount = likesResult[0].likes_count;
                    res.status(200).json({ success: true, message: 'Liked successfully.', likes_count: updatedLikesCount });
                });
            });
        });
    });
});
;

// 收藏帖子功能
app.post('/post_favorite', (req, res) => {
    const { user_id, post_id, checkpoint_id } = req.body;

    // 检查帖子是否已经收藏
    const checkFavoriteQuery = 'SELECT * FROM user_favorites WHERE user_id = ? AND post_id = ? AND checkpoint_id = ?';
    db.query(checkFavoriteQuery, [user_id, post_id, checkpoint_id], (err, results) => {
        if (err) {
            console.error('Error checking favorite:', err);
            return res.status(500).send({ code: 0, msg: '操作失败' });
        }
        if (results.length > 0) {
            // 已经收藏，执行取消收藏操作
            const deleteFavoriteQuery = 'DELETE FROM user_favorites WHERE user_id = ? AND post_id = ? AND checkpoint_id = ?';
            db.query(deleteFavoriteQuery, [user_id, post_id, checkpoint_id], (err, results) => {
                if (err) {
                    console.error('Error deleting favorite:', err);
                    return res.status(500).send({ code: 0, msg: '操作失败' });
                }
                return res.send({ code: 2, msg: '已取消收藏' }); // 发送响应并返回函数
            });
        } else {
            // 插入新收藏
            const insertFavoriteQuery = 'INSERT INTO user_favorites (user_id, post_id, checkpoint_id) VALUES (?, ?, ?)';
            db.query(insertFavoriteQuery, [user_id, post_id, checkpoint_id], (err, results) => {
                if (err) {
                    console.error('Error inserting favorite:', err);
                    return res.status(500).send({ code: 0, msg: '操作失败' });
                }

                if (results.affectedRows === 1) {
                    return res.send({ code: 1, msg: '收藏成功' }); // 发送响应并返回函数
                } else {
                    return res.send({ code: 0, msg: '操作失败' }); // 发送响应并返回函数
                }
            });
        }
    });
});

    
// 启动服务器
app.listen(port, () => {
    console.log(`端口已经启动 http://localhost:${port}`);//端口号4000
});
