# 《spring + springMVC + MyBatis 整合 纯净版》
> 版本信息

> spring 4.3.7.RELEASE

> mybatis 3.4.2

> springmvc 4.3.7.RELEASE

> maven 3.3.9

## 一、创建工程（==特殊步骤 小插曲==）
##### 1. 创建maven工程，==不需要勾选 【create fromarchetype】直接next==
##### 2. 搭建 web工程 开发环境
- ***配置webapp 资源文件：***
- 新建webapp文件夹： main/webapp（==新建的webapp 文件夹上没有一个圆点，说明还不是web资源目录需要如下配置==）
- 打开 ==File > project structure > modules==
- 选中项目，点击 + 号，添加 web 组件；添加成功，选中web行，==从下 往上看==，如下：
- 双加 web Resource Directory 列 的第一行（有就双击，没有就右边 +号 添加），跳出文件路径选择弹窗；
- ==选择 项目中 新建的 webapp 作为 根目录==，至此web 资源文件夹配置完成，点击apply，就可以看见 项目结构上的web文件夹上 有一个圆点。
- ***配置 自动生成 web.xml 配置文件：***
- 还是 上面那个页面（==module> web > deployment descriptors）
- 删除 默认 项，重新添加 web.xml 并修改路径：web\WEB-INF\web.xml --> ==main\webapp\WEB-INF\web.xml==
- 此时可以看到 webapp\WEB-INF\web.xml 文件
##### - ==maven java web 工程 配置完成==


---

## 二、ssm 环境搭建
###  1、引入 项目依赖

