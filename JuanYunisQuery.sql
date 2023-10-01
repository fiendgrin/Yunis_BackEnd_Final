Use JuanYunisDb

Insert INTO Sliders
(Image,Text,BtnText,Link,IsDeleted,CreatedAt,CreatedBy,DeletedAt,DeletedBy,UpdatedAt,UpdatedBy)
Values
('slider-1.jpg',
'<h5 class="slide-subtitle">Top Selling!</h5>
                                        <h2 class="slide-title">New Collection</h2>
                                        <p class="slide-desc">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incidid</p>',
'SHOP NOW','Product/Index',0,'2023-09-29','Yunis',null,null,null,null),
('slider-2.jpg',
'<h5 class="slide-subtitle">Best Selling!</h5>
                                        <h2 class="slide-title">Top Collection</h2>
                                        <p class="slide-desc">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incidid</p>',
'SHOP NOW','Product/Index',0,'2023-09-29','Yunis',null,null,null,null)


Insert INTO Settings
Values
('WelcomeMessage','Welcome to Juan online store'),
('Location','184 Main Rd E, St Albans VIC 3021, Australia'),
('Email','yourmail@gmail.com'),
('Phone','+ 00 254 254565'),
('Facebook','facebook.com'),
('Twitter','twitter.com'),
('LinkedIn','linkedin.com'),
('Instagram','instagram.com'),
('ContactAddress','No 40 Baria Sreet 133/2 NewYork City'),
('ContactEmail',' info@yourdomain.com'),
('ContactPhone',' +88013245657'),
('ContactWorkingHours','<span>Monday – Saturday:</span>08AM – 22PM'),
('ContactDescription','Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. 
Mirum est notare quam littera gothica, quam nunc putamus parum claram anteposuerit litterarum formas human.')


Insert INTO Categories
Values
('Sneakers',0,'2023-09-29','Yunis',null,null,null,null),
('Running',0,'2023-09-29','Yunis',null,null,null,null),
('Lifestyle',0,'2023-09-29','Yunis',null,null,null,null),
('Workout & Gym',0,'2023-09-29','Yunis',null,null,null,null),
('Sandals & Slides',0,'2023-09-29','Yunis',null,null,null,null),
('Hiking',0,'2023-09-29','Yunis',null,null,null,null),
('Football',0,'2023-09-29','Yunis',null,null,null,null),
('Basketball',0,'2023-09-29','Yunis',null,null,null,null),
('Tennis',0,'2023-09-29','Yunis',null,null,null,null),
('Golf',0,'2023-09-29','Yunis',null,null,null,null)


Insert INTO Products
Values
('Product1',90,0,10,2,'amet porttitor eget dolor morbi non arcu risus quis varius quam 
quisque id diam vel quam elementum pulvinar etiam non quam lacus suspendisse faucibus 
interdum posuere lorem ipsum dolor sit',
'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Ipsum metus feugiat sem, quis fermentum turpis eros eget velit. Donec ac tempus ante. Fusce ultricies massa massa. Fusce aliquam, purus eget sagittis vulputate, sapien libero hendrerit est, sed commodo augue nisi non neque.</p>
<div class="review-description">
<div class="tab-thumb">
</div>
<div class="tab-des">
<h3>Product Information :</h3>
<ul>
<li>Donec non est at libero vulputate rutrum</li>
<li>Morbi ornare lectus quis justo gravida</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
<li>Donec a neque libero</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
</ul>
</div>
</div>
<p>Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet 
ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam erat mi, 
rutrum at sollicitudin rhoncus, ultricies posuere erat. Duis convallis, arcu nec aliquam consequat, purus felis vehicula felis, a 
dapibus enim lorem nec augue. Nunc facilisis sagittis ullamcorper.</p>
<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus
orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla 
luctus malesuada tincidunt.</p>',
0,0,1,
0,'2023-09-30','Yunis',null,null,null,null),
('Product2',80,40,8,10,'amet porttitor eget dolor morbi non arcu risus quis varius quam 
quisque id diam vel quam elementum pulvinar etiam non quam lacus suspendisse faucibus 
interdum posuere lorem ipsum dolor sit',
'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Ipsum metus feugiat sem, quis fermentum turpis eros eget velit. Donec ac tempus ante. Fusce ultricies massa massa. Fusce aliquam, purus eget sagittis vulputate, sapien libero hendrerit est, sed commodo augue nisi non neque.</p>
<div class="review-description">
<div class="tab-thumb">
</div>
<div class="tab-des">
<h3>Product Information :</h3>
<ul>
<li>Donec non est at libero vulputate rutrum</li>
<li>Morbi ornare lectus quis justo gravida</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
<li>Donec a neque libero</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
</ul>
</div>
</div>
<p>Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet 
ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam erat mi, 
rutrum at sollicitudin rhoncus, ultricies posuere erat. Duis convallis, arcu nec aliquam consequat, purus felis vehicula felis, a 
dapibus enim lorem nec augue. Nunc facilisis sagittis ullamcorper.</p>
<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus
orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla 
luctus malesuada tincidunt.</p>',
0,0,2,
0,'2023-09-30','Yunis',null,null,null,null),
('Product3',20,12,0,0,'amet porttitor eget dolor morbi non arcu risus quis varius quam 
quisque id diam vel quam elementum pulvinar etiam non quam lacus suspendisse faucibus 
interdum posuere lorem ipsum dolor sit',
'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Ipsum metus feugiat sem, quis fermentum turpis eros eget velit. Donec ac tempus ante. Fusce ultricies massa massa. Fusce aliquam, purus eget sagittis vulputate, sapien libero hendrerit est, sed commodo augue nisi non neque.</p>
<div class="review-description">
<div class="tab-thumb">
</div>
<div class="tab-des">
<h3>Product Information :</h3>
<ul>
<li>Donec non est at libero vulputate rutrum</li>
<li>Morbi ornare lectus quis justo gravida</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
<li>Donec a neque libero</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
</ul>
</div>
</div>
<p>Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet 
ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam erat mi, 
rutrum at sollicitudin rhoncus, ultricies posuere erat. Duis convallis, arcu nec aliquam consequat, purus felis vehicula felis, a 
dapibus enim lorem nec augue. Nunc facilisis sagittis ullamcorper.</p>
<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus
orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla 
luctus malesuada tincidunt.</p>',
1,0,3,
0,'2023-09-30','Yunis',null,null,null,null),
('Product4',100,10,10,18,'amet porttitor eget dolor morbi non arcu risus quis varius quam 
quisque id diam vel quam elementum pulvinar etiam non quam lacus suspendisse faucibus 
interdum posuere lorem ipsum dolor sit',
'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Ipsum metus feugiat sem, quis fermentum turpis eros eget velit. Donec ac tempus ante. Fusce ultricies massa massa. Fusce aliquam, purus eget sagittis vulputate, sapien libero hendrerit est, sed commodo augue nisi non neque.</p>
<div class="review-description">
<div class="tab-thumb">
</div>
<div class="tab-des">
<h3>Product Information :</h3>
<ul>
<li>Donec non est at libero vulputate rutrum</li>
<li>Morbi ornare lectus quis justo gravida</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
<li>Donec a neque libero</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
</ul>
</div>
</div>
<p>Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet 
ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam erat mi, 
rutrum at sollicitudin rhoncus, ultricies posuere erat. Duis convallis, arcu nec aliquam consequat, purus felis vehicula felis, a 
dapibus enim lorem nec augue. Nunc facilisis sagittis ullamcorper.</p>
<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus
orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla 
luctus malesuada tincidunt.</p>',
0,1,4,
0,'2023-09-30','Yunis',null,null,null,null),
('Product5',70,30,5,1,'amet porttitor eget dolor morbi non arcu risus quis varius quam 
quisque id diam vel quam elementum pulvinar etiam non quam lacus suspendisse faucibus 
interdum posuere lorem ipsum dolor sit',
'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Ipsum metus feugiat sem, quis fermentum turpis eros eget velit. Donec ac tempus ante. Fusce ultricies massa massa. Fusce aliquam, purus eget sagittis vulputate, sapien libero hendrerit est, sed commodo augue nisi non neque.</p>
<div class="review-description">
<div class="tab-thumb">
</div>
<div class="tab-des">
<h3>Product Information :</h3>
<ul>
<li>Donec non est at libero vulputate rutrum</li>
<li>Morbi ornare lectus quis justo gravida</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
<li>Donec a neque libero</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
</ul>
</div>
</div>
<p>Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet 
ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam erat mi, 
rutrum at sollicitudin rhoncus, ultricies posuere erat. Duis convallis, arcu nec aliquam consequat, purus felis vehicula felis, a 
dapibus enim lorem nec augue. Nunc facilisis sagittis ullamcorper.</p>
<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus
orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla 
luctus malesuada tincidunt.</p>',
0,0,5,
0,'2023-09-30','Yunis',null,null,null,null),
('Product6',20,0,0,2,'amet porttitor eget dolor morbi non arcu risus quis varius quam 
quisque id diam vel quam elementum pulvinar etiam non quam lacus suspendisse faucibus 
interdum posuere lorem ipsum dolor sit',
'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Ipsum metus feugiat sem, quis fermentum turpis eros eget velit. Donec ac tempus ante. Fusce ultricies massa massa. Fusce aliquam, purus eget sagittis vulputate, sapien libero hendrerit est, sed commodo augue nisi non neque.</p>
<div class="review-description">
<div class="tab-thumb">
</div>
<div class="tab-des">
<h3>Product Information :</h3>
<ul>
<li>Donec non est at libero vulputate rutrum</li>
<li>Morbi ornare lectus quis justo gravida</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
<li>Donec a neque libero</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
</ul>
</div>
</div>
<p>Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet 
ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam erat mi, 
rutrum at sollicitudin rhoncus, ultricies posuere erat. Duis convallis, arcu nec aliquam consequat, purus felis vehicula felis, a 
dapibus enim lorem nec augue. Nunc facilisis sagittis ullamcorper.</p>
<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus
orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla 
luctus malesuada tincidunt.</p>',
1,0,6,
0,'2023-09-30','Yunis',null,null,null,null),
('Product7',120,0,20,10,'amet porttitor eget dolor morbi non arcu risus quis varius quam 
quisque id diam vel quam elementum pulvinar etiam non quam lacus suspendisse faucibus 
interdum posuere lorem ipsum dolor sit',
'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Ipsum metus feugiat sem, quis fermentum turpis eros eget velit. Donec ac tempus ante. Fusce ultricies massa massa. Fusce aliquam, purus eget sagittis vulputate, sapien libero hendrerit est, sed commodo augue nisi non neque.</p>
<div class="review-description">
<div class="tab-thumb">
</div>
<div class="tab-des">
<h3>Product Information :</h3>
<ul>
<li>Donec non est at libero vulputate rutrum</li>
<li>Morbi ornare lectus quis justo gravida</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
<li>Donec a neque libero</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
</ul>
</div>
</div>
<p>Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet 
ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam erat mi, 
rutrum at sollicitudin rhoncus, ultricies posuere erat. Duis convallis, arcu nec aliquam consequat, purus felis vehicula felis, a 
dapibus enim lorem nec augue. Nunc facilisis sagittis ullamcorper.</p>
<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus
orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla 
luctus malesuada tincidunt.</p>',
0,1,7,
0,'2023-09-30','Yunis',null,null,null,null),
('Product8',45,40,0,0,'amet porttitor eget dolor morbi non arcu risus quis varius quam 
quisque id diam vel quam elementum pulvinar etiam non quam lacus suspendisse faucibus 
interdum posuere lorem ipsum dolor sit',
'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Ipsum metus feugiat sem, quis fermentum turpis eros eget velit. Donec ac tempus ante. Fusce ultricies massa massa. Fusce aliquam, purus eget sagittis vulputate, sapien libero hendrerit est, sed commodo augue nisi non neque.</p>
<div class="review-description">
<div class="tab-thumb">
</div>
<div class="tab-des">
<h3>Product Information :</h3>
<ul>
<li>Donec non est at libero vulputate rutrum</li>
<li>Morbi ornare lectus quis justo gravida</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
<li>Donec a neque libero</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
</ul>
</div>
</div>
<p>Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet 
ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam erat mi, 
rutrum at sollicitudin rhoncus, ultricies posuere erat. Duis convallis, arcu nec aliquam consequat, purus felis vehicula felis, a 
dapibus enim lorem nec augue. Nunc facilisis sagittis ullamcorper.</p>
<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus
orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla 
luctus malesuada tincidunt.</p>',
0,0,8,
0,'2023-09-30','Yunis',null,null,null,null),
('Product9',10,0,1,20,'amet porttitor eget dolor morbi non arcu risus quis varius quam 
quisque id diam vel quam elementum pulvinar etiam non quam lacus suspendisse faucibus 
interdum posuere lorem ipsum dolor sit',
'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Ipsum metus feugiat sem, quis fermentum turpis eros eget velit. Donec ac tempus ante. Fusce ultricies massa massa. Fusce aliquam, purus eget sagittis vulputate, sapien libero hendrerit est, sed commodo augue nisi non neque.</p>
<div class="review-description">
<div class="tab-thumb">
</div>
<div class="tab-des">
<h3>Product Information :</h3>
<ul>
<li>Donec non est at libero vulputate rutrum</li>
<li>Morbi ornare lectus quis justo gravida</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
<li>Donec a neque libero</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
</ul>
</div>
</div>
<p>Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet 
ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam erat mi, 
rutrum at sollicitudin rhoncus, ultricies posuere erat. Duis convallis, arcu nec aliquam consequat, purus felis vehicula felis, a 
dapibus enim lorem nec augue. Nunc facilisis sagittis ullamcorper.</p>
<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus
orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla 
luctus malesuada tincidunt.</p>',
0,0,9,
0,'2023-09-30','Yunis',null,null,null,null),
('Product10',370,340,50,10,'amet porttitor eget dolor morbi non arcu risus quis varius quam 
quisque id diam vel quam elementum pulvinar etiam non quam lacus suspendisse faucibus 
interdum posuere lorem ipsum dolor sit',
'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Ipsum metus feugiat sem, quis fermentum turpis eros eget velit. Donec ac tempus ante. Fusce ultricies massa massa. Fusce aliquam, purus eget sagittis vulputate, sapien libero hendrerit est, sed commodo augue nisi non neque.</p>
<div class="review-description">
<div class="tab-thumb">
</div>
<div class="tab-des">
<h3>Product Information :</h3>
<ul>
<li>Donec non est at libero vulputate rutrum</li>
<li>Morbi ornare lectus quis justo gravida</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
<li>Donec a neque libero</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
</ul>
</div>
</div>
<p>Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet 
ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam erat mi, 
rutrum at sollicitudin rhoncus, ultricies posuere erat. Duis convallis, arcu nec aliquam consequat, purus felis vehicula felis, a 
dapibus enim lorem nec augue. Nunc facilisis sagittis ullamcorper.</p>
<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus
orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla 
luctus malesuada tincidunt.</p>',
1,0,10,
0,'2023-09-30','Yunis',null,null,null,null),

('Product11',90,0,10,2,'amet porttitor eget dolor morbi non arcu risus quis varius quam 
quisque id diam vel quam elementum pulvinar etiam non quam lacus suspendisse faucibus 
interdum posuere lorem ipsum dolor sit',
'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Ipsum metus feugiat sem, quis fermentum turpis eros eget velit. Donec ac tempus ante. Fusce ultricies massa massa. Fusce aliquam, purus eget sagittis vulputate, sapien libero hendrerit est, sed commodo augue nisi non neque.</p>
<div class="review-description">
<div class="tab-thumb">
</div>
<div class="tab-des">
<h3>Product Information :</h3>
<ul>
<li>Donec non est at libero vulputate rutrum</li>
<li>Morbi ornare lectus quis justo gravida</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
<li>Donec a neque libero</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
</ul>
</div>
</div>
<p>Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet 
ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam erat mi, 
rutrum at sollicitudin rhoncus, ultricies posuere erat. Duis convallis, arcu nec aliquam consequat, purus felis vehicula felis, a 
dapibus enim lorem nec augue. Nunc facilisis sagittis ullamcorper.</p>
<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus
orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla 
luctus malesuada tincidunt.</p>',
0,0,1,
0,'2023-09-30','Yunis',null,null,null,null),
('Product12',80,40,8,10,'amet porttitor eget dolor morbi non arcu risus quis varius quam 
quisque id diam vel quam elementum pulvinar etiam non quam lacus suspendisse faucibus 
interdum posuere lorem ipsum dolor sit',
'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Ipsum metus feugiat sem, quis fermentum turpis eros eget velit. Donec ac tempus ante. Fusce ultricies massa massa. Fusce aliquam, purus eget sagittis vulputate, sapien libero hendrerit est, sed commodo augue nisi non neque.</p>
<div class="review-description">
<div class="tab-thumb">
</div>
<div class="tab-des">
<h3>Product Information :</h3>
<ul>
<li>Donec non est at libero vulputate rutrum</li>
<li>Morbi ornare lectus quis justo gravida</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
<li>Donec a neque libero</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
</ul>
</div>
</div>
<p>Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet 
ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam erat mi, 
rutrum at sollicitudin rhoncus, ultricies posuere erat. Duis convallis, arcu nec aliquam consequat, purus felis vehicula felis, a 
dapibus enim lorem nec augue. Nunc facilisis sagittis ullamcorper.</p>
<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus
orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla 
luctus malesuada tincidunt.</p>',
0,0,2,
0,'2023-09-30','Yunis',null,null,null,null),
('Product13',20,12,0,0,'amet porttitor eget dolor morbi non arcu risus quis varius quam 
quisque id diam vel quam elementum pulvinar etiam non quam lacus suspendisse faucibus 
interdum posuere lorem ipsum dolor sit',
'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Ipsum metus feugiat sem, quis fermentum turpis eros eget velit. Donec ac tempus ante. Fusce ultricies massa massa. Fusce aliquam, purus eget sagittis vulputate, sapien libero hendrerit est, sed commodo augue nisi non neque.</p>
<div class="review-description">
<div class="tab-thumb">
</div>
<div class="tab-des">
<h3>Product Information :</h3>
<ul>
<li>Donec non est at libero vulputate rutrum</li>
<li>Morbi ornare lectus quis justo gravida</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
<li>Donec a neque libero</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
</ul>
</div>
</div>
<p>Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet 
ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam erat mi, 
rutrum at sollicitudin rhoncus, ultricies posuere erat. Duis convallis, arcu nec aliquam consequat, purus felis vehicula felis, a 
dapibus enim lorem nec augue. Nunc facilisis sagittis ullamcorper.</p>
<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus
orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla 
luctus malesuada tincidunt.</p>',
1,0,3,
0,'2023-09-30','Yunis',null,null,null,null),
('Product14',100,10,10,18,'amet porttitor eget dolor morbi non arcu risus quis varius quam 
quisque id diam vel quam elementum pulvinar etiam non quam lacus suspendisse faucibus 
interdum posuere lorem ipsum dolor sit',
'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Ipsum metus feugiat sem, quis fermentum turpis eros eget velit. Donec ac tempus ante. Fusce ultricies massa massa. Fusce aliquam, purus eget sagittis vulputate, sapien libero hendrerit est, sed commodo augue nisi non neque.</p>
<div class="review-description">
<div class="tab-thumb">
</div>
<div class="tab-des">
<h3>Product Information :</h3>
<ul>
<li>Donec non est at libero vulputate rutrum</li>
<li>Morbi ornare lectus quis justo gravida</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
<li>Donec a neque libero</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
</ul>
</div>
</div>
<p>Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet 
ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam erat mi, 
rutrum at sollicitudin rhoncus, ultricies posuere erat. Duis convallis, arcu nec aliquam consequat, purus felis vehicula felis, a 
dapibus enim lorem nec augue. Nunc facilisis sagittis ullamcorper.</p>
<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus
orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla 
luctus malesuada tincidunt.</p>',
0,1,4,
0,'2023-09-30','Yunis',null,null,null,null),
('Product15',70,30,5,1,'amet porttitor eget dolor morbi non arcu risus quis varius quam 
quisque id diam vel quam elementum pulvinar etiam non quam lacus suspendisse faucibus 
interdum posuere lorem ipsum dolor sit',
'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Ipsum metus feugiat sem, quis fermentum turpis eros eget velit. Donec ac tempus ante. Fusce ultricies massa massa. Fusce aliquam, purus eget sagittis vulputate, sapien libero hendrerit est, sed commodo augue nisi non neque.</p>
<div class="review-description">
<div class="tab-thumb">
</div>
<div class="tab-des">
<h3>Product Information :</h3>
<ul>
<li>Donec non est at libero vulputate rutrum</li>
<li>Morbi ornare lectus quis justo gravida</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
<li>Donec a neque libero</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
</ul>
</div>
</div>
<p>Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet 
ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam erat mi, 
rutrum at sollicitudin rhoncus, ultricies posuere erat. Duis convallis, arcu nec aliquam consequat, purus felis vehicula felis, a 
dapibus enim lorem nec augue. Nunc facilisis sagittis ullamcorper.</p>
<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus
orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla 
luctus malesuada tincidunt.</p>',
0,0,5,
0,'2023-09-30','Yunis',null,null,null,null),
('Product16',20,0,0,2,'amet porttitor eget dolor morbi non arcu risus quis varius quam 
quisque id diam vel quam elementum pulvinar etiam non quam lacus suspendisse faucibus 
interdum posuere lorem ipsum dolor sit',
'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Ipsum metus feugiat sem, quis fermentum turpis eros eget velit. Donec ac tempus ante. Fusce ultricies massa massa. Fusce aliquam, purus eget sagittis vulputate, sapien libero hendrerit est, sed commodo augue nisi non neque.</p>
<div class="review-description">
<div class="tab-thumb">
</div>
<div class="tab-des">
<h3>Product Information :</h3>
<ul>
<li>Donec non est at libero vulputate rutrum</li>
<li>Morbi ornare lectus quis justo gravida</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
<li>Donec a neque libero</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
</ul>
</div>
</div>
<p>Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet 
ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam erat mi, 
rutrum at sollicitudin rhoncus, ultricies posuere erat. Duis convallis, arcu nec aliquam consequat, purus felis vehicula felis, a 
dapibus enim lorem nec augue. Nunc facilisis sagittis ullamcorper.</p>
<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus
orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla 
luctus malesuada tincidunt.</p>',
1,0,6,
0,'2023-09-30','Yunis',null,null,null,null),
('Product17',120,0,20,10,'amet porttitor eget dolor morbi non arcu risus quis varius quam 
quisque id diam vel quam elementum pulvinar etiam non quam lacus suspendisse faucibus 
interdum posuere lorem ipsum dolor sit',
'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Ipsum metus feugiat sem, quis fermentum turpis eros eget velit. Donec ac tempus ante. Fusce ultricies massa massa. Fusce aliquam, purus eget sagittis vulputate, sapien libero hendrerit est, sed commodo augue nisi non neque.</p>
<div class="review-description">
<div class="tab-thumb">
</div>
<div class="tab-des">
<h3>Product Information :</h3>
<ul>
<li>Donec non est at libero vulputate rutrum</li>
<li>Morbi ornare lectus quis justo gravida</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
<li>Donec a neque libero</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
</ul>
</div>
</div>
<p>Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet 
ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam erat mi, 
rutrum at sollicitudin rhoncus, ultricies posuere erat. Duis convallis, arcu nec aliquam consequat, purus felis vehicula felis, a 
dapibus enim lorem nec augue. Nunc facilisis sagittis ullamcorper.</p>
<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus
orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla 
luctus malesuada tincidunt.</p>',
0,1,7,
0,'2023-09-30','Yunis',null,null,null,null),
('Product18',45,40,0,0,'amet porttitor eget dolor morbi non arcu risus quis varius quam 
quisque id diam vel quam elementum pulvinar etiam non quam lacus suspendisse faucibus 
interdum posuere lorem ipsum dolor sit',
'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Ipsum metus feugiat sem, quis fermentum turpis eros eget velit. Donec ac tempus ante. Fusce ultricies massa massa. Fusce aliquam, purus eget sagittis vulputate, sapien libero hendrerit est, sed commodo augue nisi non neque.</p>
<div class="review-description">
<div class="tab-thumb">
</div>
<div class="tab-des">
<h3>Product Information :</h3>
<ul>
<li>Donec non est at libero vulputate rutrum</li>
<li>Morbi ornare lectus quis justo gravida</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
<li>Donec a neque libero</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
</ul>
</div>
</div>
<p>Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet 
ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam erat mi, 
rutrum at sollicitudin rhoncus, ultricies posuere erat. Duis convallis, arcu nec aliquam consequat, purus felis vehicula felis, a 
dapibus enim lorem nec augue. Nunc facilisis sagittis ullamcorper.</p>
<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus
orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla 
luctus malesuada tincidunt.</p>',
0,0,8,
0,'2023-09-30','Yunis',null,null,null,null),
('Product19',10,0,1,20,'amet porttitor eget dolor morbi non arcu risus quis varius quam 
quisque id diam vel quam elementum pulvinar etiam non quam lacus suspendisse faucibus 
interdum posuere lorem ipsum dolor sit',
'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Ipsum metus feugiat sem, quis fermentum turpis eros eget velit. Donec ac tempus ante. Fusce ultricies massa massa. Fusce aliquam, purus eget sagittis vulputate, sapien libero hendrerit est, sed commodo augue nisi non neque.</p>
<div class="review-description">
<div class="tab-thumb">
</div>
<div class="tab-des">
<h3>Product Information :</h3>
<ul>
<li>Donec non est at libero vulputate rutrum</li>
<li>Morbi ornare lectus quis justo gravida</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
<li>Donec a neque libero</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
</ul>
</div>
</div>
<p>Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet 
ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam erat mi, 
rutrum at sollicitudin rhoncus, ultricies posuere erat. Duis convallis, arcu nec aliquam consequat, purus felis vehicula felis, a 
dapibus enim lorem nec augue. Nunc facilisis sagittis ullamcorper.</p>
<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus
orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla 
luctus malesuada tincidunt.</p>',
0,0,9,
0,'2023-09-30','Yunis',null,null,null,null),
('Product20',370,340,50,10,'amet porttitor eget dolor morbi non arcu risus quis varius quam 
quisque id diam vel quam elementum pulvinar etiam non quam lacus suspendisse faucibus 
interdum posuere lorem ipsum dolor sit',
'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Ipsum metus feugiat sem, quis fermentum turpis eros eget velit. Donec ac tempus ante. Fusce ultricies massa massa. Fusce aliquam, purus eget sagittis vulputate, sapien libero hendrerit est, sed commodo augue nisi non neque.</p>
<div class="review-description">
<div class="tab-thumb">
</div>
<div class="tab-des">
<h3>Product Information :</h3>
<ul>
<li>Donec non est at libero vulputate rutrum</li>
<li>Morbi ornare lectus quis justo gravida</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
<li>Donec a neque libero</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
</ul>
</div>
</div>
<p>Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet 
ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam erat mi, 
rutrum at sollicitudin rhoncus, ultricies posuere erat. Duis convallis, arcu nec aliquam consequat, purus felis vehicula felis, a 
dapibus enim lorem nec augue. Nunc facilisis sagittis ullamcorper.</p>
<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus
orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla 
luctus malesuada tincidunt.</p>',
1,0,10,
0,'2023-09-30','Yunis',null,null,null,null),

('Product21',90,0,10,2,'amet porttitor eget dolor morbi non arcu risus quis varius quam 
quisque id diam vel quam elementum pulvinar etiam non quam lacus suspendisse faucibus 
interdum posuere lorem ipsum dolor sit',
'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Ipsum metus feugiat sem, quis fermentum turpis eros eget velit. Donec ac tempus ante. Fusce ultricies massa massa. Fusce aliquam, purus eget sagittis vulputate, sapien libero hendrerit est, sed commodo augue nisi non neque.</p>
<div class="review-description">
<div class="tab-thumb">
</div>
<div class="tab-des">
<h3>Product Information :</h3>
<ul>
<li>Donec non est at libero vulputate rutrum</li>
<li>Morbi ornare lectus quis justo gravida</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
<li>Donec a neque libero</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
</ul>
</div>
</div>
<p>Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet 
ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam erat mi, 
rutrum at sollicitudin rhoncus, ultricies posuere erat. Duis convallis, arcu nec aliquam consequat, purus felis vehicula felis, a 
dapibus enim lorem nec augue. Nunc facilisis sagittis ullamcorper.</p>
<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus
orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla 
luctus malesuada tincidunt.</p>',
0,0,1,
0,'2023-09-30','Yunis',null,null,null,null),
('Product22',80,40,8,10,'amet porttitor eget dolor morbi non arcu risus quis varius quam 
quisque id diam vel quam elementum pulvinar etiam non quam lacus suspendisse faucibus 
interdum posuere lorem ipsum dolor sit',
'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Ipsum metus feugiat sem, quis fermentum turpis eros eget velit. Donec ac tempus ante. Fusce ultricies massa massa. Fusce aliquam, purus eget sagittis vulputate, sapien libero hendrerit est, sed commodo augue nisi non neque.</p>
<div class="review-description">
<div class="tab-thumb">
</div>
<div class="tab-des">
<h3>Product Information :</h3>
<ul>
<li>Donec non est at libero vulputate rutrum</li>
<li>Morbi ornare lectus quis justo gravida</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
<li>Donec a neque libero</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
</ul>
</div>
</div>
<p>Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet 
ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam erat mi, 
rutrum at sollicitudin rhoncus, ultricies posuere erat. Duis convallis, arcu nec aliquam consequat, purus felis vehicula felis, a 
dapibus enim lorem nec augue. Nunc facilisis sagittis ullamcorper.</p>
<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus
orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla 
luctus malesuada tincidunt.</p>',
0,0,2,
0,'2023-09-30','Yunis',null,null,null,null),
('Product23',20,12,0,0,'amet porttitor eget dolor morbi non arcu risus quis varius quam 
quisque id diam vel quam elementum pulvinar etiam non quam lacus suspendisse faucibus 
interdum posuere lorem ipsum dolor sit',
'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Ipsum metus feugiat sem, quis fermentum turpis eros eget velit. Donec ac tempus ante. Fusce ultricies massa massa. Fusce aliquam, purus eget sagittis vulputate, sapien libero hendrerit est, sed commodo augue nisi non neque.</p>
<div class="review-description">
<div class="tab-thumb">
</div>
<div class="tab-des">
<h3>Product Information :</h3>
<ul>
<li>Donec non est at libero vulputate rutrum</li>
<li>Morbi ornare lectus quis justo gravida</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
<li>Donec a neque libero</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
</ul>
</div>
</div>
<p>Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet 
ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam erat mi, 
rutrum at sollicitudin rhoncus, ultricies posuere erat. Duis convallis, arcu nec aliquam consequat, purus felis vehicula felis, a 
dapibus enim lorem nec augue. Nunc facilisis sagittis ullamcorper.</p>
<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus
orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla 
luctus malesuada tincidunt.</p>',
1,0,3,
0,'2023-09-30','Yunis',null,null,null,null),
('Product24',100,10,10,18,'amet porttitor eget dolor morbi non arcu risus quis varius quam 
quisque id diam vel quam elementum pulvinar etiam non quam lacus suspendisse faucibus 
interdum posuere lorem ipsum dolor sit',
'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Ipsum metus feugiat sem, quis fermentum turpis eros eget velit. Donec ac tempus ante. Fusce ultricies massa massa. Fusce aliquam, purus eget sagittis vulputate, sapien libero hendrerit est, sed commodo augue nisi non neque.</p>
<div class="review-description">
<div class="tab-thumb">
</div>
<div class="tab-des">
<h3>Product Information :</h3>
<ul>
<li>Donec non est at libero vulputate rutrum</li>
<li>Morbi ornare lectus quis justo gravida</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
<li>Donec a neque libero</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
</ul>
</div>
</div>
<p>Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet 
ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam erat mi, 
rutrum at sollicitudin rhoncus, ultricies posuere erat. Duis convallis, arcu nec aliquam consequat, purus felis vehicula felis, a 
dapibus enim lorem nec augue. Nunc facilisis sagittis ullamcorper.</p>
<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus
orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla 
luctus malesuada tincidunt.</p>',
0,1,4,
0,'2023-09-30','Yunis',null,null,null,null),
('Product25',70,30,5,1,'amet porttitor eget dolor morbi non arcu risus quis varius quam 
quisque id diam vel quam elementum pulvinar etiam non quam lacus suspendisse faucibus 
interdum posuere lorem ipsum dolor sit',
'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Ipsum metus feugiat sem, quis fermentum turpis eros eget velit. Donec ac tempus ante. Fusce ultricies massa massa. Fusce aliquam, purus eget sagittis vulputate, sapien libero hendrerit est, sed commodo augue nisi non neque.</p>
<div class="review-description">
<div class="tab-thumb">
</div>
<div class="tab-des">
<h3>Product Information :</h3>
<ul>
<li>Donec non est at libero vulputate rutrum</li>
<li>Morbi ornare lectus quis justo gravida</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
<li>Donec a neque libero</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
</ul>
</div>
</div>
<p>Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet 
ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam erat mi, 
rutrum at sollicitudin rhoncus, ultricies posuere erat. Duis convallis, arcu nec aliquam consequat, purus felis vehicula felis, a 
dapibus enim lorem nec augue. Nunc facilisis sagittis ullamcorper.</p>
<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus
orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla 
luctus malesuada tincidunt.</p>',
0,0,5,
0,'2023-09-30','Yunis',null,null,null,null),
('Product26',20,0,0,2,'amet porttitor eget dolor morbi non arcu risus quis varius quam 
quisque id diam vel quam elementum pulvinar etiam non quam lacus suspendisse faucibus 
interdum posuere lorem ipsum dolor sit',
'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Ipsum metus feugiat sem, quis fermentum turpis eros eget velit. Donec ac tempus ante. Fusce ultricies massa massa. Fusce aliquam, purus eget sagittis vulputate, sapien libero hendrerit est, sed commodo augue nisi non neque.</p>
<div class="review-description">
<div class="tab-thumb">
</div>
<div class="tab-des">
<h3>Product Information :</h3>
<ul>
<li>Donec non est at libero vulputate rutrum</li>
<li>Morbi ornare lectus quis justo gravida</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
<li>Donec a neque libero</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
</ul>
</div>
</div>
<p>Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet 
ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam erat mi, 
rutrum at sollicitudin rhoncus, ultricies posuere erat. Duis convallis, arcu nec aliquam consequat, purus felis vehicula felis, a 
dapibus enim lorem nec augue. Nunc facilisis sagittis ullamcorper.</p>
<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus
orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla 
luctus malesuada tincidunt.</p>',
1,0,6,
0,'2023-09-30','Yunis',null,null,null,null),
('Product27',120,0,20,10,'amet porttitor eget dolor morbi non arcu risus quis varius quam 
quisque id diam vel quam elementum pulvinar etiam non quam lacus suspendisse faucibus 
interdum posuere lorem ipsum dolor sit',
'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Ipsum metus feugiat sem, quis fermentum turpis eros eget velit. Donec ac tempus ante. Fusce ultricies massa massa. Fusce aliquam, purus eget sagittis vulputate, sapien libero hendrerit est, sed commodo augue nisi non neque.</p>
<div class="review-description">
<div class="tab-thumb">
</div>
<div class="tab-des">
<h3>Product Information :</h3>
<ul>
<li>Donec non est at libero vulputate rutrum</li>
<li>Morbi ornare lectus quis justo gravida</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
<li>Donec a neque libero</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
</ul>
</div>
</div>
<p>Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet 
ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam erat mi, 
rutrum at sollicitudin rhoncus, ultricies posuere erat. Duis convallis, arcu nec aliquam consequat, purus felis vehicula felis, a 
dapibus enim lorem nec augue. Nunc facilisis sagittis ullamcorper.</p>
<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus
orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla 
luctus malesuada tincidunt.</p>',
0,1,7,
0,'2023-09-30','Yunis',null,null,null,null),
('Product28',45,40,0,0,'amet porttitor eget dolor morbi non arcu risus quis varius quam 
quisque id diam vel quam elementum pulvinar etiam non quam lacus suspendisse faucibus 
interdum posuere lorem ipsum dolor sit',
'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Ipsum metus feugiat sem, quis fermentum turpis eros eget velit. Donec ac tempus ante. Fusce ultricies massa massa. Fusce aliquam, purus eget sagittis vulputate, sapien libero hendrerit est, sed commodo augue nisi non neque.</p>
<div class="review-description">
<div class="tab-thumb">
</div>
<div class="tab-des">
<h3>Product Information :</h3>
<ul>
<li>Donec non est at libero vulputate rutrum</li>
<li>Morbi ornare lectus quis justo gravida</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
<li>Donec a neque libero</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
</ul>
</div>
</div>
<p>Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet 
ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam erat mi, 
rutrum at sollicitudin rhoncus, ultricies posuere erat. Duis convallis, arcu nec aliquam consequat, purus felis vehicula felis, a 
dapibus enim lorem nec augue. Nunc facilisis sagittis ullamcorper.</p>
<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus
orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla 
luctus malesuada tincidunt.</p>',
0,0,8,
0,'2023-09-30','Yunis',null,null,null,null),
('Product29',10,0,1,20,'amet porttitor eget dolor morbi non arcu risus quis varius quam 
quisque id diam vel quam elementum pulvinar etiam non quam lacus suspendisse faucibus 
interdum posuere lorem ipsum dolor sit',
'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Ipsum metus feugiat sem, quis fermentum turpis eros eget velit. Donec ac tempus ante. Fusce ultricies massa massa. Fusce aliquam, purus eget sagittis vulputate, sapien libero hendrerit est, sed commodo augue nisi non neque.</p>
<div class="review-description">
<div class="tab-thumb">
</div>
<div class="tab-des">
<h3>Product Information :</h3>
<ul>
<li>Donec non est at libero vulputate rutrum</li>
<li>Morbi ornare lectus quis justo gravida</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
<li>Donec a neque libero</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
</ul>
</div>
</div>
<p>Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet 
ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam erat mi, 
rutrum at sollicitudin rhoncus, ultricies posuere erat. Duis convallis, arcu nec aliquam consequat, purus felis vehicula felis, a 
dapibus enim lorem nec augue. Nunc facilisis sagittis ullamcorper.</p>
<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus
orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla 
luctus malesuada tincidunt.</p>',
0,0,9,
0,'2023-09-30','Yunis',null,null,null,null),
('Product30',370,340,50,10,'amet porttitor eget dolor morbi non arcu risus quis varius quam 
quisque id diam vel quam elementum pulvinar etiam non quam lacus suspendisse faucibus 
interdum posuere lorem ipsum dolor sit',
'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Ipsum metus feugiat sem, quis fermentum turpis eros eget velit. Donec ac tempus ante. Fusce ultricies massa massa. Fusce aliquam, purus eget sagittis vulputate, sapien libero hendrerit est, sed commodo augue nisi non neque.</p>
<div class="review-description">
<div class="tab-thumb">
</div>
<div class="tab-des">
<h3>Product Information :</h3>
<ul>
<li>Donec non est at libero vulputate rutrum</li>
<li>Morbi ornare lectus quis justo gravida</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
<li>Donec a neque libero</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
</ul>
</div>
</div>
<p>Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet 
ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam erat mi, 
rutrum at sollicitudin rhoncus, ultricies posuere erat. Duis convallis, arcu nec aliquam consequat, purus felis vehicula felis, a 
dapibus enim lorem nec augue. Nunc facilisis sagittis ullamcorper.</p>
<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus
orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla 
luctus malesuada tincidunt.</p>',
1,0,10,
0,'2023-09-30','Yunis',null,null,null,null),

('Product31',90,0,10,2,'amet porttitor eget dolor morbi non arcu risus quis varius quam 
quisque id diam vel quam elementum pulvinar etiam non quam lacus suspendisse faucibus 
interdum posuere lorem ipsum dolor sit',
'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Ipsum metus feugiat sem, quis fermentum turpis eros eget velit. Donec ac tempus ante. Fusce ultricies massa massa. Fusce aliquam, purus eget sagittis vulputate, sapien libero hendrerit est, sed commodo augue nisi non neque.</p>
<div class="review-description">
<div class="tab-thumb">
</div>
<div class="tab-des">
<h3>Product Information :</h3>
<ul>
<li>Donec non est at libero vulputate rutrum</li>
<li>Morbi ornare lectus quis justo gravida</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
<li>Donec a neque libero</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
</ul>
</div>
</div>
<p>Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet 
ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam erat mi, 
rutrum at sollicitudin rhoncus, ultricies posuere erat. Duis convallis, arcu nec aliquam consequat, purus felis vehicula felis, a 
dapibus enim lorem nec augue. Nunc facilisis sagittis ullamcorper.</p>
<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus
orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla 
luctus malesuada tincidunt.</p>',
0,0,1,
0,'2023-09-30','Yunis',null,null,null,null),
('Product32',80,40,8,10,'amet porttitor eget dolor morbi non arcu risus quis varius quam 
quisque id diam vel quam elementum pulvinar etiam non quam lacus suspendisse faucibus 
interdum posuere lorem ipsum dolor sit',
'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Ipsum metus feugiat sem, quis fermentum turpis eros eget velit. Donec ac tempus ante. Fusce ultricies massa massa. Fusce aliquam, purus eget sagittis vulputate, sapien libero hendrerit est, sed commodo augue nisi non neque.</p>
<div class="review-description">
<div class="tab-thumb">
</div>
<div class="tab-des">
<h3>Product Information :</h3>
<ul>
<li>Donec non est at libero vulputate rutrum</li>
<li>Morbi ornare lectus quis justo gravida</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
<li>Donec a neque libero</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
</ul>
</div>
</div>
<p>Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet 
ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam erat mi, 
rutrum at sollicitudin rhoncus, ultricies posuere erat. Duis convallis, arcu nec aliquam consequat, purus felis vehicula felis, a 
dapibus enim lorem nec augue. Nunc facilisis sagittis ullamcorper.</p>
<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus
orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla 
luctus malesuada tincidunt.</p>',
0,0,2,
0,'2023-09-30','Yunis',null,null,null,null),
('Product33',20,12,0,0,'amet porttitor eget dolor morbi non arcu risus quis varius quam 
quisque id diam vel quam elementum pulvinar etiam non quam lacus suspendisse faucibus 
interdum posuere lorem ipsum dolor sit',
'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Ipsum metus feugiat sem, quis fermentum turpis eros eget velit. Donec ac tempus ante. Fusce ultricies massa massa. Fusce aliquam, purus eget sagittis vulputate, sapien libero hendrerit est, sed commodo augue nisi non neque.</p>
<div class="review-description">
<div class="tab-thumb">
</div>
<div class="tab-des">
<h3>Product Information :</h3>
<ul>
<li>Donec non est at libero vulputate rutrum</li>
<li>Morbi ornare lectus quis justo gravida</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
<li>Donec a neque libero</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
</ul>
</div>
</div>
<p>Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet 
ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam erat mi, 
rutrum at sollicitudin rhoncus, ultricies posuere erat. Duis convallis, arcu nec aliquam consequat, purus felis vehicula felis, a 
dapibus enim lorem nec augue. Nunc facilisis sagittis ullamcorper.</p>
<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus
orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla 
luctus malesuada tincidunt.</p>',
1,0,3,
0,'2023-09-30','Yunis',null,null,null,null),
('Product34',100,10,10,18,'amet porttitor eget dolor morbi non arcu risus quis varius quam 
quisque id diam vel quam elementum pulvinar etiam non quam lacus suspendisse faucibus 
interdum posuere lorem ipsum dolor sit',
'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Ipsum metus feugiat sem, quis fermentum turpis eros eget velit. Donec ac tempus ante. Fusce ultricies massa massa. Fusce aliquam, purus eget sagittis vulputate, sapien libero hendrerit est, sed commodo augue nisi non neque.</p>
<div class="review-description">
<div class="tab-thumb">
</div>
<div class="tab-des">
<h3>Product Information :</h3>
<ul>
<li>Donec non est at libero vulputate rutrum</li>
<li>Morbi ornare lectus quis justo gravida</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
<li>Donec a neque libero</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
</ul>
</div>
</div>
<p>Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet 
ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam erat mi, 
rutrum at sollicitudin rhoncus, ultricies posuere erat. Duis convallis, arcu nec aliquam consequat, purus felis vehicula felis, a 
dapibus enim lorem nec augue. Nunc facilisis sagittis ullamcorper.</p>
<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus
orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla 
luctus malesuada tincidunt.</p>',
0,1,4,
0,'2023-09-30','Yunis',null,null,null,null),
('Product35',70,30,5,1,'amet porttitor eget dolor morbi non arcu risus quis varius quam 
quisque id diam vel quam elementum pulvinar etiam non quam lacus suspendisse faucibus 
interdum posuere lorem ipsum dolor sit',
'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Ipsum metus feugiat sem, quis fermentum turpis eros eget velit. Donec ac tempus ante. Fusce ultricies massa massa. Fusce aliquam, purus eget sagittis vulputate, sapien libero hendrerit est, sed commodo augue nisi non neque.</p>
<div class="review-description">
<div class="tab-thumb">
</div>
<div class="tab-des">
<h3>Product Information :</h3>
<ul>
<li>Donec non est at libero vulputate rutrum</li>
<li>Morbi ornare lectus quis justo gravida</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
<li>Donec a neque libero</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
</ul>
</div>
</div>
<p>Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet 
ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam erat mi, 
rutrum at sollicitudin rhoncus, ultricies posuere erat. Duis convallis, arcu nec aliquam consequat, purus felis vehicula felis, a 
dapibus enim lorem nec augue. Nunc facilisis sagittis ullamcorper.</p>
<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus
orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla 
luctus malesuada tincidunt.</p>',
0,0,5,
0,'2023-09-30','Yunis',null,null,null,null),
('Product36',20,0,0,2,'amet porttitor eget dolor morbi non arcu risus quis varius quam 
quisque id diam vel quam elementum pulvinar etiam non quam lacus suspendisse faucibus 
interdum posuere lorem ipsum dolor sit',
'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Ipsum metus feugiat sem, quis fermentum turpis eros eget velit. Donec ac tempus ante. Fusce ultricies massa massa. Fusce aliquam, purus eget sagittis vulputate, sapien libero hendrerit est, sed commodo augue nisi non neque.</p>
<div class="review-description">
<div class="tab-thumb">
</div>
<div class="tab-des">
<h3>Product Information :</h3>
<ul>
<li>Donec non est at libero vulputate rutrum</li>
<li>Morbi ornare lectus quis justo gravida</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
<li>Donec a neque libero</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
</ul>
</div>
</div>
<p>Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet 
ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam erat mi, 
rutrum at sollicitudin rhoncus, ultricies posuere erat. Duis convallis, arcu nec aliquam consequat, purus felis vehicula felis, a 
dapibus enim lorem nec augue. Nunc facilisis sagittis ullamcorper.</p>
<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus
orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla 
luctus malesuada tincidunt.</p>',
1,0,6,
0,'2023-09-30','Yunis',null,null,null,null),
('Product37',120,0,20,10,'amet porttitor eget dolor morbi non arcu risus quis varius quam 
quisque id diam vel quam elementum pulvinar etiam non quam lacus suspendisse faucibus 
interdum posuere lorem ipsum dolor sit',
'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Ipsum metus feugiat sem, quis fermentum turpis eros eget velit. Donec ac tempus ante. Fusce ultricies massa massa. Fusce aliquam, purus eget sagittis vulputate, sapien libero hendrerit est, sed commodo augue nisi non neque.</p>
<div class="review-description">
<div class="tab-thumb">
</div>
<div class="tab-des">
<h3>Product Information :</h3>
<ul>
<li>Donec non est at libero vulputate rutrum</li>
<li>Morbi ornare lectus quis justo gravida</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
<li>Donec a neque libero</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
</ul>
</div>
</div>
<p>Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet 
ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam erat mi, 
rutrum at sollicitudin rhoncus, ultricies posuere erat. Duis convallis, arcu nec aliquam consequat, purus felis vehicula felis, a 
dapibus enim lorem nec augue. Nunc facilisis sagittis ullamcorper.</p>
<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus
orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla 
luctus malesuada tincidunt.</p>',
0,1,7,
0,'2023-09-30','Yunis',null,null,null,null),
('Product38',45,40,0,0,'amet porttitor eget dolor morbi non arcu risus quis varius quam 
quisque id diam vel quam elementum pulvinar etiam non quam lacus suspendisse faucibus 
interdum posuere lorem ipsum dolor sit',
'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Ipsum metus feugiat sem, quis fermentum turpis eros eget velit. Donec ac tempus ante. Fusce ultricies massa massa. Fusce aliquam, purus eget sagittis vulputate, sapien libero hendrerit est, sed commodo augue nisi non neque.</p>
<div class="review-description">
<div class="tab-thumb">
</div>
<div class="tab-des">
<h3>Product Information :</h3>
<ul>
<li>Donec non est at libero vulputate rutrum</li>
<li>Morbi ornare lectus quis justo gravida</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
<li>Donec a neque libero</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
</ul>
</div>
</div>
<p>Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet 
ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam erat mi, 
rutrum at sollicitudin rhoncus, ultricies posuere erat. Duis convallis, arcu nec aliquam consequat, purus felis vehicula felis, a 
dapibus enim lorem nec augue. Nunc facilisis sagittis ullamcorper.</p>
<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus
orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla 
luctus malesuada tincidunt.</p>',
0,0,8,
0,'2023-09-30','Yunis',null,null,null,null),
('Product39',10,0,1,20,'amet porttitor eget dolor morbi non arcu risus quis varius quam 
quisque id diam vel quam elementum pulvinar etiam non quam lacus suspendisse faucibus 
interdum posuere lorem ipsum dolor sit',
'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Ipsum metus feugiat sem, quis fermentum turpis eros eget velit. Donec ac tempus ante. Fusce ultricies massa massa. Fusce aliquam, purus eget sagittis vulputate, sapien libero hendrerit est, sed commodo augue nisi non neque.</p>
<div class="review-description">
<div class="tab-thumb">
</div>
<div class="tab-des">
<h3>Product Information :</h3>
<ul>
<li>Donec non est at libero vulputate rutrum</li>
<li>Morbi ornare lectus quis justo gravida</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
<li>Donec a neque libero</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
</ul>
</div>
</div>
<p>Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet 
ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam erat mi, 
rutrum at sollicitudin rhoncus, ultricies posuere erat. Duis convallis, arcu nec aliquam consequat, purus felis vehicula felis, a 
dapibus enim lorem nec augue. Nunc facilisis sagittis ullamcorper.</p>
<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus
orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla 
luctus malesuada tincidunt.</p>',
0,0,9,
0,'2023-09-30','Yunis',null,null,null,null),
('Product40',370,340,50,10,'amet porttitor eget dolor morbi non arcu risus quis varius quam 
quisque id diam vel quam elementum pulvinar etiam non quam lacus suspendisse faucibus 
interdum posuere lorem ipsum dolor sit',
'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Ipsum metus feugiat sem, quis fermentum turpis eros eget velit. Donec ac tempus ante. Fusce ultricies massa massa. Fusce aliquam, purus eget sagittis vulputate, sapien libero hendrerit est, sed commodo augue nisi non neque.</p>
<div class="review-description">
<div class="tab-thumb">
</div>
<div class="tab-des">
<h3>Product Information :</h3>
<ul>
<li>Donec non est at libero vulputate rutrum</li>
<li>Morbi ornare lectus quis justo gravida</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
<li>Donec a neque libero</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
</ul>
</div>
</div>
<p>Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet 
ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam erat mi, 
rutrum at sollicitudin rhoncus, ultricies posuere erat. Duis convallis, arcu nec aliquam consequat, purus felis vehicula felis, a 
dapibus enim lorem nec augue. Nunc facilisis sagittis ullamcorper.</p>
<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus
orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla 
luctus malesuada tincidunt.</p>',
1,0,10,
0,'2023-09-30','Yunis',null,null,null,null),

('Product41',90,0,10,2,'amet porttitor eget dolor morbi non arcu risus quis varius quam 
quisque id diam vel quam elementum pulvinar etiam non quam lacus suspendisse faucibus 
interdum posuere lorem ipsum dolor sit',
'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Ipsum metus feugiat sem, quis fermentum turpis eros eget velit. Donec ac tempus ante. Fusce ultricies massa massa. Fusce aliquam, purus eget sagittis vulputate, sapien libero hendrerit est, sed commodo augue nisi non neque.</p>
<div class="review-description">
<div class="tab-thumb">
</div>
<div class="tab-des">
<h3>Product Information :</h3>
<ul>
<li>Donec non est at libero vulputate rutrum</li>
<li>Morbi ornare lectus quis justo gravida</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
<li>Donec a neque libero</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
</ul>
</div>
</div>
<p>Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet 
ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam erat mi, 
rutrum at sollicitudin rhoncus, ultricies posuere erat. Duis convallis, arcu nec aliquam consequat, purus felis vehicula felis, a 
dapibus enim lorem nec augue. Nunc facilisis sagittis ullamcorper.</p>
<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus
orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla 
luctus malesuada tincidunt.</p>',
0,0,1,
0,'2023-09-30','Yunis',null,null,null,null),
('Product42',80,40,8,10,'amet porttitor eget dolor morbi non arcu risus quis varius quam 
quisque id diam vel quam elementum pulvinar etiam non quam lacus suspendisse faucibus 
interdum posuere lorem ipsum dolor sit',
'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Ipsum metus feugiat sem, quis fermentum turpis eros eget velit. Donec ac tempus ante. Fusce ultricies massa massa. Fusce aliquam, purus eget sagittis vulputate, sapien libero hendrerit est, sed commodo augue nisi non neque.</p>
<div class="review-description">
<div class="tab-thumb">
</div>
<div class="tab-des">
<h3>Product Information :</h3>
<ul>
<li>Donec non est at libero vulputate rutrum</li>
<li>Morbi ornare lectus quis justo gravida</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
<li>Donec a neque libero</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
</ul>
</div>
</div>
<p>Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet 
ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam erat mi, 
rutrum at sollicitudin rhoncus, ultricies posuere erat. Duis convallis, arcu nec aliquam consequat, purus felis vehicula felis, a 
dapibus enim lorem nec augue. Nunc facilisis sagittis ullamcorper.</p>
<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus
orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla 
luctus malesuada tincidunt.</p>',
0,0,2,
0,'2023-09-30','Yunis',null,null,null,null),
('Product43',20,12,0,0,'amet porttitor eget dolor morbi non arcu risus quis varius quam 
quisque id diam vel quam elementum pulvinar etiam non quam lacus suspendisse faucibus 
interdum posuere lorem ipsum dolor sit',
'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Ipsum metus feugiat sem, quis fermentum turpis eros eget velit. Donec ac tempus ante. Fusce ultricies massa massa. Fusce aliquam, purus eget sagittis vulputate, sapien libero hendrerit est, sed commodo augue nisi non neque.</p>
<div class="review-description">
<div class="tab-thumb">
</div>
<div class="tab-des">
<h3>Product Information :</h3>
<ul>
<li>Donec non est at libero vulputate rutrum</li>
<li>Morbi ornare lectus quis justo gravida</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
<li>Donec a neque libero</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
</ul>
</div>
</div>
<p>Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet 
ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam erat mi, 
rutrum at sollicitudin rhoncus, ultricies posuere erat. Duis convallis, arcu nec aliquam consequat, purus felis vehicula felis, a 
dapibus enim lorem nec augue. Nunc facilisis sagittis ullamcorper.</p>
<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus
orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla 
luctus malesuada tincidunt.</p>',
1,0,3,
0,'2023-09-30','Yunis',null,null,null,null),
('Product44',100,10,10,18,'amet porttitor eget dolor morbi non arcu risus quis varius quam 
quisque id diam vel quam elementum pulvinar etiam non quam lacus suspendisse faucibus 
interdum posuere lorem ipsum dolor sit',
'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Ipsum metus feugiat sem, quis fermentum turpis eros eget velit. Donec ac tempus ante. Fusce ultricies massa massa. Fusce aliquam, purus eget sagittis vulputate, sapien libero hendrerit est, sed commodo augue nisi non neque.</p>
<div class="review-description">
<div class="tab-thumb">
</div>
<div class="tab-des">
<h3>Product Information :</h3>
<ul>
<li>Donec non est at libero vulputate rutrum</li>
<li>Morbi ornare lectus quis justo gravida</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
<li>Donec a neque libero</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
</ul>
</div>
</div>
<p>Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet 
ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam erat mi, 
rutrum at sollicitudin rhoncus, ultricies posuere erat. Duis convallis, arcu nec aliquam consequat, purus felis vehicula felis, a 
dapibus enim lorem nec augue. Nunc facilisis sagittis ullamcorper.</p>
<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus
orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla 
luctus malesuada tincidunt.</p>',
0,1,4,
0,'2023-09-30','Yunis',null,null,null,null),
('Product45',70,30,5,1,'amet porttitor eget dolor morbi non arcu risus quis varius quam 
quisque id diam vel quam elementum pulvinar etiam non quam lacus suspendisse faucibus 
interdum posuere lorem ipsum dolor sit',
'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Ipsum metus feugiat sem, quis fermentum turpis eros eget velit. Donec ac tempus ante. Fusce ultricies massa massa. Fusce aliquam, purus eget sagittis vulputate, sapien libero hendrerit est, sed commodo augue nisi non neque.</p>
<div class="review-description">
<div class="tab-thumb">
</div>
<div class="tab-des">
<h3>Product Information :</h3>
<ul>
<li>Donec non est at libero vulputate rutrum</li>
<li>Morbi ornare lectus quis justo gravida</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
<li>Donec a neque libero</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
</ul>
</div>
</div>
<p>Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet 
ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam erat mi, 
rutrum at sollicitudin rhoncus, ultricies posuere erat. Duis convallis, arcu nec aliquam consequat, purus felis vehicula felis, a 
dapibus enim lorem nec augue. Nunc facilisis sagittis ullamcorper.</p>
<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus
orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla 
luctus malesuada tincidunt.</p>',
0,0,5,
0,'2023-09-30','Yunis',null,null,null,null),
('Product46',20,0,0,2,'amet porttitor eget dolor morbi non arcu risus quis varius quam 
quisque id diam vel quam elementum pulvinar etiam non quam lacus suspendisse faucibus 
interdum posuere lorem ipsum dolor sit',
'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Ipsum metus feugiat sem, quis fermentum turpis eros eget velit. Donec ac tempus ante. Fusce ultricies massa massa. Fusce aliquam, purus eget sagittis vulputate, sapien libero hendrerit est, sed commodo augue nisi non neque.</p>
<div class="review-description">
<div class="tab-thumb">
</div>
<div class="tab-des">
<h3>Product Information :</h3>
<ul>
<li>Donec non est at libero vulputate rutrum</li>
<li>Morbi ornare lectus quis justo gravida</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
<li>Donec a neque libero</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
</ul>
</div>
</div>
<p>Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet 
ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam erat mi, 
rutrum at sollicitudin rhoncus, ultricies posuere erat. Duis convallis, arcu nec aliquam consequat, purus felis vehicula felis, a 
dapibus enim lorem nec augue. Nunc facilisis sagittis ullamcorper.</p>
<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus
orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla 
luctus malesuada tincidunt.</p>',
1,0,6,
0,'2023-09-30','Yunis',null,null,null,null),
('Product47',120,0,20,10,'amet porttitor eget dolor morbi non arcu risus quis varius quam 
quisque id diam vel quam elementum pulvinar etiam non quam lacus suspendisse faucibus 
interdum posuere lorem ipsum dolor sit',
'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Ipsum metus feugiat sem, quis fermentum turpis eros eget velit. Donec ac tempus ante. Fusce ultricies massa massa. Fusce aliquam, purus eget sagittis vulputate, sapien libero hendrerit est, sed commodo augue nisi non neque.</p>
<div class="review-description">
<div class="tab-thumb">
</div>
<div class="tab-des">
<h3>Product Information :</h3>
<ul>
<li>Donec non est at libero vulputate rutrum</li>
<li>Morbi ornare lectus quis justo gravida</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
<li>Donec a neque libero</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
</ul>
</div>
</div>
<p>Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet 
ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam erat mi, 
rutrum at sollicitudin rhoncus, ultricies posuere erat. Duis convallis, arcu nec aliquam consequat, purus felis vehicula felis, a 
dapibus enim lorem nec augue. Nunc facilisis sagittis ullamcorper.</p>
<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus
orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla 
luctus malesuada tincidunt.</p>',
0,1,7,
0,'2023-09-30','Yunis',null,null,null,null),
('Product48',45,40,0,0,'amet porttitor eget dolor morbi non arcu risus quis varius quam 
quisque id diam vel quam elementum pulvinar etiam non quam lacus suspendisse faucibus 
interdum posuere lorem ipsum dolor sit',
'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Ipsum metus feugiat sem, quis fermentum turpis eros eget velit. Donec ac tempus ante. Fusce ultricies massa massa. Fusce aliquam, purus eget sagittis vulputate, sapien libero hendrerit est, sed commodo augue nisi non neque.</p>
<div class="review-description">
<div class="tab-thumb">
</div>
<div class="tab-des">
<h3>Product Information :</h3>
<ul>
<li>Donec non est at libero vulputate rutrum</li>
<li>Morbi ornare lectus quis justo gravida</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
<li>Donec a neque libero</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
</ul>
</div>
</div>
<p>Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet 
ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam erat mi, 
rutrum at sollicitudin rhoncus, ultricies posuere erat. Duis convallis, arcu nec aliquam consequat, purus felis vehicula felis, a 
dapibus enim lorem nec augue. Nunc facilisis sagittis ullamcorper.</p>
<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus
orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla 
luctus malesuada tincidunt.</p>',
0,0,8,
0,'2023-09-30','Yunis',null,null,null,null),
('Product49',10,0,1,20,'amet porttitor eget dolor morbi non arcu risus quis varius quam 
quisque id diam vel quam elementum pulvinar etiam non quam lacus suspendisse faucibus 
interdum posuere lorem ipsum dolor sit',
'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Ipsum metus feugiat sem, quis fermentum turpis eros eget velit. Donec ac tempus ante. Fusce ultricies massa massa. Fusce aliquam, purus eget sagittis vulputate, sapien libero hendrerit est, sed commodo augue nisi non neque.</p>
<div class="review-description">
<div class="tab-thumb">
</div>
<div class="tab-des">
<h3>Product Information :</h3>
<ul>
<li>Donec non est at libero vulputate rutrum</li>
<li>Morbi ornare lectus quis justo gravida</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
<li>Donec a neque libero</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
</ul>
</div>
</div>
<p>Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet 
ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam erat mi, 
rutrum at sollicitudin rhoncus, ultricies posuere erat. Duis convallis, arcu nec aliquam consequat, purus felis vehicula felis, a 
dapibus enim lorem nec augue. Nunc facilisis sagittis ullamcorper.</p>
<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus
orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla 
luctus malesuada tincidunt.</p>',
0,0,9,
0,'2023-09-30','Yunis',null,null,null,null),
('Product50',370,340,50,10,'amet porttitor eget dolor morbi non arcu risus quis varius quam 
quisque id diam vel quam elementum pulvinar etiam non quam lacus suspendisse faucibus 
interdum posuere lorem ipsum dolor sit',
'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Ipsum metus feugiat sem, quis fermentum turpis eros eget velit. Donec ac tempus ante. Fusce ultricies massa massa. Fusce aliquam, purus eget sagittis vulputate, sapien libero hendrerit est, sed commodo augue nisi non neque.</p>
<div class="review-description">
<div class="tab-thumb">
</div>
<div class="tab-des">
<h3>Product Information :</h3>
<ul>
<li>Donec non est at libero vulputate rutrum</li>
<li>Morbi ornare lectus quis justo gravida</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
<li>Donec a neque libero</li>
<li>Pellentesque aliquet, sem eget laoreet</li>
</ul>
</div>
</div>
<p>Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet 
ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam erat mi, 
rutrum at sollicitudin rhoncus, ultricies posuere erat. Duis convallis, arcu nec aliquam consequat, purus felis vehicula felis, a 
dapibus enim lorem nec augue. Nunc facilisis sagittis ullamcorper.</p>
<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus
orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla 
luctus malesuada tincidunt.</p>',
1,0,10,
0,'2023-09-30','Yunis',null,null,null,null)


Insert Into ProductImages
Values
('product-1.jpg',1,1,0,'2023-09-30','Yunis',null,null,null,null),
('product-2.jpg',1,2,0,'2023-09-30','Yunis',null,null,null,null),
('product-3.jpg',1,3,0,'2023-09-30','Yunis',null,null,null,null),
('product-4.jpg',1,4,0,'2023-09-30','Yunis',null,null,null,null),
('product-5.jpg',1,5,0,'2023-09-30','Yunis',null,null,null,null),
('product-6.jpg',1,6,0,'2023-09-30','Yunis',null,null,null,null),
('product-7.jpg',1,7,0,'2023-09-30','Yunis',null,null,null,null),
('product-8.jpg',1,8,0,'2023-09-30','Yunis',null,null,null,null),
('product-9.jpg',1,9,0,'2023-09-30','Yunis',null,null,null,null),
('product-10.jpg',1,10,0,'2023-09-30','Yunis',null,null,null,null),
('product-11.jpg',1,11,0,'2023-09-30','Yunis',null,null,null,null),
('product-12.jpg',1,12,0,'2023-09-30','Yunis',null,null,null,null),
('product-1.jpg',1,13,0,'2023-09-30','Yunis',null,null,null,null),
('product-2.jpg',1,14,0,'2023-09-30','Yunis',null,null,null,null),
('product-3.jpg',1,15,0,'2023-09-30','Yunis',null,null,null,null),
('product-4.jpg',1,16,0,'2023-09-30','Yunis',null,null,null,null),
('product-5.jpg',1,17,0,'2023-09-30','Yunis',null,null,null,null),
('product-6.jpg',1,18,0,'2023-09-30','Yunis',null,null,null,null),
('product-7.jpg',1,19,0,'2023-09-30','Yunis',null,null,null,null),
('product-8.jpg',1,20,0,'2023-09-30','Yunis',null,null,null,null),
('product-9.jpg',1,21,0,'2023-09-30','Yunis',null,null,null,null),
('product-10.jpg',1,22,0,'2023-09-30','Yunis',null,null,null,null),
('product-11.jpg',1,23,0,'2023-09-30','Yunis',null,null,null,null),
('product-12.jpg',1,24,0,'2023-09-30','Yunis',null,null,null,null),
('product-1.jpg',1,25,0,'2023-09-30','Yunis',null,null,null,null),
('product-2.jpg',1,26,0,'2023-09-30','Yunis',null,null,null,null),
('product-3.jpg',1,27,0,'2023-09-30','Yunis',null,null,null,null),
('product-4.jpg',1,28,0,'2023-09-30','Yunis',null,null,null,null),
('product-5.jpg',1,29,0,'2023-09-30','Yunis',null,null,null,null),
('product-6.jpg',1,30,0,'2023-09-30','Yunis',null,null,null,null),
('product-7.jpg',1,31,0,'2023-09-30','Yunis',null,null,null,null),
('product-8.jpg',1,32,0,'2023-09-30','Yunis',null,null,null,null),
('product-9.jpg',1,33,0,'2023-09-30','Yunis',null,null,null,null),
('product-10.jpg',1,34,0,'2023-09-30','Yunis',null,null,null,null),
('product-11.jpg',1,35,0,'2023-09-30','Yunis',null,null,null,null),
('product-12.jpg',1,36,0,'2023-09-30','Yunis',null,null,null,null),
('product-1.jpg',1,37,0,'2023-09-30','Yunis',null,null,null,null),
('product-2.jpg',1,38,0,'2023-09-30','Yunis',null,null,null,null),
('product-3.jpg',1,39,0,'2023-09-30','Yunis',null,null,null,null),
('product-4.jpg',1,40,0,'2023-09-30','Yunis',null,null,null,null),
('product-5.jpg',1,41,0,'2023-09-30','Yunis',null,null,null,null),
('product-6.jpg',1,42,0,'2023-09-30','Yunis',null,null,null,null),
('product-7.jpg',1,43,0,'2023-09-30','Yunis',null,null,null,null),
('product-8.jpg',1,44,0,'2023-09-30','Yunis',null,null,null,null),
('product-9.jpg',1,45,0,'2023-09-30','Yunis',null,null,null,null),
('product-10.jpg',1,46,0,'2023-09-30','Yunis',null,null,null,null),
('product-11.jpg',1,47,0,'2023-09-30','Yunis',null,null,null,null),
('product-12.jpg',1,48,0,'2023-09-30','Yunis',null,null,null,null),
('product-1.jpg',1,49,0,'2023-09-30','Yunis',null,null,null,null),
('product-2.jpg',1,50,0,'2023-09-30','Yunis',null,null,null,null)


Insert Into ProductImages
Values
('product-1.jpg',0,7,0,'2023-09-30','Yunis',null,null,null,null),
('product-2.jpg',0,7,0,'2023-09-30','Yunis',null,null,null,null),
('product-3.jpg',0,7,0,'2023-09-30','Yunis',null,null,null,null),
('product-4.jpg',0,14,0,'2023-09-30','Yunis',null,null,null,null),
('product-5.jpg',0,14,0,'2023-09-30','Yunis',null,null,null,null),
('product-6.jpg',0,50,0,'2023-09-30','Yunis',null,null,null,null),
('product-7.jpg',0,50,0,'2023-09-30','Yunis',null,null,null,null),
('product-8.jpg',0,50,0,'2023-09-30','Yunis',null,null,null,null),
('product-9.jpg',0,50,0,'2023-09-30','Yunis',null,null,null,null),
('product-10.jpg',0,49,0,'2023-09-30','Yunis',null,null,null,null),
('product-11.jpg',0,49,0,'2023-09-30','Yunis',null,null,null,null),
('product-12.jpg',0,49,0,'2023-09-30','Yunis',null,null,null,null)