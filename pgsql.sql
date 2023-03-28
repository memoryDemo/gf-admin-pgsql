-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS sys_config;
CREATE TABLE sys_config (
                            config_id SERIAL PRIMARY KEY,
                            config_name VARCHAR(100) NOT NULL DEFAULT '',
                            config_key VARCHAR(100) NOT NULL DEFAULT '',
                            config_value VARCHAR(500) NOT NULL DEFAULT '',
                            config_type CHAR(1) NOT NULL DEFAULT 'N',
                            remark VARCHAR(500) DEFAULT NULL,
                            created_at TIMESTAMP WITHOUT TIME ZONE NULL DEFAULT NULL,
                            updated_at TIMESTAMP WITHOUT TIME ZONE NULL DEFAULT NULL,
                            deleted_at TIMESTAMP WITHOUT TIME ZONE NULL DEFAULT NULL
);

COMMENT ON TABLE sys_config IS '参数配置表';
COMMENT ON COLUMN sys_config.config_id IS '参数主键';
COMMENT ON COLUMN sys_config.config_name IS '参数名称';
COMMENT ON COLUMN sys_config.config_key IS '参数键名';
COMMENT ON COLUMN sys_config.config_value IS '参数键值';
COMMENT ON COLUMN sys_config.config_type IS '系统内置（Y是 N否）';
COMMENT ON COLUMN sys_config.remark IS '备注';
COMMENT ON COLUMN sys_config.created_at IS '创建时间';
COMMENT ON COLUMN sys_config.updated_at IS '更新时间';
COMMENT ON COLUMN sys_config.deleted_at IS '删除时间';


-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO sys_config VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow', '2022-04-13 15:06:52', '2022-04-13 15:06:52', NULL);
INSERT INTO sys_config VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', '初始化密码 123456', '2022-04-13 15:06:52', '2022-04-13 15:06:52', NULL);
INSERT INTO sys_config VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', '深色主题theme-dark，浅色主题theme-light', '2022-04-13 15:06:52', '2022-04-13 15:06:52', NULL);
INSERT INTO sys_config VALUES (4, '账号自助-验证码开关', 'sys.account.captchaOnOff', 'true', 'Y', '是否开启验证码功能（true开启，false关闭）', '2022-04-13 15:06:52', '2022-04-14 10:23:32', NULL);
INSERT INTO sys_config VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', '是否开启注册用户功能（true开启，false关闭）', '2022-04-13 15:06:52', '2022-04-13 15:06:52', NULL);

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS sys_dept;
CREATE TABLE sys_dept (
                          dept_id BIGSERIAL PRIMARY KEY,
                          parent_id BIGINT NOT NULL DEFAULT 0,
                          dept_name VARCHAR(30) NOT NULL DEFAULT '',
                          order_num INTEGER NOT NULL DEFAULT 0,
                          leader VARCHAR(20) DEFAULT NULL,
                          phone VARCHAR(11) DEFAULT NULL,
                          email VARCHAR(50) DEFAULT NULL,
                          status CHAR(1) NOT NULL DEFAULT '0',
                          created_at TIMESTAMP WITHOUT TIME ZONE NULL DEFAULT NULL,
                          updated_at TIMESTAMP WITHOUT TIME ZONE NULL DEFAULT NULL,
                          deleted_at TIMESTAMP WITHOUT TIME ZONE NULL DEFAULT NULL
);

COMMENT ON TABLE sys_dept IS '部门表';
COMMENT ON COLUMN sys_dept.dept_id IS '部门id';
COMMENT ON COLUMN sys_dept.parent_id IS '父部门id';
COMMENT ON COLUMN sys_dept.dept_name IS '部门名称';
COMMENT ON COLUMN sys_dept.order_num IS '显示顺序';
COMMENT ON COLUMN sys_dept.leader IS '负责人';
COMMENT ON COLUMN sys_dept.phone IS '手机号码';
COMMENT ON COLUMN sys_dept.email IS '邮箱';
COMMENT ON COLUMN sys_dept.status IS '部门状态（0正常 1停用）';
COMMENT ON COLUMN sys_dept.created_at IS '创建时间';
COMMENT ON COLUMN sys_dept.updated_at IS '更新时间';
COMMENT ON COLUMN sys_dept.deleted_at IS '删除时间';