```
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>

    <groupId>com.nn</groupId>
    <artifactId>ssm_pure</artifactId>
    <version>1.0-SNAPSHOT</version>
    <packaging>war</packaging>

    <properties>
        <!-- spring 版本-->
        <spring.version>4.3.7.RELEASE</spring.version>

        <!-- json 依赖 版本-->
        <jackson.version>2.8.9</jackson.version>

        <!-- 分页助手 版本-->
        <pagehelper.version>5.1.2</pagehelper.version>

        <!-- 代理 版本-->
        <cglib.version>3.2.2</cglib.version>
        <logback-classic.version>1.2.3</logback-classic.version>

        <!-- mybatis 版本-->
        <mybatis.version>3.4.2</mybatis.version>

        <!-- spring+mybatis 整合版本-->
        <spring-mybatis>1.3.1</spring-mybatis>

        <!-- mysql 驱动-->
        <mysql.version>5.1.37</mysql.version>

        <!-- c3p0 连接池-->
        <c3p0.version>0.9.1.2</c3p0.version>

    </properties>

    <dependencies>
        <!-- 单元测试所需jar包 -->
        <dependency>
            <groupId>junit</groupId>
            <artifactId>junit</artifactId>
            <version>4.12</version>
            <scope>test</scope>
        </dependency>

        <!-- https://mvnrepository.com/artifact/ch.qos.logback/logback-classic -->
        <!-- 日志jar包 -->
        <dependency>
            <groupId>ch.qos.logback</groupId>
            <artifactId>logback-classic</artifactId>
            <version>${logback-classic.version}</version>
        </dependency>

        <!-- 4.Spring -->
        <!-- 1)Spring核心 -->
        <!-- 1)包含spring框架的核心工具类，spring其他组件都要使用到这个包里的类，是其他组件的基本核心 -->
        <dependency>
            <groupId>org.springframework</groupId>
            <artifactId>spring-core</artifactId>
            <version>${spring.version}</version>
        </dependency>
        <!-- 2)这个jar包是所有文件都要用到的，它包含访问配置文件、创建和管理bean以及进行（ioc/Di）
        操作相关的所有类，如果应用只需要基本的（ioc/Di）操作，引入core与bean的jar包就足够了 -->
        <dependency>
            <groupId>org.springframework</groupId>
            <artifactId>spring-beans</artifactId>
            <version>${spring.version}</version>
        </dependency>
        <!-- 3)这个jae包为spring核心提供了大量的扩展，可以找到使用spring ApplicationContext特性时所需的全部标签及所需要
        的全部的类，instrumentation组件及校验Validation方面的相关类。 -->
        <dependency>
            <groupId>org.springframework</groupId>
            <artifactId>spring-context</artifactId>
            <version>${spring.version}</version>
        </dependency>
        <!-- 二)Spring DAO层 -->
        <!-- 4)这个jar文件包含 Spring 对JDBC 数据访问进行封装的所有类 -->
        <dependency>
            <groupId>org.springframework</groupId>
            <artifactId>spring-jdbc</artifactId>
            <version>${spring.version}</version>
        </dependency>
        <!-- 5)为JDBC、Hibernat、JDO、JPA 等提供的一致的声明式和编程式 事务管理-->
        <dependency>
            <groupId>org.springframework</groupId>
            <artifactId>spring-tx</artifactId>
            <version>${spring.version}</version>
        </dependency>
        <!-- 三)Spring web -->
        <!-- 6)Spring web包含web应用开发时，用到spring框架时所需的核心类，包括自动载入WebApplicationContext -->
        <dependency>
            <groupId>org.springframework</groupId>
            <artifactId>spring-web</artifactId>
            <version>${spring.version}</version>
        </dependency>
        <!-- 7)包含SpringMVC框架相关的所有类。 -->
        <dependency>
            <groupId>org.springframework</groupId>
            <artifactId>spring-webmvc</artifactId>
            <version>${spring.version}</version>
        </dependency>
        <!-- 四)Spring test -->
        <!-- 8)Spring test 对JUNIT等测试框架的简单封装 -->
        <dependency>
            <groupId>org.springframework</groupId>
            <artifactId>spring-test</artifactId>
            <version>${spring.version}</version>
            <scope>test</scope>
        </dependency>

        <!-- Servlet web -->
        <!-- servlet-api主要用来提供servlet服务的 -->
        <dependency>
            <groupId>javax.servlet</groupId>
            <artifactId>javax.servlet-api</artifactId>
            <version>3.1.0</version>
        </dependency>

        <!-- DAO: MyBatis所有基础类库 -->
        <dependency>
            <groupId>org.mybatis</groupId>
            <artifactId>mybatis</artifactId>
            <version>${mybatis.version}</version>
        </dependency>
        <!-- mybatis-spring整合包 -->
        <dependency>
            <groupId>org.mybatis</groupId>
            <artifactId>mybatis-spring</artifactId>
            <version>${spring-mybatis}</version>
        </dependency>

        <!-- 2.数据库 -->
        <!-- mysql-connector-java用来支持JDBC与mysql的交互 -->
        <dependency>
            <groupId>mysql</groupId>
            <artifactId>mysql-connector-java</artifactId>
            <version>${mysql.version}</version>
            <scope>runtime</scope>
        </dependency>
        <!-- 连接池所需jar包 -->
        <dependency>
            <groupId>c3p0</groupId>
            <artifactId>c3p0</artifactId>
            <version>${c3p0.version}</version>
        </dependency>


        <!-- json解析 依赖-->
        <!-- https://mvnrepository.com/artifact/com.fasterxml.jackson.core/jackson-annotations -->
        <dependency>
            <groupId>com.fasterxml.jackson.core</groupId>
            <artifactId>jackson-annotations</artifactId>
            <version>${jackson.version}</version>
        </dependency>

        <!-- https://mvnrepository.com/artifact/com.fasterxml.jackson.core/jackson-core -->
        <dependency>
            <groupId>com.fasterxml.jackson.core</groupId>
            <artifactId>jackson-core</artifactId>
            <version>${jackson.version}</version>
        </dependency>

        <!-- https://mvnrepository.com/artifact/com.fasterxml.jackson.core/jackson-databind -->
        <dependency>
            <groupId>com.fasterxml.jackson.core</groupId>
            <artifactId>jackson-databind</artifactId>
            <version>${jackson.version}</version>
        </dependency>
        <!-- json解析 依赖-->


        <!-- 文件上传-->
        <!-- https://mvnrepository.com/artifact/commons-fileupload/commons-fileupload -->
        <dependency>
            <groupId>commons-fileupload</groupId>
            <artifactId>commons-fileupload</artifactId>
            <version>1.3.3</version>
        </dependency>
        <!-- https://mvnrepository.com/artifact/commons-io/commons-io -->
        <dependency>
            <groupId>commons-io</groupId>
            <artifactId>commons-io</artifactId>
            <version>2.4</version>
        </dependency>
        <!-- 文件上传-->

        <!--  分页助手 -->
        <dependency>
            <groupId>com.github.pagehelper</groupId>
            <artifactId>pagehelper</artifactId>
            <version>${pagehelper.version}</version>
        </dependency>
        <!-- 分页助手 -->

        <!-- 代理 -->
        <dependency>
            <groupId>cglib</groupId>
            <artifactId>cglib</artifactId>
            <version>${cglib.version}</version>
        </dependency>
        <!-- 代理 -->

    </dependencies>

    <build>
        <!-- 配置编译依赖工具 -->
        <plugins>
            <plugin>
                <!-- https://mvnrepository.com/artifact/org.apache.maven.plugins/maven-compiler-plugin -->
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-compiler-plugin</artifactId>
                <version>3.8.0</version>
                <configuration>
                    <source>1.8</source>
                    <target>1.8</target>
                    <encoding>UTF8</encoding>
                </configuration>
            </plugin>

            <!--mybatis 代码子自动生成 mvn 插件-->
            <plugin>
                <groupId>org.mybatis.generator</groupId>
                <artifactId>mybatis-generator-maven-plugin</artifactId>
                <version>1.3.6</version>
                <dependencies>
                    <dependency>
                        <groupId>mysql</groupId>
                        <artifactId>mysql-connector-java</artifactId>
                        <version>5.1.38</version>
                    </dependency>
                </dependencies>
                <configuration>                         <!--配置文件的路径-->
                    <configurationFile>${basedir}/src/main/resources/generator/generatorConfig.xml</configurationFile>
                    <overwrite>true</overwrite>
                </configuration>
            </plugin>
        </plugins>
        <resources>
            <resource>
                <directory>src/main/java</directory>
                <includes>
                    <include>**/*.xml</include>
                </includes>
            </resource>

            <resource>
                <directory>src/main/resources</directory>
                <includes>
                    <include>**/*.*</include>
                </includes>
            </resource>

            <resource>
                <directory>src/main/webapp</directory>
                <targetPath>META-INF/resources</targetPath>
                <includes>
                    <include>**/*.*</include>
                </includes>
            </resource>
        </resources>
    </build>
</project>
```

