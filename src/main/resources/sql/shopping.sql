create database mystic_toy_shop;
use mystic_toy_shop;

drop table if exists payments;
drop table if exists orders;
drop table if exists carts;
drop table if exists qnas;
drop table if exists reviews;
drop table if exists products;
drop table if exists categories;
drop table if exists sellers;
drop table if exists users;
drop table if exists files;
drop table if exists Authority;

CREATE TABLE users (
                       user_id INT AUTO_INCREMENT PRIMARY KEY,
                       user_email VARCHAR(50) NOT NULL UNIQUE,
                       user_password VARCHAR(20) NOT NULL,
                       user_name VARCHAR(10) NOT NULL,
                       user_zipcode VARCHAR(10),
                       user_address VARCHAR(1000),
                       user_phone VARCHAR(20) NOT NULL,
                       user_gender DECIMAL(1),
                       user_register_date timestamp NOT NULL,
                       user_kakao_identifier bigint default 0,
                       is_activated BOOLEAN NOT NULL DEFAULT TRUE,
                       auth_id INT NOT NULL
);

CREATE TABLE sellers (
                         seller_id INT AUTO_INCREMENT PRIMARY KEY,
                         seller_email VARCHAR(50) NOT NULL UNIQUE,
                         seller_password VARCHAR(20) NOT NULL,
                         seller_name VARCHAR(10),
                         seller_zipcode VARCHAR(10),
                         seller_address VARCHAR(1000),
                         seller_phone VARCHAR(20),
                         seller_company_name VARCHAR(20),
                         seller_company_number VARCHAR(20),
                         seller_business_number VARCHAR(15),
                         seller_register_date timestamp NOT NULL,
                         is_activated BOOLEAN NOT NULL DEFAULT TRUE,
                         auth_id INT NOT NULL
);

CREATE TABLE products (
                          product_id INT AUTO_INCREMENT PRIMARY KEY,
                          product_name VARCHAR(50),
                          product_info VARCHAR(1000),
                          product_img VARCHAR(1000),
                          product_cost INT,
                          product_stock INT,
                          product_sell_count INT,
                          category_id INT NOT NULL,
                          seller_id INT NOT NULL
);

CREATE TABLE orders (
                        order_id INT AUTO_INCREMENT PRIMARY KEY,
                        order_group int not null,
                        order_total_price INT NOT NULL,
                        order_address VARCHAR(1000),
                        order_phone VARCHAR(100),
                        order_comment VARCHAR(1000),
                        order_date timestamp NOT NULL,
                        order_quantity INT NOT NULL,
                        user_id int NOT NULL,
                        product_id INT NOT NULL
);

CREATE TABLE carts (
                       cart_id INT AUTO_INCREMENT PRIMARY KEY,
                       cart_quantity INT NOT NULL,
                       user_id int NOT NULL,
                       product_id INT NOT NULL
);

CREATE TABLE categories (
                            category_id INT AUTO_INCREMENT PRIMARY KEY,
                            category_name VARCHAR(100)
);

CREATE TABLE payments (
                          product_id INT NOT NULL,
                          order_id INT NOT NULL,
                          ship_status CHAR(1) NOT NULL
);

CREATE TABLE reviews (
                         review_id INT AUTO_INCREMENT PRIMARY KEY,
                         review_title varchar(50) not null,
                         review_content varchar(1000) not null,
                         review_writer INT not null,
                         review_rate int not null default 0, -- 사용자평점
                         review_register_date timestamp not null,
                         ref_id int not null default 0,
                         is_deleted char(1) not null default 0,
                         product_id int not null
);

CREATE TABLE files(
                      file_id INT AUTO_INCREMENT PRIMARY KEY,
                      file_original_name varchar(1000) not null,
                      file_name varchar(1000) not null,
                      file_where_use char(1) not null,
                      file_use_id INT not null
);

CREATE TABLE qnas (
                      qna_id INT AUTO_INCREMENT PRIMARY KEY,
                      qna_title varchar(50) not null,
                      qna_content varchar(1000) not null,
                      qna_writer INT not null,
                      qna_register_date timestamp not null,
                      ref_id int not null default 0,
                      is_deleted boolean not null default true,
                      is_secret char(1) not null default 0,
                      product_id INT not null
);

CREATE TABLE Authority (
                           auth_id INT AUTO_INCREMENT PRIMARY KEY,
                           auth_type char(1) not null unique,
                           auth_role varchar(10) not null
);

alter table products
    add constraint products_fk foreign key(category_id) references categories(category_id);
alter table products
    add constraint products_fk2 foreign key(seller_id) references sellers(seller_id);

alter table orders
    add constraint orders_fk foreign key(user_id) references users(user_id);
alter table orders
    add constraint orders_fk2 foreign key(product_id) references products(product_id);

alter table carts
    add constraint carts_fk foreign key(user_id) references users(user_id);
alter table carts
    add constraint carts_fk2 foreign key(product_id) references products(product_id);

alter table payments
    add constraint payments_fk foreign key(product_id) references products(product_id);
alter table payments
    add constraint payments_fk2 foreign key(order_id) references orders(order_id);

alter table reviews
    add constraint reviews_fk foreign key(product_id) references products(product_id);

alter table qnas
    add constraint qnas_fk foreign key(product_id) references products(product_id);

alter table users
    add constraint users_fk foreign key(auth_id) references Authority(auth_id);

alter table sellers
    add constraint sellers_fk foreign key(auth_id) references Authority(auth_id);

insert into Authority(auth_type, auth_role) values('0','SELLER');
insert into Authority(auth_type, auth_role) values('1','USER');