-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO sys_dept VALUES (100, 0, 'cheesepeach', 0, 'memory', '15888888888', 'memory@qq.com', '0', '2022-04-10 17:49:50', '2022-04-10 17:49:50', NULL);
INSERT INTO sys_dept VALUES (101, 100, '深圳总公司', 1, 'memory', '15888888888', 'memory@qq.com', '0', '2022-04-10 17:49:50', '2022-04-10 17:49:50', NULL);
INSERT INTO sys_dept VALUES (102, 100, '长沙分公司', 2, 'memory', '15888888888', 'memory@qq.com', '0', '2022-04-10 17:49:50', '2022-04-10 17:49:50', NULL);
INSERT INTO sys_dept VALUES (103, 101, '研发部门', 1, 'memory', '15888888888', 'memory@qq.com', '0', '2022-04-10 17:49:50', '2022-04-10 17:49:50', NULL);
INSERT INTO sys_dept VALUES (104, 101, '市场部门', 2, 'memory', '15888888888', 'memory@qq.com', '0', '2022-04-10 17:49:50', '2022-04-10 17:49:50', NULL);
INSERT INTO sys_dept VALUES (105, 101, '测试部门', 3, 'memory', '15888888888', 'memory@qq.com', '0', '2022-04-10 17:49:50', '2022-04-10 17:49:50', NULL);
INSERT INTO sys_dept VALUES (106, 101, '财务部门', 4, 'memory', '15888888888', 'memory@qq.com', '0', '2022-04-10 17:49:50', '2022-04-10 17:49:50', NULL);
INSERT INTO sys_dept VALUES (107, 101, '运维部门', 5, 'memory', '15888888888', 'memory@qq.com', '0', '2022-04-10 17:49:50', '2022-04-10 17:49:50', NULL);
INSERT INTO sys_dept VALUES (108, 102, '市场部门', 1, 'memory', '15888888888', 'memory@qq.com', '0', '2022-04-10 17:49:50', '2022-04-10 17:49:50', NULL);
INSERT INTO sys_dept VALUES (109, 102, '财务部门', 2, 'memory', '15888888888', 'memory@qq.com', '0', '2022-04-10 17:49:50', '2022-04-10 17:49:50', NULL);
INSERT INTO sys_dept VALUES (110, 100, '测试', 1, '', '', '', '0', '2022-04-11 09:35:18', '2022-04-11 09:35:18', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS sys_dict_data;
CREATE TABLE sys_dict_data (
                               dict_code BIGSERIAL PRIMARY KEY,
                               dict_sort INTEGER NOT NULL DEFAULT 0,
                               dict_label VARCHAR(100) NOT NULL DEFAULT '',
                               dict_value VARCHAR(100) NOT NULL DEFAULT '',
                               dict_type VARCHAR(100) NOT NULL DEFAULT '',
                               css_class VARCHAR(100) DEFAULT NULL,
                               list_class VARCHAR(100) DEFAULT NULL,
                               is_default CHAR(1) NOT NULL DEFAULT 'N',
                               status CHAR(1) NOT NULL DEFAULT '0',
                               remark VARCHAR(500) DEFAULT NULL,
                               created_at TIMESTAMP WITHOUT TIME ZONE NULL DEFAULT NULL,
                               updated_at TIMESTAMP WITHOUT TIME ZONE NULL DEFAULT NULL,
                               deleted_at TIMESTAMP WITHOUT TIME ZONE NULL DEFAULT NULL
);

COMMENT ON TABLE sys_dict_data IS '字典数据表';
COMMENT ON COLUMN sys_dict_data.dict_code IS '字典编码';
COMMENT ON COLUMN sys_dict_data.dict_sort IS '字典排序';
COMMENT ON COLUMN sys_dict_data.dict_label IS '字典标签';
COMMENT ON COLUMN sys_dict_data.dict_value IS '字典键值';
COMMENT ON COLUMN sys_dict_data.dict_type IS '字典类型';
COMMENT ON COLUMN sys_dict_data.css_class IS '样式属性（其他样式扩展）';
COMMENT ON COLUMN sys_dict_data.list_class IS '表格回显样式';
COMMENT ON COLUMN sys_dict_data.is_default IS '是否默认（0是 1否）';
COMMENT ON COLUMN sys_dict_data.status IS '状态（0正常 1停用）';
COMMENT ON COLUMN sys_dict_data.remark IS '备注';
COMMENT ON COLUMN sys_dict_data.created_at IS '创建日期';
COMMENT ON COLUMN sys_dict_data.updated_at IS '修改日期';
COMMENT ON COLUMN sys_dict_data.deleted_at IS '删除日期';


-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO sys_dict_data VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', '0', '0', '显示菜单', '2022-04-07 13:54:52', NULL, NULL);
INSERT INTO sys_dict_data VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', '1', '0', '隐藏菜单', '2022-04-07 13:54:52', NULL, NULL);
INSERT INTO sys_dict_data VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', '0', '0', '正常状态', '2022-04-07 13:54:52', NULL, NULL);
INSERT INTO sys_dict_data VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', '1', '0', '停用状态', '2022-04-07 13:54:52', '2022-04-09 14:20:03', NULL);
INSERT INTO sys_dict_data VALUES (18, 1, '新增', '1', 'sys_oper_type', '', 'info', '1', '0', '新增操作', '2022-04-07 13:54:52', '2022-04-18 12:04:00', NULL);
INSERT INTO sys_dict_data VALUES (19, 2, '删除', '2', 'sys_oper_type', '', 'danger', '1', '0', '删除操作', '2022-04-07 13:54:52', '2022-04-18 12:04:00', NULL);
INSERT INTO sys_dict_data VALUES (20, 3, '修改', '3', 'sys_oper_type', '', 'info', '1', '0', '修改操作', '2022-04-07 13:54:52', '2022-04-18 12:04:00', NULL);
INSERT INTO sys_dict_data VALUES (21, 4, '查询', '4', 'sys_oper_type', '', 'primary', '1', '0', '查询操作', '2022-04-07 13:54:52', '2022-04-18 12:04:00', NULL);
INSERT INTO sys_dict_data VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', '1', '0', '导出操作', '2022-04-07 13:54:52', '2022-04-18 12:04:00', NULL);
INSERT INTO sys_dict_data VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', '1', '0', '导入操作', '2022-04-07 13:54:52', '2022-04-18 12:04:00', NULL);
INSERT INTO sys_dict_data VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', '1', '0', '强退操作', '2022-04-07 13:54:52', '2022-04-18 12:04:00', NULL);
INSERT INTO sys_dict_data VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', '1', '0', '生成操作', '2022-04-07 13:54:52', '2022-04-18 12:04:00', NULL);
INSERT INTO sys_dict_data VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', '1', '0', '清空操作', '2022-04-07 13:54:52', '2022-04-18 12:04:00', NULL);
INSERT INTO sys_dict_data VALUES (27, 1, '是', 'Y', 'sys_yes_no', '', 'primary', '', '0', '系统默认是', '2022-04-13 16:00:13', '2022-04-13 16:00:24', NULL);
INSERT INTO sys_dict_data VALUES (28, 2, '否', 'N', 'sys_yes_no', '', 'danger', '', '0', '系统默认否', '2022-04-13 16:00:48', '2022-04-13 16:00:55', NULL);
INSERT INTO sys_dict_data VALUES (29, 1, '成功', '0', 'sys_common_status', '', 'primary', '', '0', '正常状态', '2022-04-14 16:02:03', '2022-04-14 16:02:03', NULL);
INSERT INTO sys_dict_data VALUES (30, 2, '失败', '1', 'sys_common_status', '', 'danger', '', '0', '停用状态', '2022-04-14 16:02:27', '2022-04-14 16:02:27', NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS sys_dict_type;
CREATE TABLE sys_dict_type (
                               dict_id BIGSERIAL PRIMARY KEY,
                               dict_name VARCHAR(100) NOT NULL DEFAULT '',
                               dict_type VARCHAR(100) NOT NULL DEFAULT '',
                               status CHAR(1) NOT NULL DEFAULT '0',
                               remark VARCHAR(500) DEFAULT NULL,
                               created_at TIMESTAMP WITHOUT TIME ZONE NULL DEFAULT NULL,
                               updated_at TIMESTAMP WITHOUT TIME ZONE NULL DEFAULT NULL,
                               deleted_at TIMESTAMP WITHOUT TIME ZONE NULL DEFAULT NULL
);

CREATE UNIQUE INDEX idx_unique_dict_type ON sys_dict_type(dict_type);

COMMENT ON TABLE sys_dict_type IS '字典类型表';
COMMENT ON COLUMN sys_dict_type.dict_id IS '字典主键';
COMMENT ON COLUMN sys_dict_type.dict_name IS '字典名称';
COMMENT ON COLUMN sys_dict_type.dict_type IS '字典类型';
COMMENT ON COLUMN sys_dict_type.status IS '状态（0正常 1停用）';
COMMENT ON COLUMN sys_dict_type.remark IS '备注';
COMMENT ON COLUMN sys_dict_type.created_at IS '创建日期';
COMMENT ON COLUMN sys_dict_type.updated_at IS '修改日期';
COMMENT ON COLUMN sys_dict_type.deleted_at IS '删除日期';



-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO sys_dict_type VALUES (2, '菜单状态', 'sys_show_hide', '0', '菜单状态列表', '2022-04-07 13:54:52', NULL, NULL);
INSERT INTO sys_dict_type VALUES (3, '系统开关', 'sys_normal_disable', '0', '系统开关列表', '2022-04-07 13:54:52', NULL, NULL);
INSERT INTO sys_dict_type VALUES (9, '操作类型', 'sys_oper_type', '0', '操作类型列表', '2022-04-07 13:54:52', '2022-04-18 12:04:00', NULL);
INSERT INTO sys_dict_type VALUES (10, '系统内置', 'sys_yes_no', '0', '', '2022-04-13 15:59:20', '2022-04-13 15:59:20', NULL);
INSERT INTO sys_dict_type VALUES (11, '系统状态', 'sys_common_status', '0', '日志，成功或失败', '2022-04-14 16:01:38', '2022-04-14 16:01:38', NULL);

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS sys_file;
CREATE TABLE sys_file (
                          id BIGSERIAL PRIMARY KEY,
                          name VARCHAR(45) NULL DEFAULT NULL,
                          src VARCHAR(500) NOT NULL,
                          url VARCHAR(500) NULL DEFAULT NULL,
                          file_type VARCHAR(255) NULL DEFAULT NULL,
                          user_id INTEGER NOT NULL,
                          created_at TIMESTAMP WITHOUT TIME ZONE NULL DEFAULT NULL
);

CREATE INDEX idx_user_id ON sys_file(user_id);

COMMENT ON TABLE sys_file IS '文件列表';
COMMENT ON COLUMN sys_file.id IS '自增ID';
COMMENT ON COLUMN sys_file.name IS '文件名称';
COMMENT ON COLUMN sys_file.src IS '本地文件存储路径';
COMMENT ON COLUMN sys_file.url IS 'URL地址，可能为空';
COMMENT ON COLUMN sys_file.file_type IS '文件类型';
COMMENT ON COLUMN sys_file.user_id IS '操作用户';
COMMENT ON COLUMN sys_file.created_at IS '创建时间';


-- ----------------------------
-- Records of sys_file
-- ----------------------------
INSERT INTO sys_file VALUES (1, 'c6znge18hcbkv0i8ts.png', 'upload/20201110/c6znge18hcbkv0i8ts.png', '/upload/20201110/c6znge18hcbkv0i8ts.png', NULL, 1, '2020-11-10 22:22:45');
INSERT INTO sys_file VALUES (2, 'c6znjl77xng89hmlhg.png', 'upload/20201110/c6znjl77xng89hmlhg.png', '/upload/20201110/c6znjl77xng89hmlhg.png', NULL, 1, '2020-11-10 22:26:55');
INSERT INTO sys_file VALUES (3, 'c73j3oajspswdgqb1g.png', 'upload/20201115/c73j3oajspswdgqb1g.png', '/upload/20201115/c73j3oajspswdgqb1g.png', NULL, 10, '2020-11-15 11:48:44');
INSERT INTO sys_file VALUES (4, 'c73xron93lmguw4xrr.png', 'upload/20201115/c73xron93lmguw4xrr.png', '/upload/20201115/c73xron93lmguw4xrr.png', NULL, 12, '2020-11-15 23:18:21');
INSERT INTO sys_file VALUES (5, 'c75n1svi4mlsam1cdd.png', 'upload/20201117/c75n1svi4mlsam1cdd.png', '/upload/20201117/c75n1svi4mlsam1cdd.png', NULL, 15, '2020-11-17 23:19:41');
INSERT INTO sys_file VALUES (6, 'c7bhxgi4xbvc2owc1v.jpg', 'upload/20201124/c7bhxgi4xbvc2owc1v.jpg', '/upload/20201124/c7bhxgi4xbvc2owc1v.jpg', NULL, 16, '2020-11-24 20:34:55');
INSERT INTO sys_file VALUES (14, 'cj8wfq8pp6ngssc44t.jpg', 'upload\\20220413\\cj8wfq8pp6ngssc44t.jpg', NULL, '用户头像', 1, '2022-04-13 14:30:44');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS sys_job;
CREATE TABLE sys_job (
                         job_id BIGSERIAL,
                         job_name VARCHAR(64) NOT NULL DEFAULT '',
                         job_group VARCHAR(64) NOT NULL DEFAULT 'DEFAULT',
                         invoke_target VARCHAR(500) NOT NULL,
                         job_params VARCHAR(200) NULL DEFAULT '',
                         cron_expression VARCHAR(255) NULL DEFAULT '',
                         misfire_policy VARCHAR(20) NULL DEFAULT '3',
                         status CHAR(1) NULL DEFAULT '0',
                         remark VARCHAR(500) NULL DEFAULT '',
                         created_at TIMESTAMP WITHOUT TIME ZONE NULL DEFAULT NULL,
                         updated_at TIMESTAMP WITHOUT TIME ZONE NULL DEFAULT NULL,
                         deleted_at TIMESTAMP WITHOUT TIME ZONE NULL DEFAULT NULL,
                         PRIMARY KEY (job_id, job_name, job_group)
);

COMMENT ON TABLE sys_job IS '定时任务调度表';
COMMENT ON COLUMN sys_job.job_id IS '任务ID';
COMMENT ON COLUMN sys_job.job_name IS '任务名称';
COMMENT ON COLUMN sys_job.job_group IS '任务组名';
COMMENT ON COLUMN sys_job.invoke_target IS '调用目标字符串';
COMMENT ON COLUMN sys_job.job_params IS '参数';
COMMENT ON COLUMN sys_job.cron_expression IS 'cron执行表达式';
COMMENT ON COLUMN sys_job.misfire_policy IS '计划执行错误策略（1立即执行 2执行一次 3放弃执行）';
COMMENT ON COLUMN sys_job.status IS '状态（0正常 1暂停）';
COMMENT ON COLUMN sys_job.remark IS '备注信息';
COMMENT ON COLUMN sys_job.created_at IS '创建时间';
COMMENT ON COLUMN sys_job.updated_at IS '更新时间';
COMMENT ON COLUMN sys_job.deleted_at IS '删除时间';


-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO sys_job VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '', '0/10 * * * * ?', '3', '1', '', NULL, NULL, NULL);
INSERT INTO sys_job VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams("memory")', '', '0/15 * * * * ?', '3', '1', '', NULL, NULL, NULL);
INSERT INTO sys_job VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams("memory", true, 2000L, 316.50D, 100)', '', '0/20 * * * * ?', '3', '1', '', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS sys_job_log;
CREATE TABLE sys_job_log (
                             job_log_id BIGSERIAL PRIMARY KEY,
                             job_name VARCHAR(64) NOT NULL,
                             job_group VARCHAR(64) NOT NULL,
                             invoke_target VARCHAR(500) NOT NULL,
                             job_params VARCHAR(200) NULL DEFAULT '',
                             job_message VARCHAR(500) NULL DEFAULT NULL,
                             status CHAR(1) NULL DEFAULT '0',
                             exception_info VARCHAR(2000) NULL DEFAULT '',
                             create_time TIMESTAMP WITHOUT TIME ZONE NULL DEFAULT NULL
);

COMMENT ON TABLE sys_job_log IS '定时任务调度日志表';
COMMENT ON COLUMN sys_job_log.job_log_id IS '任务日志ID';
COMMENT ON COLUMN sys_job_log.job_name IS '任务名称';
COMMENT ON COLUMN sys_job_log.job_group IS '任务组名';
COMMENT ON COLUMN sys_job_log.invoke_target IS '调用目标字符串';
COMMENT ON COLUMN sys_job_log.job_params IS '参数';
COMMENT ON COLUMN sys_job_log.job_message IS '日志信息';
COMMENT ON COLUMN sys_job_log.status IS '执行状态（0正常 1失败）';
COMMENT ON COLUMN sys_job_log.exception_info IS '异常信息';
COMMENT ON COLUMN sys_job_log.create_time IS '创建时间';


-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_login_log
-- ----------------------------
DROP TABLE IF EXISTS sys_login_log;
CREATE TABLE sys_login_log (
                               info_id BIGSERIAL PRIMARY KEY,
                               user_name VARCHAR(50) NULL DEFAULT '',
                               ipaddr VARCHAR(128) NULL DEFAULT '',
                               login_location VARCHAR(255) NULL DEFAULT '',
                               browser VARCHAR(50) NULL DEFAULT '',
                               os VARCHAR(50) NULL DEFAULT '',
                               status CHAR(1) NULL DEFAULT '0',
                               msg VARCHAR(255) NULL DEFAULT '',
                               created_at TIMESTAMP WITHOUT TIME ZONE NULL DEFAULT NULL
);

COMMENT ON TABLE sys_login_log IS '系统访问记录';
COMMENT ON COLUMN sys_login_log.info_id IS '访问ID';
COMMENT ON COLUMN sys_login_log.user_name IS '登录账号';
COMMENT ON COLUMN sys_login_log.ipaddr IS '登录IP地址';
COMMENT ON COLUMN sys_login_log.login_location IS '登录地点';
COMMENT ON COLUMN sys_login_log.browser IS '浏览器类型';
COMMENT ON COLUMN sys_login_log.os IS '操作系统';
COMMENT ON COLUMN sys_login_log.status IS '登录状态（0成功 1失败）';
COMMENT ON COLUMN sys_login_log.msg IS '提示消息';
COMMENT ON COLUMN sys_login_log.created_at IS '登录时间';


-- ----------------------------
-- Records of sys_login_log
-- ----------------------------
INSERT INTO sys_login_log VALUES (1, 'admin', '127.0.0.1', '内网IP', 'Edge', 'Windows 10', '0', '登录成功', '2022-04-22 10:55:59');
INSERT INTO sys_login_log VALUES (2, 'admin', '127.0.0.1', '内网IP', 'Edge', 'Windows 10', '0', '登录成功', '2022-04-23 10:20:13');
INSERT INTO sys_login_log VALUES (3, 'admin', '127.0.0.1', '内网IP', 'Edge', 'Windows 10', '0', '登录成功', '2022-04-24 09:04:11');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS sys_menu;
CREATE TABLE sys_menu (
                          menu_id SERIAL PRIMARY KEY,
                          menu_name VARCHAR(60) NOT NULL,
                          parent_id INTEGER NULL DEFAULT 0,
                          sort INTEGER NULL DEFAULT NULL,
                          path VARCHAR(200) NULL DEFAULT NULL,
                          component VARCHAR(100) NULL DEFAULT NULL,
                          is_frame CHAR(1) NOT NULL,
                          is_cache CHAR(1) NOT NULL DEFAULT '0',
                          query VARCHAR(255) NULL DEFAULT NULL,
                          menu_type CHAR(1) NOT NULL,
                          visible CHAR(1) NOT NULL,
                          status CHAR(1) NOT NULL,
                          perms VARCHAR(100) NULL DEFAULT NULL,
                          is_auth CHAR(1) NULL DEFAULT '0',
                          is_log CHAR(1) NULL DEFAULT '0',
                          icon VARCHAR(100) NULL DEFAULT NULL,
                          created_at TIMESTAMP WITHOUT TIME ZONE NULL DEFAULT NULL,
                          updated_at TIMESTAMP WITHOUT TIME ZONE NULL DEFAULT NULL,
                          deleted_at TIMESTAMP WITHOUT TIME ZONE NULL DEFAULT NULL
);

COMMENT ON TABLE sys_menu IS '菜单表----id有问题，没有办法新建菜单';
COMMENT ON COLUMN sys_menu.menu_id IS '菜单ID';
COMMENT ON COLUMN sys_menu.menu_name IS '菜单名称';
COMMENT ON COLUMN sys_menu.parent_id IS '父菜单ID';
COMMENT ON COLUMN sys_menu.sort IS '排序标记';
COMMENT ON COLUMN sys_menu.path IS '路由地址';
COMMENT ON COLUMN sys_menu.component IS '组件路径';
COMMENT ON COLUMN sys_menu.is_frame IS '是否为外链（0是 1否）';
COMMENT ON COLUMN sys_menu.is_cache IS '是否缓存（0缓存 1不缓存）';
COMMENT ON COLUMN sys_menu.query IS '路由参数';
COMMENT ON COLUMN sys_menu.menu_type IS '菜单类型（M目录 C菜单 F按钮）';
COMMENT ON COLUMN sys_menu.visible IS '显示状态（0显示 1隐藏）';
COMMENT ON COLUMN sys_menu.status IS '菜单状态（0正常 1停用）';
COMMENT ON COLUMN sys_menu.perms IS '权限标识';
COMMENT ON COLUMN sys_menu.is_auth IS '是否验证（0是 1否）';
COMMENT ON COLUMN sys_menu.is_log IS '是否记录操作日志（0是 1否）';
COMMENT ON COLUMN sys_menu.icon IS '菜单图标';
COMMENT ON COLUMN sys_menu.created_at IS '创建时间';
COMMENT ON COLUMN sys_menu.updated_at IS '更新时间';
COMMENT ON COLUMN sys_menu.deleted_at IS '删除时间';


-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO sys_menu VALUES (2, '系统管理', 0, 2, 'system', NULL, '1', '0', NULL, 'M', '0', '0', NULL, '0', '1', 'system', '2021-04-05 14:05:04', NULL, NULL);
INSERT INTO sys_menu VALUES (3, '系统监控', 0, 3, 'monitor', NULL, '1', '0', NULL, 'M', '0', '0', NULL, '0', '1', 'monitor', '2021-04-05 14:05:04', '2021-05-28 14:58:44', NULL);
INSERT INTO sys_menu VALUES (4, '系统工具', 0, 4, 'tool', NULL, '1', '0', NULL, 'M', '0', '0', NULL, '0', '1', 'tool', '2021-04-05 14:05:04', '2021-07-09 16:36:28', NULL);
INSERT INTO sys_menu VALUES (5, '淘宝官网', 0, 5, 'https://www.taobao.com/', NULL, '0', '0', NULL, 'M', '0', '0', NULL, '0', '1', 'guide', '2021-04-05 14:05:04', '2022-04-18 15:27:27', NULL);
INSERT INTO sys_menu VALUES (100, '用户管理', 2, 1, 'user', 'system/user/index', '1', '0', NULL, 'C', '0', '0', 'system/user/getList', '0', '1', 'user', '2021-04-05 14:05:04', '2021-05-17 11:55:55', NULL);
INSERT INTO sys_menu VALUES (101, '角色管理', 2, 2, 'role', 'system/role/index', '1', '0', NULL, 'C', '0', '0', 'system/role/getList', '0', '1', 'peoples', '2021-04-06 21:43:09', NULL, NULL);
INSERT INTO sys_menu VALUES (102, '菜单管理', 2, 3, 'menu', 'system/menu/index', '1', '0', NULL, 'C', '0', '0', 'system/menu/getList', '0', '1', 'tree-table', '2021-04-06 21:43:09', NULL, NULL);
INSERT INTO sys_menu VALUES (103, '部门管理', 2, 4, 'dept', 'system/dept/index', '1', '0', NULL, 'C', '0', '0', 'system/dept/getList', '0', '1', 'tree', '2021-04-06 21:43:09', '2021-04-16 18:18:24', NULL);
INSERT INTO sys_menu VALUES (104, '岗位管理', 2, 5, 'post', 'system/post/index', '1', '0', NULL, 'C', '0', '0', 'system/post/getList', '0', '1', 'post', '2021-04-06 21:43:09', '2021-04-16 18:16:14', '2022-04-20 16:41:32');
INSERT INTO sys_menu VALUES (105, '字典管理', 2, 6, 'dict', 'system/dict/index', '1', '0', NULL, 'C', '0', '0', 'system/dictType/getList', '0', '1', 'dict', '2021-04-06 21:43:09', NULL, NULL);
INSERT INTO sys_menu VALUES (106, '参数设置', 2, 7, 'config', 'system/config/index', '1', '0', NULL, 'C', '0', '0', 'system/config/getList', '0', '1', 'edit', '2021-04-06 21:43:09', NULL, NULL);
INSERT INTO sys_menu VALUES (107, '通知公告', 2, 8, 'notice', 'system/notice/index', '1', '0', NULL, 'C', '0', '0', 'system/notice/getList', '0', '1', 'message', '2021-04-06 21:43:09', '2021-07-09 16:34:53', '2021-05-14 18:09:39');
INSERT INTO sys_menu VALUES (108, '日志管理', 3, 1, 'log', 'monitor/logininfor/index', '1', '0', NULL, 'M', '0', '0', NULL, '0', '1', 'log', '2021-04-06 21:43:09', '2022-04-14 15:39:03', NULL);
INSERT INTO sys_menu VALUES (109, '在线用户', 3, 2, 'online', 'monitor/online/index', '1', '0', NULL, 'C', '0', '0', 'monitor/online/getList', '0', '1', 'online', '2021-04-06 21:43:09', '2021-07-09 16:37:25', NULL);
INSERT INTO sys_menu VALUES (110, '定时任务', 3, 3, 'job', 'monitor/job/index', '1', '0', NULL, 'C', '1', '1', 'monitor/job/getList', '0', '1', 'job', '2021-04-06 21:43:09', '2022-04-20 16:40:58', NULL);
INSERT INTO sys_menu VALUES (111, '数据监控', 3, 4, 'druid', 'monitor/druid/index', '1', '0', NULL, 'C', '1', '1', 'monitor/druid/getList', '0', '1', 'druid', '2021-04-06 21:43:09', '2022-04-20 16:41:04', NULL);
INSERT INTO sys_menu VALUES (112, '服务监控', 3, 5, 'server', 'monitor/server/index', '1', '0', NULL, 'C', '1', '1', 'monitor/server/getList', '0', '1', 'server', '2021-04-06 21:43:09', '2022-04-20 16:41:09', NULL);
INSERT INTO sys_menu VALUES (113, '缓存监控', 3, 6, 'cache', 'monitor/cache/index', '1', '0', NULL, 'C', '1', '1', 'monitor/cache/getList', '0', '1', 'redis', '2021-04-06 21:43:09', '2022-04-20 16:41:12', NULL);
INSERT INTO sys_menu VALUES (114, '表单构建', 4, 1, 'build', 'tool/build/index', '1', '0', NULL, 'C', '0', '0', 'tool/build/getList', '0', '1', 'build', '2021-04-06 21:43:09', '2021-07-09 16:35:43', NULL);
INSERT INTO sys_menu VALUES (115, '代码生成', 4, 2, 'gen', 'tool/gen/index', '1', '0', NULL, 'C', '0', '0', 'tool/gen/getList', '0', '1', 'code', '2021-04-06 21:43:09', NULL, NULL);
INSERT INTO sys_menu VALUES (116, '系统接口', 4, 3, 'swagger', 'tool/swagger/index', '1', '0', NULL, 'C', '0', '0', 'tool/swagger/getList', '0', '1', 'swagger', '2021-04-06 21:43:09', NULL, NULL);
INSERT INTO sys_menu VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '1', '0', NULL, 'C', '0', '0', 'monitor/operLog/getList', '0', '1', 'form', '2021-04-06 21:43:09', NULL, NULL);
INSERT INTO sys_menu VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '1', '0', NULL, 'C', '0', '0', 'monitor/loginLog/getList', '0', '1', 'logininfor', '2021-04-06 21:43:09', NULL, NULL);
INSERT INTO sys_menu VALUES (1001, '用户查询', 100, 1, NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system/user/getOne', '0', '1', '#', '2021-04-06 21:43:09', NULL, NULL);
INSERT INTO sys_menu VALUES (1002, '用户新增', 100, 2, NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system/user/create', '0', '1', '#', '2021-04-06 21:43:09', NULL, NULL);
INSERT INTO sys_menu VALUES (1003, '用户修改', 100, 3, NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system/user/update', '0', '1', '#', '2021-04-06 21:43:09', NULL, NULL);
INSERT INTO sys_menu VALUES (1004, '用户删除', 100, 4, NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system/user/delete', '0', '1', '#', '2021-04-06 21:43:09', NULL, NULL);
INSERT INTO sys_menu VALUES (1005, '用户分配角色', 100, 5, NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system/user/userSelectRole', '0', '1', '#', '2021-04-06 21:43:09', NULL, NULL);
INSERT INTO sys_menu VALUES (1006, '重置密码', 100, 6, NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system/user/resetPwd', '0', '1', '#', '2021-04-06 21:43:09', NULL, NULL);
INSERT INTO sys_menu VALUES (1007, '用户状态修改', 100, 7, NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system/user/changeStatus', '0', '1', '#', '2021-04-06 21:43:09', NULL, NULL);
INSERT INTO sys_menu VALUES (1008, '用户导出', 100, 8, NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system/user/export', '0', '1', '#', '2021-04-06 21:43:09', NULL, NULL);
INSERT INTO sys_menu VALUES (1009, '用户导入', 100, 9, NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system/user/import', '0', '1', '#', '2021-04-06 21:43:09', NULL, NULL);
INSERT INTO sys_menu VALUES (1010, '用户查询个人信息', 100, 10, NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system/user/profile', '0', '1', '#', '2021-04-06 21:43:09', NULL, NULL);
INSERT INTO sys_menu VALUES (1011, '用户修改个人信息', 100, 11, NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system/user/updateProfile', '0', '1', '#', '2021-04-06 21:43:09', NULL, NULL);
INSERT INTO sys_menu VALUES (1012, '用户修改个人密码', 100, 12, NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system/user/profile/updatePwd', '0', '1', '#', '2021-04-06 21:43:09', NULL, NULL);
INSERT INTO sys_menu VALUES (1013, '用户修改个人头像', 100, 13, NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system/user/profile/avatar', '0', '1', '#', '2021-04-06 21:43:09', NULL, NULL);
INSERT INTO sys_menu VALUES (1014, '角色查询', 101, 1, NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system/role/getOne', '0', '1', '#', '2021-04-06 21:43:09', NULL, NULL);
INSERT INTO sys_menu VALUES (1015, '角色新增', 101, 2, NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system/role/create', '0', '1', '#', '2021-04-06 21:43:09', NULL, NULL);
INSERT INTO sys_menu VALUES (1016, '角色修改', 101, 3, NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system/role/update', '0', '1', '#', '2021-04-06 21:43:09', NULL, NULL);
INSERT INTO sys_menu VALUES (1017, '角色删除', 101, 4, NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system/role/delete', '0', '1', '#', '2021-04-06 21:43:09', NULL, NULL);
INSERT INTO sys_menu VALUES (1018, '角色导出', 101, 5, NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system/role/export', '0', '1', '#', '2021-04-06 21:43:09', NULL, NULL);
INSERT INTO sys_menu VALUES (1019, '角色授权用户列表', 101, 6, NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system/role/allocatedList', '0', '1', '#', '2021-04-06 21:43:09', NULL, NULL);
INSERT INTO sys_menu VALUES (1020, '角色分配用户', 101, 7, NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system/role/roleSelectUser', '0', '1', '#', '2021-04-06 21:43:09', NULL, NULL);
INSERT INTO sys_menu VALUES (1021, '角色取消用户', 101, 8, NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system/role/cancel', '0', '1', '#', '2021-04-06 21:43:09', NULL, NULL);
INSERT INTO sys_menu VALUES (1022, '菜单查询', 102, 1, NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system/menu/getOne', '0', '1', '#', '2021-04-06 21:43:09', NULL, NULL);
INSERT INTO sys_menu VALUES (1023, '菜单新增', 102, 2, NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system/menu/create', '0', '1', '#', '2021-04-06 21:43:09', NULL, NULL);
INSERT INTO sys_menu VALUES (1024, '菜单修改', 102, 3, NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system/menu/update', '0', '1', '#', '2021-04-06 21:43:09', NULL, NULL);
INSERT INTO sys_menu VALUES (1025, '菜单删除', 102, 4, NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system/menu/delete', '0', '1', '#', '2021-04-06 21:43:09', NULL, NULL);
INSERT INTO sys_menu VALUES (1026, '菜单下拉树', 102, 5, NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system/menu/treeselect', '0', '1', '#', '2021-04-06 21:43:09', NULL, NULL);
INSERT INTO sys_menu VALUES (1027, '部门查询', 103, 1, NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system/dept/getOne', '0', '1', '#', '2021-04-06 21:43:09', NULL, NULL);
INSERT INTO sys_menu VALUES (1028, '部门新增', 103, 2, NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system/dept/create', '0', '1', '#', '2021-04-06 21:43:09', NULL, NULL);
INSERT INTO sys_menu VALUES (1029, '部门修改', 103, 3, NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system/dept/update', '0', '1', '#', '2021-04-06 21:43:09', NULL, NULL);
INSERT INTO sys_menu VALUES (1030, '部门删除', 103, 4, NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system/dept/delete', '0', '1', '#', '2021-04-06 21:43:09', NULL, NULL);
INSERT INTO sys_menu VALUES (1031, '部门树结构', 103, 5, NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system/dept/treeselect', '0', '1', '#', '2021-04-06 21:43:09', NULL, NULL);
INSERT INTO sys_menu VALUES (1032, '岗位查询', 104, 1, NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system/post/getOne', '0', '1', '#', '2021-04-06 21:43:09', NULL, '2021-05-14 18:09:39');
INSERT INTO sys_menu VALUES (1033, '岗位新增', 104, 2, NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system/post/create', '0', '1', '#', '2021-04-06 21:43:09', NULL, '2021-05-14 18:09:39');
INSERT INTO sys_menu VALUES (1034, '岗位修改', 104, 3, NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system/post/update', '0', '1', '#', '2021-04-06 21:43:09', NULL, '2021-05-14 18:09:39');
INSERT INTO sys_menu VALUES (1035, '岗位删除', 104, 4, NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system/post/delete', '0', '1', '#', '2021-04-06 21:43:09', NULL, '2021-05-14 18:09:39');
INSERT INTO sys_menu VALUES (1036, '岗位导出', 104, 5, NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system/post/export', '0', '1', '#', '2021-04-06 21:43:09', NULL, '2021-05-14 18:09:39');
INSERT INTO sys_menu VALUES (1037, '字典查询', 105, 1, '#', NULL, '1', '0', NULL, 'F', '0', '0', 'system/dictType/getOne', '0', '1', '#', '2021-04-06 21:43:09', NULL, NULL);
INSERT INTO sys_menu VALUES (1038, '字典新增', 105, 2, '#', NULL, '1', '0', NULL, 'F', '0', '0', 'system/dictType/create', '0', '1', '#', '2021-04-06 21:43:09', NULL, NULL);
INSERT INTO sys_menu VALUES (1039, '字典修改', 105, 3, '#', NULL, '1', '0', NULL, 'F', '0', '0', 'system/dictType/update', '0', '1', '#', '2021-04-06 21:43:09', NULL, NULL);
INSERT INTO sys_menu VALUES (1040, '字典删除', 105, 4, '#', NULL, '1', '0', NULL, 'F', '0', '0', 'system/dictType/delete', '0', '1', '#', '2021-04-06 21:43:09', NULL, NULL);
INSERT INTO sys_menu VALUES (1041, '字典导出', 105, 5, '#', NULL, '1', '0', NULL, 'F', '0', '0', 'system/dictType/export', '0', '1', '#', '2021-04-06 21:43:09', NULL, NULL);
INSERT INTO sys_menu VALUES (1042, '字典数据查询', 105, 6, '#', NULL, '1', '0', NULL, 'F', '0', '0', 'system/dictData/getOne', '0', '1', '#', '2021-04-06 21:43:09', NULL, NULL);
INSERT INTO sys_menu VALUES (1043, '字典数据新增', 105, 7, '#', NULL, '1', '0', NULL, 'F', '0', '0', 'system/dictData/create', '0', '1', '#', '2021-04-06 21:43:09', NULL, NULL);
INSERT INTO sys_menu VALUES (1044, '字典数据修改', 105, 8, '#', NULL, '1', '0', NULL, 'F', '0', '0', 'system/dictData/update', '0', '1', '#', '2021-04-06 21:43:09', NULL, NULL);
INSERT INTO sys_menu VALUES (1045, '字典数据删除', 105, 9, '#', NULL, '1', '0', NULL, 'F', '0', '0', 'system/dictData/delete', '0', '1', '#', '2021-04-06 21:43:09', NULL, NULL);
INSERT INTO sys_menu VALUES (1046, '字典数据导出', 105, 10, '#', NULL, '1', '0', NULL, 'F', '0', '0', 'system/dictData/export', '0', '1', '#', '2021-04-06 21:43:09', NULL, NULL);
INSERT INTO sys_menu VALUES (1047, '字典类型查询数据', 105, 11, '#', NULL, '1', '0', NULL, 'F', '0', '0', 'system/dictData/type', '0', '1', '#', '2021-04-06 21:43:09', NULL, NULL);
INSERT INTO sys_menu VALUES (1048, '参数查询', 106, 1, '#', NULL, '1', '0', NULL, 'F', '0', '0', 'system/config/getOne', '0', '1', '#', '2021-04-06 21:43:09', NULL, NULL);
INSERT INTO sys_menu VALUES (1049, '参数新增', 106, 2, '#', NULL, '1', '0', NULL, 'F', '0', '0', 'system/config/create', '0', '1', '#', '2021-04-06 21:43:09', NULL, NULL);
INSERT INTO sys_menu VALUES (1050, '参数修改', 106, 3, '#', NULL, '1', '0', NULL, 'F', '0', '0', 'system/config/update', '0', '1', '#', '2021-04-06 21:43:09', NULL, NULL);
INSERT INTO sys_menu VALUES (1051, '参数删除', 106, 4, '#', NULL, '1', '0', NULL, 'F', '0', '0', 'system/config/delete', '0', '1', '#', '2021-04-06 21:43:09', NULL, NULL);
INSERT INTO sys_menu VALUES (1052, '参数导出', 106, 5, '#', NULL, '1', '0', NULL, 'F', '0', '0', 'system/config/export', '0', '1', '#', '2021-04-06 21:43:09', NULL, NULL);
INSERT INTO sys_menu VALUES (1053, '参数键查询值', 106, 6, '#', NULL, '1', '0', NULL, 'F', '0', '0', 'system/config/configKey', '0', '1', '#', '2021-04-06 21:43:09', NULL, NULL);
INSERT INTO sys_menu VALUES (1054, '公告查询', 107, 1, '#', NULL, '1', '0', NULL, 'F', '0', '0', 'system/notice/getOne', '0', '1', '#', '2021-04-06 21:43:09', NULL, '2021-05-14 18:09:39');
INSERT INTO sys_menu VALUES (1055, '公告新增', 107, 2, '#', NULL, '1', '0', NULL, 'F', '0', '0', 'system/notice/create', '0', '1', '#', '2021-04-06 21:43:09', NULL, '2021-05-14 18:09:39');
INSERT INTO sys_menu VALUES (1056, '公告修改', 107, 3, '#', NULL, '1', '0', NULL, 'F', '0', '0', 'system/notice/update', '0', '1', '#', '2021-04-06 21:43:09', NULL, '2021-05-14 18:09:39');
INSERT INTO sys_menu VALUES (1057, '公告删除', 107, 4, '#', NULL, '1', '0', NULL, 'F', '0', '0', 'system/notice/delete', '0', '1', '#', '2021-04-06 21:43:09', NULL, '2021-05-14 18:09:39');
INSERT INTO sys_menu VALUES (1058, '操作查询', 500, 1, '#', NULL, '1', '0', NULL, 'F', '0', '0', 'monitor/operLog/getOne', '0', '1', '#', '2021-04-06 21:43:09', NULL, NULL);
INSERT INTO sys_menu VALUES (1059, '操作删除', 500, 2, '#', NULL, '1', '0', NULL, 'F', '0', '0', 'monitor/operLog/delete', '0', '1', '#', '2021-04-06 21:43:09', NULL, NULL);
INSERT INTO sys_menu VALUES (1060, '操作清空', 500, 3, '#', NULL, '1', '0', NULL, 'F', '0', '0', 'monitor/operLog/clean', '0', '1', '#', '2021-04-06 21:43:09', NULL, NULL);
INSERT INTO sys_menu VALUES (1061, '登录查询', 501, 1, '#', NULL, '1', '0', NULL, 'F', '0', '0', 'monitor/loginLog/getOne', '0', '1', '#', '2021-04-06 21:43:09', NULL, NULL);
INSERT INTO sys_menu VALUES (1062, '登录删除', 501, 2, '#', NULL, '1', '0', NULL, 'F', '0', '0', 'monitor/loginLog/delete', '0', '1', '#', '2021-04-06 21:43:09', NULL, NULL);
INSERT INTO sys_menu VALUES (1063, '登录清空', 501, 3, '#', NULL, '1', '0', NULL, 'F', '0', '0', 'monitor/loginLog/clean', '0', '1', '#', '2021-04-06 21:43:09', NULL, NULL);
INSERT INTO sys_menu VALUES (1064, '批量强退', 109, 1, '#', NULL, '1', '0', NULL, 'F', '0', '0', 'monitor/online/delete', '0', '1', '#', '2021-04-06 21:43:09', NULL, NULL);
INSERT INTO sys_menu VALUES (1065, '任务查询', 110, 1, '#', NULL, '1', '0', NULL, 'F', '0', '0', 'monitor/job/getOne', '0', '1', '#', '2021-04-06 21:43:09', '2021-04-12 14:30:29', NULL);
INSERT INTO sys_menu VALUES (1066, '任务新增', 110, 2, '#', NULL, '1', '0', NULL, 'F', '0', '0', 'monitor/job/create', '0', '1', '#', '2021-04-06 21:43:09', NULL, NULL);
INSERT INTO sys_menu VALUES (1067, '任务修改', 110, 3, '#', NULL, '1', '0', NULL, 'F', '0', '0', 'monitor/job/update', '0', '1', '#', '2021-04-06 21:43:09', NULL, NULL);
INSERT INTO sys_menu VALUES (1068, '任务删除', 110, 4, '#', NULL, '1', '0', NULL, 'F', '0', '0', 'monitor/job/delete', '0', '1', '#', '2021-04-06 21:43:09', NULL, NULL);
INSERT INTO sys_menu VALUES (1069, '状态修改', 110, 5, '#', NULL, '1', '0', NULL, 'F', '0', '0', 'monitor/job/changeStatus', '0', '1', '#', '2021-04-06 21:43:09', NULL, NULL);
INSERT INTO sys_menu VALUES (1070, '任务导出', 110, 7, '#', NULL, '1', '0', NULL, 'F', '0', '0', 'monitor/job/export', '0', '1', '#', '2021-04-06 21:43:09', NULL, NULL);
INSERT INTO sys_menu VALUES (1071, '生成查询', 115, 1, '#', NULL, '1', '0', NULL, 'F', '0', '0', 'tool/gen/getOne', '0', '1', '#', '2021-04-06 21:43:09', NULL, NULL);
INSERT INTO sys_menu VALUES (1072, '生成修改', 115, 2, '#', NULL, '1', '0', NULL, 'F', '0', '0', 'tool/gen/update', '0', '1', '#', '2021-04-06 21:43:09', NULL, NULL);
INSERT INTO sys_menu VALUES (1073, '生成删除', 115, 3, '#', NULL, '1', '0', NULL, 'F', '0', '0', 'tool/gen/delete', '0', '1', '#', '2021-04-06 21:43:09', NULL, NULL);
INSERT INTO sys_menu VALUES (1074, '导入代码', 115, 2, '#', NULL, '1', '0', NULL, 'F', '0', '0', 'tool/gen/import', '0', '1', '#', '2021-04-06 21:43:09', NULL, NULL);
INSERT INTO sys_menu VALUES (1075, '预览代码', 115, 4, '#', NULL, '1', '0', NULL, 'F', '0', '0', 'tool/gen/preview', '0', '1', '#', '2021-04-06 21:43:09', NULL, NULL);
INSERT INTO sys_menu VALUES (1076, '生成代码', 115, 5, '#', NULL, '1', '0', NULL, 'F', '0', '0', 'tool/gen/code', '0', '1', '#', '2021-04-06 21:43:09', NULL, NULL);

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS sys_oper_log;
CREATE TABLE sys_oper_log (
                              oper_id SERIAL PRIMARY KEY,
                              title VARCHAR(50) NULL DEFAULT '',
                              business_type INTEGER NULL DEFAULT 0,
                              method VARCHAR(100) NULL DEFAULT '',
                              request_method VARCHAR(10) NULL DEFAULT '',
                              operator_type INTEGER NULL DEFAULT 0,
                              oper_name VARCHAR(50) NULL DEFAULT '',
                              dept_name VARCHAR(50) NULL DEFAULT '',
                              oper_url VARCHAR(255) NULL DEFAULT '',
                              oper_ip VARCHAR(128) NULL DEFAULT '',
                              oper_location VARCHAR(255) NULL DEFAULT '',
                              oper_param TEXT NULL,
                              json_result TEXT NULL,
                              status INTEGER NULL DEFAULT 0,
                              error_msg VARCHAR(2000) NULL DEFAULT '',
                              created_at TIMESTAMP WITHOUT TIME ZONE NULL DEFAULT NULL
);

COMMENT ON TABLE sys_oper_log IS '操作日志记录';
COMMENT ON COLUMN sys_oper_log.oper_id IS '日志主键';
COMMENT ON COLUMN sys_oper_log.title IS '模块标题';
COMMENT ON COLUMN sys_oper_log.business_type IS '业务类型（0其它 1新增 2删除 3修改 4查询）';
COMMENT ON COLUMN sys_oper_log.method IS '方法名称';
COMMENT ON COLUMN sys_oper_log.request_method IS '请求方式';
COMMENT ON COLUMN sys_oper_log.operator_type IS '操作类别（0其它 1后台用户 2手机端用户）';
COMMENT ON COLUMN sys_oper_log.oper_name IS '操作人员';
COMMENT ON COLUMN sys_oper_log.dept_name IS '部门名称';
COMMENT ON COLUMN sys_oper_log.oper_url IS '请求URL';
COMMENT ON COLUMN sys_oper_log.oper_ip IS '主机地址';
COMMENT ON COLUMN sys_oper_log.oper_location IS '操作地点';
COMMENT ON COLUMN sys_oper_log.oper_param IS '请求参数';
COMMENT ON COLUMN sys_oper_log.json_result IS '返回参数';
COMMENT ON COLUMN sys_oper_log.status IS '操作状态（0正常 1异常）';
COMMENT ON COLUMN sys_oper_log.error_msg IS '错误消息';
COMMENT ON COLUMN sys_oper_log.created_at IS '操作时间';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS sys_role;
CREATE TABLE sys_role (
                          role_id SERIAL PRIMARY KEY,
                          role_name VARCHAR(60) NOT NULL,
                          role_sort INTEGER NULL DEFAULT NULL,
                          status CHAR(1) NOT NULL,
                          remark VARCHAR(255) NULL DEFAULT NULL,
                          created_at TIMESTAMP WITHOUT TIME ZONE NULL DEFAULT NULL,
                          updated_at TIMESTAMP WITHOUT TIME ZONE NULL DEFAULT NULL,
                          deleted_at TIMESTAMP WITHOUT TIME ZONE NULL DEFAULT NULL
);

COMMENT ON TABLE sys_role IS '角色表';
COMMENT ON COLUMN sys_role.role_id IS '角色ID';
COMMENT ON COLUMN sys_role.role_name IS '角色名称';
COMMENT ON COLUMN sys_role.role_sort IS '显示顺序';
COMMENT ON COLUMN sys_role.status IS '角色状态（0正常 1停用）';
COMMENT ON COLUMN sys_role.remark IS '备注';
COMMENT ON COLUMN sys_role.created_at IS '创建时间';
COMMENT ON COLUMN sys_role.updated_at IS '更新时间';
COMMENT ON COLUMN sys_role.deleted_at IS '删除时间';


-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO sys_role VALUES (1, '超级管理员', 1, '0', NULL, '2021-04-05 12:20:56', '2021-04-12 11:22:09', NULL);
INSERT INTO sys_role VALUES (2, '普通用户', 2, '0', '1', '2021-04-05 13:52:54', '2022-04-10 12:26:14', NULL);
INSERT INTO sys_role VALUES (3, '游客', 3, '0', '1111111111', '2021-04-05 13:52:54', '2022-04-10 12:26:14', NULL);
INSERT INTO sys_role VALUES (4, '回种清转', 7, '0', 'dolore elit pariatur veniam', '2022-04-04 11:21:07', '2022-04-10 12:26:03', NULL);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS sys_role_menu;
CREATE TABLE sys_role_menu (
                               role_id INTEGER NOT NULL,
                               menu_id INTEGER NOT NULL,
                               PRIMARY KEY (role_id, menu_id)
);

COMMENT ON TABLE sys_role_menu IS '角色和菜单关联表';
COMMENT ON COLUMN sys_role_menu.role_id IS '角色ID';
COMMENT ON COLUMN sys_role_menu.menu_id IS '菜单ID';


-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO sys_role_menu VALUES (2, 2);
INSERT INTO sys_role_menu VALUES (2, 100);
INSERT INTO sys_role_menu VALUES (2, 101);
INSERT INTO sys_role_menu VALUES (2, 102);
INSERT INTO sys_role_menu VALUES (2, 105);
INSERT INTO sys_role_menu VALUES (2, 106);
INSERT INTO sys_role_menu VALUES (2, 107);
INSERT INTO sys_role_menu VALUES (2, 108);
INSERT INTO sys_role_menu VALUES (2, 500);
INSERT INTO sys_role_menu VALUES (2, 501);
INSERT INTO sys_role_menu VALUES (2, 1001);
INSERT INTO sys_role_menu VALUES (2, 1002);
INSERT INTO sys_role_menu VALUES (2, 1003);
INSERT INTO sys_role_menu VALUES (2, 1004);
INSERT INTO sys_role_menu VALUES (2, 1005);
INSERT INTO sys_role_menu VALUES (2, 1006);
INSERT INTO sys_role_menu VALUES (2, 1007);
INSERT INTO sys_role_menu VALUES (2, 1008);
INSERT INTO sys_role_menu VALUES (2, 1009);
INSERT INTO sys_role_menu VALUES (2, 1010);
INSERT INTO sys_role_menu VALUES (2, 1011);
INSERT INTO sys_role_menu VALUES (2, 1012);
INSERT INTO sys_role_menu VALUES (2, 1013);
INSERT INTO sys_role_menu VALUES (2, 1014);
INSERT INTO sys_role_menu VALUES (2, 1015);
INSERT INTO sys_role_menu VALUES (2, 1016);
INSERT INTO sys_role_menu VALUES (2, 1026);
INSERT INTO sys_role_menu VALUES (2, 1027);
INSERT INTO sys_role_menu VALUES (2, 1028);
INSERT INTO sys_role_menu VALUES (2, 1029);
INSERT INTO sys_role_menu VALUES (2, 1030);
INSERT INTO sys_role_menu VALUES (2, 1031);
INSERT INTO sys_role_menu VALUES (2, 1032);
INSERT INTO sys_role_menu VALUES (2, 1033);
INSERT INTO sys_role_menu VALUES (2, 1034);
INSERT INTO sys_role_menu VALUES (2, 1035);
INSERT INTO sys_role_menu VALUES (2, 1036);
INSERT INTO sys_role_menu VALUES (2, 1037);
INSERT INTO sys_role_menu VALUES (2, 1038);
INSERT INTO sys_role_menu VALUES (2, 1039);
INSERT INTO sys_role_menu VALUES (2, 1040);
INSERT INTO sys_role_menu VALUES (2, 1041);
INSERT INTO sys_role_menu VALUES (2, 1042);
INSERT INTO sys_role_menu VALUES (2, 1043);
INSERT INTO sys_role_menu VALUES (2, 1044);
INSERT INTO sys_role_menu VALUES (2, 1045);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS sys_user;
CREATE TABLE sys_user (
                          user_id SERIAL PRIMARY KEY,
                          user_name VARCHAR(30) NOT NULL,
                          nick_name VARCHAR(60),
                          password VARCHAR(100) NOT NULL,
                          mobile VARCHAR(11) NOT NULL,
                          avatar VARCHAR(255),
                          status CHAR(1) NOT NULL,
                          dept_id BIGINT,
                          remark VARCHAR(255),
                          login_ip VARCHAR(128) DEFAULT '',
                          login_date TIMESTAMP,
                          created_at TIMESTAMP,
                          updated_at TIMESTAMP,
                          deleted_at TIMESTAMP
);

COMMENT ON TABLE sys_user IS '后台用户表';
COMMENT ON COLUMN sys_user.user_id IS '用户ID';
COMMENT ON COLUMN sys_user.user_name IS '用户账号';
COMMENT ON COLUMN sys_user.nick_name IS '用户昵称';
COMMENT ON COLUMN sys_user.password IS '登录密码';
COMMENT ON COLUMN sys_user.mobile IS '手机号码';
COMMENT ON COLUMN sys_user.avatar IS '用户头像地址';
COMMENT ON COLUMN sys_user.status IS '用户状态（0正常 1停用）';
COMMENT ON COLUMN sys_user.dept_id IS '部门id';
COMMENT ON COLUMN sys_user.remark IS '备注';
COMMENT ON COLUMN sys_user.login_ip IS '最后登录IP';
COMMENT ON COLUMN sys_user.login_date IS '最后登录时间';
COMMENT ON COLUMN sys_user.created_at IS '创建时间';
COMMENT ON COLUMN sys_user.updated_at IS '更新时间';
COMMENT ON COLUMN sys_user.deleted_at IS '删除时间';


-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO sys_user VALUES (1, 'admin', '张三2', 'admin', '13306955991', NULL, '0', 100, NULL, '', NULL, '2016-12-10 18:20:54', '2022-04-13 14:30:44', NULL);
INSERT INTO sys_user VALUES (2, 'admin1', '熊子韬', '123456', '13383097147', NULL, '0', 103, NULL, '', NULL, '2001-05-22 16:40:18', '2022-04-11 17:34:29', NULL);
INSERT INTO sys_user VALUES (3, 'Song Ziyi', '宋子异', 'N57icHZE8H', '13380294485', NULL, '0', 100, NULL, '', NULL, '2011-04-29 23:10:39', '2014-07-10 11:58:56', NULL);
INSERT INTO sys_user VALUES (4, 'Jiang Xiuying', '蒋秀英', 'TEOWJ9MQWw', '13308985072', NULL, '0', 100, NULL, '', NULL, '2006-04-27 18:26:31', '2022-04-13 14:51:24', NULL);
INSERT INTO sys_user VALUES (5, 'Yu Lu', '于璐', 'nKfJlwcUWP', '13377340669', NULL, '0', 100, NULL, '', NULL, '2016-05-02 11:19:09', '2008-07-15 21:30:40', NULL);
INSERT INTO sys_user VALUES (6, 'Zhu Yunxi', '朱云熙', 'J7hOluztMq', '13374414913', NULL, '0', 100, NULL, '', NULL, '2008-02-18 00:16:40', '2018-12-06 12:56:27', NULL);
INSERT INTO sys_user VALUES (7, 'He Shihan', '贺詩涵', 'ZDy2TpkJzA', '13346790787', NULL, '0', 100, NULL, '', NULL, '2018-01-27 22:41:00', '2018-04-21 17:59:59', NULL);
INSERT INTO sys_user VALUES (8, 'Meng Rui', '孟睿', 'gyG1kFURfE', '13385848456', NULL, '0', 100, NULL, '', NULL, '2003-10-28 03:01:26', '2011-08-08 22:08:15', NULL);
INSERT INTO sys_user VALUES (9, 'Yao Lan', '姚岚', 'FH8NvNHZym', '13391029254', NULL, '0', 100, NULL, '', NULL, '2007-09-06 00:04:00', '2001-01-05 21:15:59', NULL);
INSERT INTO sys_user VALUES (10, 'Shi Shihan', '石詩涵', 'NbYJFTzvA2', '13337380665', NULL, '0', 100, NULL, '', NULL, '2021-07-07 14:28:18', '2001-04-15 00:27:39', NULL);
INSERT INTO sys_user VALUES (13, '高芳', '龙娟', '6V^7^nOEH', '18676426764', '', '0', 100, NULL, '', NULL, '2022-04-02 17:55:57', '2022-04-04 09:49:13', NULL);
INSERT INTO sys_user VALUES (14, '3333', '111', '123456', '15093278800', '', '0', 100, '', '', NULL, '2022-04-11 16:41:15', '2022-04-11 16:41:15', '2022-04-11 16:41:28');
INSERT INTO sys_user VALUES (15, '333', '111', '123456', '15093278800', '', '0', 100, '', '', NULL, '2022-04-11 16:43:10', '2022-04-11 16:43:10', '2022-04-11 16:43:16');

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS sys_user_online;
CREATE TABLE sys_user_online (
                                 id SERIAL PRIMARY KEY,
                                 token VARCHAR(255) NOT NULL DEFAULT '',
                                 user_id BIGINT,
                                 user_name VARCHAR(60),
                                 os VARCHAR(30) DEFAULT '',
                                 ipaddr VARCHAR(128) DEFAULT '',
                                 login_location VARCHAR(255) DEFAULT '',
                                 browser VARCHAR(50) DEFAULT '',
                                 created_at TIMESTAMP
);

CREATE UNIQUE INDEX uni_token ON sys_user_online(token);

COMMENT ON TABLE sys_user_online IS '用户在线状态表';
COMMENT ON COLUMN sys_user_online.id IS '用户ID';
COMMENT ON COLUMN sys_user_online.token IS '用户token';
COMMENT ON COLUMN sys_user_online.user_id IS '用户id';
COMMENT ON COLUMN sys_user_online.user_name IS '用户名';
COMMENT ON COLUMN sys_user_online.os IS '操作系统';
COMMENT ON COLUMN sys_user_online.ipaddr IS '登录IP地址';
COMMENT ON COLUMN sys_user_online.login_location IS '登录地点';
COMMENT ON COLUMN sys_user_online.browser IS '浏览器类型';
COMMENT ON COLUMN sys_user_online.created_at IS '登录时间';


-- ----------------------------
-- Records of sys_user_online
-- ----------------------------
INSERT INTO sys_user_online VALUES (142, '46kkum0cjan6su35wmk1000mxmqmxsq1', 1, 'admin', 'Windows 7', '127.0.0.1', '内网IP', 'Chrome', '2022-04-15 15:41:14');
INSERT INTO sys_user_online VALUES (141, '1uzr24fcjaltu1m06h8200hy43pb5kc1', 2, 'admin1', 'Windows 7', '127.0.0.1', '内网IP', 'Chrome', '2022-04-15 14:37:17');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS sys_user_role;
CREATE TABLE sys_user_role (
                               user_id INT NOT NULL,
                               role_id INT NOT NULL,
                               PRIMARY KEY (user_id, role_id)
);

COMMENT ON TABLE sys_user_role IS '用户和角色关联表';
COMMENT ON COLUMN sys_user_role.user_id IS '用户ID';
COMMENT ON COLUMN sys_user_role.role_id IS '角色ID';


-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO sys_user_role VALUES (1, 1);
INSERT INTO sys_user_role VALUES (2, 2);
INSERT INTO sys_user_role VALUES (2, 3);
INSERT INTO sys_user_role VALUES (2, 4);
INSERT INTO sys_user_role VALUES (5, 2);

-- ----------------------------
-- Table structure for tools_gen_table
-- ----------------------------
DROP TABLE IF EXISTS tools_gen_table;
CREATE TABLE tools_gen_table (
                                 table_id BIGSERIAL PRIMARY KEY,
                                 table_name VARCHAR(200) NOT NULL DEFAULT '',
                                 table_comment VARCHAR(500) NOT NULL DEFAULT '',
                                 tpl_category VARCHAR(200) NOT NULL DEFAULT 'crud',
                                 object_name VARCHAR(30),
                                 api_file VARCHAR(30),
                                 controller_file VARCHAR(30),
                                 server_file VARCHAR(30),
                                 function_name VARCHAR(50),
                                 function_author VARCHAR(50),
                                 options VARCHAR(1000),
                                 remark VARCHAR(500),
                                 created_at TIMESTAMP,
                                 updated_at TIMESTAMP,
                                 deleted_at TIMESTAMP
);

COMMENT ON TABLE tools_gen_table IS '代码生成业务表';
COMMENT ON COLUMN tools_gen_table.table_id IS '编号';
COMMENT ON COLUMN tools_gen_table.table_name IS '表名称';
COMMENT ON COLUMN tools_gen_table.table_comment IS '表描述';
COMMENT ON COLUMN tools_gen_table.tpl_category IS '使用的模板（crud单表操作 tree树表操作）';
COMMENT ON COLUMN tools_gen_table.object_name IS '数据对象名称';
COMMENT ON COLUMN tools_gen_table.api_file IS 'api文件夹';
COMMENT ON COLUMN tools_gen_table.controller_file IS 'controller文件夹';
COMMENT ON COLUMN tools_gen_table.server_file IS 'server文件夹';
COMMENT ON COLUMN tools_gen_table.function_name IS '生成功能描述';
COMMENT ON COLUMN tools_gen_table.function_author IS '生成功能作者';
COMMENT ON COLUMN tools_gen_table.options IS '其它生成选项';
COMMENT ON COLUMN tools_gen_table.remark IS '备注';
COMMENT ON COLUMN tools_gen_table.created_at IS '创建时间';
COMMENT ON COLUMN tools_gen_table.updated_at IS '更新时间';
COMMENT ON COLUMN tools_gen_table.deleted_at IS '删除时间';


-- ----------------------------
-- Records of tools_gen_table
-- ----------------------------
INSERT INTO tools_gen_table VALUES (65, 'demo_gen_class', '代码生成关联测试表', 'crud', NULL, NULL, NULL, NULL, '代码生成关联测试', 'gfast', '', '', NULL, NULL, NULL);
INSERT INTO tools_gen_table VALUES (68, 'demo_gen_tree', '代码生成树形结构测试表', 'tree', NULL, NULL, NULL, NULL, '代码生成树形结构测试', 'gfast', '{\"treeCode\":\"id\",\"treeName\":\"demoName\",\"treeParentCode\":\"parentId\"}', '', NULL, NULL, NULL);
INSERT INTO tools_gen_table VALUES (69, 'demo_gen', '代码生成测试表', 'crud', NULL, NULL, NULL, NULL, '代码生成测试', 'gfast', '', '', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for tools_gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS tools_gen_table_column;
CREATE TABLE tools_gen_table_column (
                                        column_id BIGSERIAL PRIMARY KEY,
                                        table_id BIGINT,
                                        column_name VARCHAR(200),
                                        column_comment VARCHAR(500),
                                        column_type VARCHAR(100),
                                        go_type VARCHAR(500),
                                        go_field VARCHAR(200),
                                        html_field VARCHAR(200),
                                        is_pk CHAR(1),
                                        is_increment CHAR(1),
                                        is_required CHAR(1),
                                        is_insert CHAR(1),
                                        is_edit CHAR(1),
                                        is_list CHAR(1),
                                        is_query CHAR(1),
                                        query_type VARCHAR(200) DEFAULT 'EQ',
                                        html_type VARCHAR(200),
                                        dict_type VARCHAR(200) DEFAULT '',
                                        sort INTEGER,
                                        link_table_name VARCHAR(50),
                                        link_table_class VARCHAR(50),
                                        link_table_package VARCHAR(150),
                                        link_label_id VARCHAR(50),
                                        link_label_name VARCHAR(50)
);

COMMENT ON TABLE tools_gen_table_column IS '代码生成业务表字段';
COMMENT ON COLUMN tools_gen_table_column.column_id IS '编号';
COMMENT ON COLUMN tools_gen_table_column.table_id IS '归属表编号';
COMMENT ON COLUMN tools_gen_table_column.column_name IS '列名称';
COMMENT ON COLUMN tools_gen_table_column.column_comment IS '列描述';
COMMENT ON COLUMN tools_gen_table_column.column_type IS '列类型';
COMMENT ON COLUMN tools_gen_table_column.go_type IS 'Go类型';
COMMENT ON COLUMN tools_gen_table_column.go_field IS 'Go字段名';
COMMENT ON COLUMN tools_gen_table_column.html_field IS 'html字段名';
COMMENT ON COLUMN tools_gen_table_column.is_pk IS '是否主键（1是）';
COMMENT ON COLUMN tools_gen_table_column.is_increment IS '是否自增（1是）';
COMMENT ON COLUMN tools_gen_table_column.is_required IS '是否必填（1是）';
COMMENT ON COLUMN tools_gen_table_column.is_insert IS '是否为插入字段（1是）';
COMMENT ON COLUMN tools_gen_table_column.is_edit IS '是否编辑字段（1是）';
COMMENT ON COLUMN tools_gen_table_column.is_list IS '是否列表字段（1是）';
COMMENT ON COLUMN tools_gen_table_column.is_query IS '是否查询字段（1是）';
COMMENT ON COLUMN tools_gen_table_column.query_type IS '查询方式（等于、不等于、大于、小于、范围）';
COMMENT ON COLUMN tools_gen_table_column.html_type IS '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）';
COMMENT ON COLUMN tools_gen_table_column.dict_type IS '字典类型';
COMMENT ON COLUMN tools_gen_table_column.sort IS '排序';
COMMENT ON COLUMN tools_gen_table_column.link_table_name IS '关联表名';
COMMENT ON COLUMN tools_gen_table_column.link_table_class IS '关联表类名';
COMMENT ON COLUMN tools_gen_table_column.link_table_package IS '关联表包名';
COMMENT ON COLUMN tools_gen_table_column.link_label_id IS '关联表键名';
COMMENT ON COLUMN tools_gen_table_column.link_label_name IS '关联表字段值';


-- ----------------------------
-- Records of tools_gen_table_column
-- ----------------------------
INSERT INTO tools_gen_table_column VALUES (666, 65, 'id', '分类id', 'int(10) unsigned', 'uint', 'Id', 'id', '1', '1', '0', '0', '0', '1', '0', 'EQ', 'input', '', 1, '', '', '', '', '');
INSERT INTO tools_gen_table_column VALUES (667, 65, 'class_name', '分类名', 'varchar(30)', 'string', 'ClassName', 'className', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, '', '', '', '', '');
INSERT INTO tools_gen_table_column VALUES (693, 68, 'id', 'ID', 'int(11) unsigned', 'uint', 'Id', 'id', '1', '1', '0', '0', '0', '0', '0', 'EQ', 'input', '', 1, '', '', '', '', '');
INSERT INTO tools_gen_table_column VALUES (694, 68, 'parent_id', '父级ID', 'int(10) unsigned', 'uint', 'ParentId', 'parentId', '0', '0', '1', '1', '1', '0', '0', 'EQ', 'select', '', 2, '', '', '', '', '');
INSERT INTO tools_gen_table_column VALUES (695, 68, 'demo_name', '姓名', 'varchar(20)', 'string', 'DemoName', 'demoName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, '', '', '', '', '');
INSERT INTO tools_gen_table_column VALUES (696, 68, 'demo_age', '年龄', 'int(10) unsigned', 'uint', 'DemoAge', 'demoAge', '0', '0', '1', '1', '1', '1', '', 'EQ', 'input', '', 4, '', '', '', '', '');
INSERT INTO tools_gen_table_column VALUES (697, 68, 'classes', '班级', 'varchar(30)', 'string', 'Classes', 'classes', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 5, 'demo_gen_class', 'DemoGenClass', 'gfast/app/system', 'id', 'className');
INSERT INTO tools_gen_table_column VALUES (698, 68, 'demo_born', '出生年月', 'timestamp', 'Time', 'DemoBorn', 'demoBorn', '0', '0', '', '1', '1', '1', '', 'EQ', 'timestamp', '', 6, '', '', '', '', '');
INSERT INTO tools_gen_table_column VALUES (699, 68, 'demo_gender', '性别', 'tinyint(3) unsigned', 'uint', 'DemoGender', 'demoGender', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'sys_user_sex', 7, '', '', '', '', '');
INSERT INTO tools_gen_table_column VALUES (700, 68, 'created_at', '创建日期', 'timestamp', 'Time', 'CreatedAt', 'createdAt', '0', '0', '0', '0', '0', '1', '1', 'EQ', 'timestamp', '', 8, '', '', '', '', '');
INSERT INTO tools_gen_table_column VALUES (701, 68, 'updated_at', '修改日期', 'timestamp', 'Time', 'UpdatedAt', 'updatedAt', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'timestamp', '', 9, '', '', '', '', '');
INSERT INTO tools_gen_table_column VALUES (702, 68, 'deleted_at', '删除日期', 'timestamp', 'Time', 'DeletedAt', 'deletedAt', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'timestamp', '', 10, '', '', '', '', '');
INSERT INTO tools_gen_table_column VALUES (703, 68, 'created_by', '创建人', 'bigint(20) unsigned', 'uint64', 'CreatedBy', 'createdBy', '0', '0', '0', '0', '0', '1', '0', 'EQ', 'input', '', 11, '', '', '', '', '');
INSERT INTO tools_gen_table_column VALUES (704, 68, 'updated_by', '修改人', 'bigint(20) unsigned', 'uint64', 'UpdatedBy', 'updatedBy', '0', '0', '0', '0', '0', '1', '0', 'EQ', 'input', '', 12, '', '', '', '', '');
INSERT INTO tools_gen_table_column VALUES (705, 68, 'demo_status', '状态', 'tinyint(4)', 'int', 'DemoStatus', 'demoStatus', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', 'sys_normal_disable', 13, '', '', '', '', '');
INSERT INTO tools_gen_table_column VALUES (706, 68, 'demo_cate', '分类', 'varchar(30)', 'string', 'DemoCate', 'demoCate', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'checkbox', 'cms_news_type', 14, '', '', '', '', '');
INSERT INTO tools_gen_table_column VALUES (707, 69, 'id', '', 'int(11) unsigned', 'uint', 'Id', 'id', '1', '1', '0', '0', '0', '0', '0', 'EQ', 'input', '', 1, '', '', '', '', '');
INSERT INTO tools_gen_table_column VALUES (708, 69, 'demo_name', '姓名', 'varchar(20)', 'string', 'DemoName', 'demoName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, '', '', '', '', '');
INSERT INTO tools_gen_table_column VALUES (709, 69, 'demo_age', '年龄', 'int(10) unsigned', 'uint', 'DemoAge', 'demoAge', '0', '0', '1', '1', '1', '1', '', 'EQ', 'input', '', 3, '', '', '', '', '');
INSERT INTO tools_gen_table_column VALUES (710, 69, 'classes', '班级', 'varchar(30)', 'string', 'Classes', 'classes', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 4, 'demo_gen_class', 'DemoGenClass', 'gfast/app/system', 'id', 'className');
INSERT INTO tools_gen_table_column VALUES (711, 69, 'demo_born', '出生年月', 'timestamp', 'Time', 'DemoBorn', 'demoBorn', '0', '0', '', '1', '1', '1', '', 'EQ', 'timestamp', '', 5, '', '', '', '', '');
INSERT INTO tools_gen_table_column VALUES (712, 69, 'demo_gender', '性别', 'tinyint(3) unsigned', 'uint', 'DemoGender', 'demoGender', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'sys_user_sex', 6, '', '', '', '', '');
INSERT INTO tools_gen_table_column VALUES (713, 69, 'created_at', '创建日期', 'timestamp', 'Time', 'CreatedAt', 'createdAt', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'timestamp', '', 7, '', '', '', '', '');
INSERT INTO tools_gen_table_column VALUES (714, 69, 'updated_at', '修改日期', 'timestamp', 'Time', 'UpdatedAt', 'updatedAt', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'timestamp', '', 8, '', '', '', '', '');
INSERT INTO tools_gen_table_column VALUES (715, 69, 'deleted_at', '删除日期', 'timestamp', 'Time', 'DeletedAt', 'deletedAt', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'timestamp', '', 9, '', '', '', '', '');
INSERT INTO tools_gen_table_column VALUES (716, 69, 'created_by', '创建人', 'bigint(20) unsigned', 'uint64', 'CreatedBy', 'createdBy', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', 10, '', '', '', '', '');
INSERT INTO tools_gen_table_column VALUES (717, 69, 'updated_by', '修改人', 'bigint(20) unsigned', 'uint64', 'UpdatedBy', 'updatedBy', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', 11, '', '', '', '', '');
INSERT INTO tools_gen_table_column VALUES (718, 69, 'demo_status', '状态', 'tinyint(4)', 'int', 'DemoStatus', 'demoStatus', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', 'sys_normal_disable', 12, '', '', '', '', '');
INSERT INTO tools_gen_table_column VALUES (719, 69, 'demo_cate', '分类', 'varchar(30)', 'string', 'DemoCate', 'demoCate', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'checkbox', 'cms_news_type', 13, '', '', '', '', '');

SET FOREIGN_KEY_CHECKS = 1;