###  2、配置文件说明
- spring 配置文件：**resources/applicationContext.xml**
- springmvc 配置文件：**resources/springmvc.xml**
- mybatis 配置文件：**resources/mybatis-config.xml**
- 数据库连接参数配置文件：**resources/jdbc.properties**
- 日志文件：**resources/log4j.property**

### 3、spring 整合 SpringMVC

#### 3.1、web.xml
- a、配置默认欢迎页面：**welcome-file-list**
- b、配置处理中文乱码 的过滤器类：**CharacterEncodingFilter**
- c、配置 spring 监听器：**ContextLoaderListener**
- d、配置 springmvc 入口核心类：**DispatcherServlet**
- e、配置错误页面：**error-page**

```
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns="http://xmlns.jcp.org/xml/ns/javaee"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_4_0.xsd"
         version="4.0">


    <!-- 0、配置默认访问页面-->
    <welcome-file-list>
        <welcome-file>/pages/front/index.jsp</welcome-file>
    </welcome-file-list>

    <!-- 1、配置处理中文乱码的过滤器类-->
    <filter>
        <filter-name>characterEncodingFilter</filter-name>
        <filter-class>org.springframework.web.filter.CharacterEncodingFilter</filter-class>
        <init-param>
            <param-name>encoding</param-name>
            <param-value>UTF-8</param-value>
        </init-param>
    </filter>
    <filter-mapping>
        <filter-name>characterEncodingFilter</filter-name>
        <url-pattern>/*</url-pattern>
    </filter-mapping>

    <!--2、配置 spring 监听器-->
    <context-param>
        <param-name>contextConfigLocation</param-name>
        <param-value>classpath:applicationContext.xml</param-value>
    </context-param>
    <listener>
        <listener-class>org.springframework.web.context.ContextLoaderListener</listener-class>
    </listener>

    <!-- 3、配置springmvc 核心类-->
    <servlet>
        <servlet-name>dispatcherServlet</servlet-name>
        <servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
        <init-param>
            <param-name>contextConfigLocation</param-name>
            <param-value>classpath:springmvc.xml</param-value>
        </init-param>
        <load-on-startup>1</load-on-startup>
    </servlet>
    <servlet-mapping>
        <servlet-name>dispatcherServlet</servlet-name>
        <url-pattern>/</url-pattern>
    </servlet-mapping>

    <!-- 4、配置错误页面-->
    <error-page>
        <error-code>404</error-code>
        <location>/pages/error/404.jsp</location>
    </error-page>
</web-app>
```

#### 3.2、springmvc.xml
- a、配置注解扫描：**context:compoent-scan**
- b、开启springmvc 注解驱动：**mvc:annotation-driven**
- c、配置视图解析器：**InternalResourceViewResolver**
- d、配置文件上传：**CommonsMultipartResolver**

```
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xmlns:context="http://www.springframework.org/schema/context"
       xmlns:mvc="http://www.springframework.org/schema/mvc"
       xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd http://www.springframework.org/schema/context http://www.springframework.org/schema/context/spring-context.xsd http://www.springframework.org/schema/mvc http://www.springframework.org/schema/mvc/spring-mvc.xsd">


    <!--1、配置 包扫描-->
    <context:component-scan base-package="com.nn"/>


    <!--2、开启 springMVC 注解驱动-->
    <mvc:annotation-driven/>


    <!--3、配置视图解析器-->
    <bean id="internalResourceViewResolver" class="org.springframework.web.servlet.view.InternalResourceViewResolver">
        <!--前缀-->
        <property name="prefix" value="/pages/"></property>

        <!-- 后缀-->
        <property name="suffix" value=""></property>
    </bean>

    <!--4、配置文件上传
        id 值 固定为：multipartResolver
    -->
    <bean id="multipartResolver" class="org.springframework.web.multipart.commons.CommonsMultipartResolver">
        <!-- 配置编码-->
        <property name="defaultEncoding" value="UTF-8"></property>

        <!-- 配置 单个文件上传最大值，单位byte，如果为：-1，表示无限制-->
        <property name="maxUploadSize" value="-1"></property>
    </bean>

    <!--5、配置定时器 任务-->


</beans>
```

#### 3.3、applicationContext.xml  spring 核心配置文件
- a、开启注解扫描：**context:component-scan**


```
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xmlns:context="http://www.springframework.org/schema/context"
       xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd http://www.springframework.org/schema/context http://www.springframework.org/schema/context/spring-context.xsd">

    <!-- 1、配置 注解自动关机扫描-->
    <context:component-scan base-package="com.nn"/>


</beans>
```

至此：spring + springmvc 整合完成
---

---

### 4、spring 整合 mybatis
> 将 mybatis 交给 spring 管理，在 applicationContext.xml 中配置 mybatis数据库连接信息

#### 4.1、jdbc.properties
> 数据库连接信息，提供给 applicationContext.xml 文件中调用其属性

```
jdbc.driverClassName=com.mysql.jdbc.Driver
jdbc.url=jdbc:mysql://localhost:3306/ssm?useUnicode=true&characterEncoding=utf-8
jdbc.username=root
jdbc.password=root
```

#### 4.2、applicationContext.xml
- a、配置读取 jdbc.properties配置文件的工具类：**propertyPlaceholderConfigurer**
- b、配置数据源及数据库连接池：c3p0：**ComboPooledDataSource**
- c、读取书写sql语句的xml文件的位置：**SqlSessionFactoryBean**
    - 注入数据源：**dataSource**
    - 指定 Mapper映射文件所在位置：**mapperLocations**
    - 指定mybatis 主配置文件位置：**configLocation**
- d、将Mapper dao 接口 与 映射文件关联：**MapperScannerConfigurer**
    - 指定Mapper 接口所在包：**basePackage**
    - 注入sqlSessionFactory：**sqlSessionFactoryBeanName**
- e、配置事务管理器：**DataSourceTransactionManager**
    - 注入数据库连接池： **datasources** 
- f、开启事务：**tx:annotation-driven**

```
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xmlns:context="http://www.springframework.org/schema/context" xmlns:tx="http://www.springframework.org/schema/tx"
       xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd http://www.springframework.org/schema/context http://www.springframework.org/schema/context/spring-context.xsd http://www.springframework.org/schema/tx http://www.springframework.org/schema/tx/spring-tx.xsd">

    <!-- 0、配置 注解自动扫描-->
    <context:component-scan base-package="com.nn"/>

    <!-- 1、配置读取 jdbc.properties配置文件的工具类-->
    <bean id="propertyPlaceholderConfigurer"
          class="org.springframework.beans.factory.config.PropertyPlaceholderConfigurer">
        <property name="location" value="classpath:jdbc.properties"></property>
    </bean>


    <!-- 2、配置数据源及数据库连接池-->
    <bean id="dataSource" class="com.mchange.v2.c3p0.ComboPooledDataSource">
        <property name="driverClass" value="${jdbc.driverClassName}"></property>
        <property name="jdbcUrl" value="${jdbc.url}"></property>
        <property name="user" value="${jdbc.username}"></property>
        <property name="password" value="${jdbc.password}"></property>

        <!-- c3p0连接池的私有属性 -->
        <property name="maxPoolSize" value="30"/>
        <property name="minPoolSize" value="10"/>
        <!-- 关闭连接后不自动commit -->
        <property name="autoCommitOnClose" value="false"/>
        <!-- 获取连接超时时间 -->
        <property name="checkoutTimeout" value="1000"/>
        <!-- 当获取连接失败重试次数 -->
        <property name="acquireRetryAttempts" value="2"></property>
    </bean>

    <!-- 3、读取书写sql语句的xml文件的位置：sqlSessionFactoryBean-->
    <bean id="sqlSessionFactory" class="org.mybatis.spring.SqlSessionFactoryBean">
        <!-- 注入数据源-->
        <property name="dataSource" ref="dataSource"></property>

        <!--&lt;!&ndash;指定mapper映射文件的存放位置&ndash;&gt;-->
        <property name="mapperLocations">
            <list>
                <value>classpath:mapping/*.xml</value>
            </list>
        </property>

        <!-- 指定 mybatis 主配置文件-->
        <property name="configLocation" value="classpath:mybatis-config.xml"></property>
    </bean>

    <!-- 4、读取dao层接口类，将dao接口与对应的xml 文件关联-->
    <bean id="mapperScannerConfigurer" class="org.mybatis.spring.mapper.MapperScannerConfigurer">
        <!-- 指定 dao 接口类的位置-->
        <property name="basePackage" value="com.nn.mapper"></property>

        <!-- 注入sqlSessionFactory -->
        <property name="sqlSessionFactoryBeanName" value="sqlSessionFactory"></property>
    </bean>

    <!-- 配置事务管理器=============================== -->
    <bean id="transactionManager" class="org.springframework.jdbc.datasource.DataSourceTransactionManager">
        <!-- 注入数据库连接池 -->
        <property name="dataSource" ref="dataSource"/>
    </bean>

    <!-- 开启注解事务=============== -->
    <tx:annotation-driven transaction-manager="transactionManager"/>


</beans>
```


#### 4.3、mybatis-config.xml

```
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE configuration
        PUBLIC "-//mybatis.org//DTD Config 3.0//EN"
        "http://mybatis.org/dtd/mybatis-3-config.dtd">
<configuration>

    <settings>
        <setting name="cacheEnabled" value="true"/>
        <setting name="defaultStatementTimeout" value="3000"/>
        <setting name="mapUnderscoreToCamelCase" value="true"/>
        <!-- 代理 -->
        <setting name="proxyFactory" value="CGLIB"/>
        <setting name="lazyLoadingEnabled" value="true"/>
    </settings>

    <!-- 分页插件 -->
    <plugins>
        <plugin interceptor="com.github.pagehelper.PageInterceptor">
            <!-- 该参数默认为false
            设置为true时，会将RowBounds第一个参数offset当成pageNum页码使用
            和startPage中的pageNum效果一样 -->
            <property name="offsetAsPageNum" value="true"/>
            <!-- 该参数默认为false
            设置为true是，使用RowBounds分页会进行count查询 -->
            <property name="rowBoundsWithCount" value="true"/>
            <!-- 设置为true时，如果pageSize=0或者ROwRounds.limit=0就会查询出全部的结果
            （相当于每一偶执行分页查询，但是返回结果仍然是page类型） -->
            <property name="pageSizeZero" value="true"/>
        </plugin>
    </plugins>

</configuration>
```

至此：spring 整合 mybatis 完毕
---


---

## 5、开始测试ssm 项目是否整合成功

> 数据库创建 请查看：ssm 数据库sql文件.xml 

#### 5.1、创建 user 实体类：com.nn.pojo.User.java

```
    private Long u_id;
    private String username;
    private String sex;
```

#### 5.2、创建 Mapper dao 接口：com.nn.mapper.UserMapper.java

```
public interface UserMapper {

    public List<User> queryAll();
}
```


#### 5.3、创建 mapper 映射文件：resources\mapping\UserMapper.xml
###### ==**1、特别注意 mapper 标签中的 namespace 属性值，该值是对应实体类 mapper接口**==

==**2、mapper 映射文件 和 mapper 接口 文件名称必须相同：UserMapper.xml > UserMapper.java**==

==**3、select 标签id属性值 必须和 mapper接口中定义的方法 名称相同，并且返回值也相对应**==

```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="com.nn.mapper.UserMapper">
    <resultMap id="BaseResultMap" type="com.nn.pojo.User">
        <id column="u_id" jdbcType="INTEGER" property="u_id"/>
        <result column="username" jdbcType="VARCHAR" property="username"/>
        <result column="sex" jdbcType="VARCHAR" property="sex"/>
    </resultMap>
    <sql id="Base_Column_List">
        u_id, username, sex
    </sql>

    <select id="queryAll" resultMap="BaseResultMap">
        select
        <include refid="Base_Column_List" ></include>
        from user
    </select>
</mapper>
```
#### 5.4、mapper接口 直接调用
- mapper 接口 不需要使用spring注解注入IOC容器
- 直接 在 service中直接注入 mapper接口并调用方法： 

```
    @Resource
    private UserMapper userMapper;

    @Override
    public List<User> queryAll() {
        return userMapper.queryAll();
    }
```
- controller 调用 service

```
    @Resource(name = "userServiceImp")
    private UserService userService;

    @RequestMapping("queryAll")
    public Object queryAll(){
        return userService.queryAll();
    }
```
**访问controller：http://localhost:8080/ssm_pure/queryAll**

## 到这里 就整合完毕