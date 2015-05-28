/*
 * initializeDB.sql
 *
 * Initializes a MySQL database (created with 'database/createTables.sql') with 
 * recipe and ingredient data, by INSERTing into the Recipes and Ingredients 
 * tables.
 *
 * Usage:  mysql> SOURCE initializeDB.sql;
 *
 * To re-create this file:
 *
 *         $ cd CS130
 *         $ javac webscraper/RecipeSQLGen.java
 *         $ java Main recipes CS130 > database/initializeDB.sql
 *
 * Author: Mark Matney
 */

USE CS130;

INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (
	'The Billionaire Cocktail',
	'http://allrecipes.com/Recipe/The-Billionaire-Cocktail/Detail.aspx?event8=1&prop24=SR_Title&e11=absinthe&e8=Quick%20Search&event10=1&soid=sr_results_p1i6',
	'http://images.media-allrecipes.com/userphotos/250x250/01/93/91/1939187.jpg',
	'00:05:00',
	'Pour bitters, grenadine, simple syrup, lemon juice, and bourbon, respectively, into a cocktail shaker; fill with ice. Cover shaker and shake until chilled, about 30 seconds; strain into a chilled cocktail glass and garnish with lemon wheel. '
);
INSERT INTO Ingredients VALUES (
	1,
	'absinthe-based bitters',
	0.25,
	'fluid ounce'
);
INSERT INTO Ingredients VALUES (
	1,
	'grenadine syrup',
	0.5,
	'fluid ounce'
);
INSERT INTO Ingredients VALUES (
	1,
	'simple syrup',
	0.5,
	'fluid ounce'
);
INSERT INTO Ingredients VALUES (
	1,
	'lemon juice',
	1.0,
	'fluid ounce'
);
INSERT INTO Ingredients VALUES (
	1,
	'high-proof bourbon (such as Bakers)',
	2.0,
	'fluid ounce'
);
INSERT INTO Ingredients VALUES (
	1,
	'lemon wheel',
	1.0,
	'unit'
);



INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (
	'Beef Burgundy Casserole',
	'http://allrecipes.com/Recipe/Beef-Burgundy-Casserole/Detail.aspx?event8=1&prop24=SR_Title&e11=beef%20bourguignon&e8=Quick%20Search&event10=1&soid=sr_results_p1i5',
	'http://images.media-allrecipes.com/userphotos/250x250/01/04/40/1044070.jpg',
	'04:20:00',
	'Preheat oven to 325 degrees F (165 degrees C). In a large bowl combine the beef, dry soup mix, bouillon, onion and soup. Mix all together and pour mixture into a lightly greased 9x13 inch baking dish. Cover and bake in the preheated oven for 4 hours. Add mushrooms and wine and bake for another 10 minutes. Add cooked egg noodles and mix all together. Serve with fresh bread and a green salad, if desired. '
);
INSERT INTO Ingredients VALUES (
	2,
	'beef roast, cut into cubes',
	2.0,
	'pound'
);
INSERT INTO Ingredients VALUES (
	2,
	'herb and lemon soup mix',
	0.5,
	'package'
);
INSERT INTO Ingredients VALUES (
	2,
	'beef bouillon',
	1.0,
	'cube'
);
INSERT INTO Ingredients VALUES (
	2,
	'chopped onion',
	0.5,
	'cup'
);
INSERT INTO Ingredients VALUES (
	2,
	'condensed cream of mushroom soup',
	1.0,
	'can'
);
INSERT INTO Ingredients VALUES (
	2,
	'mushrooms, drained',
	1.0,
	'can'
);
INSERT INTO Ingredients VALUES (
	2,
	'Burgundy wine',
	0.5,
	'cup'
);
INSERT INTO Ingredients VALUES (
	2,
	'cooked egg noodles',
	4.0,
	'cup'
);



INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (
	'5 Hour Beef Stew',
	'http://allrecipes.com/Recipe/5-Hour-Beef-Stew/Detail.aspx?event8=1&prop24=SR_Title&e11=beef%20stew&e8=Quick%20Search&event10=1&soid=sr_results_p1i21',
	'http://images.media-allrecipes.com/userphotos/250x250/01/94/14/1941407.jpg',
	'05:20:00',
	'Preheat oven to 250 degrees F (120 degrees C). Stir beef, potatoes, tomato-vegetable juice cocktail, carrots, celery, onion, tapioca, sugar, salt, and pepper together in a roasting pan; cover. Bake in preheated oven until beef and potatoes are tender, about 5 hours. '
);
INSERT INTO Ingredients VALUES (
	3,
	'beef tenderloin steaks, diced',
	2.0,
	'pound'
);
INSERT INTO Ingredients VALUES (
	3,
	'potatoes, peeled and diced',
	8.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	3,
	'tomato-vegetable juice cocktail (such as V8)',
	4.0,
	'can'
);
INSERT INTO Ingredients VALUES (
	3,
	'diced carrots',
	3.0,
	'cup'
);
INSERT INTO Ingredients VALUES (
	3,
	'diced celery',
	1.0,
	'cup'
);
INSERT INTO Ingredients VALUES (
	3,
	'onion, diced',
	1.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	3,
	'tapioca',
	3.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	3,
	'white sugar',
	1.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	3,
	'salt and ground black pepper to taste',
	NULL,
	'unit'
);



INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (
	'Kheema Pulao',
	'http://allrecipes.com/Recipe/Kheema-Pulao/Detail.aspx?event8=1&prop24=SR_Title&e11=biryani&e8=Quick%20Search&event10=1&soid=sr_results_p1i13',
	'http://images.media-allrecipes.com/userphotos/250x250/00/50/42/504280.jpg',
	'01:15:00',
	'Place the basmati rice in a large container and cover with several inches of cool water; let stand 30 minutes. Drain. Heat the oil in a large pan with a heavy bottom; fry the onion, garlic paste and, ginger paste in the hot oil until the onions are caramelized and golden brown, about 10 minutes. Stir the turmeric, garam masala, and cumin into the mixture; allow to cook together for 30 seconds. Add the tomatoes and cook until the oil separates, about 10 minutes. Crumble the ground beef into the tomato mixture; season with salt and cook until the beef is no longer pink, about 15 minutes. Mix the frozen peas and the green chile peppers into the beef. Heat the ghee in a large skillet over medium heat. Cook the cinnamon stick, cardamom pod, bay leaves, and cloves in the ghee until fragrant, about 1 minute. Add the rice to the spice mixture; cook until the rice smells nutty, 1 to 2 minutes more. Spread the rice with the spices over the beef mixture, but do not stir. Gently pour the water over the rice and season with salt; bring the mixture to a boil for 2 minutes. Cover, reduce heat to low, and continue cooking until the rice is tender, 12 to 15 minutes. Remove from heat completely and allow to sit covered another 20 minutes. Garnish with cilantro to serve. '
);
INSERT INTO Ingredients VALUES (
	4,
	'basmati rice',
	3.0,
	'cup'
);
INSERT INTO Ingredients VALUES (
	4,
	'cooking oil',
	0.25,
	'cup'
);
INSERT INTO Ingredients VALUES (
	4,
	'onions, minced',
	2.0,
	'large'
);
INSERT INTO Ingredients VALUES (
	4,
	'garlic paste',
	1.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	4,
	'ginger paste',
	1.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	4,
	'ground turmeric',
	1.0,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	4,
	'garam masala',
	1.0,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	4,
	'ground cumin',
	1.0,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	4,
	'tomatoes, chopped',
	2.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	4,
	'ground beef',
	1.0,
	'pound'
);
INSERT INTO Ingredients VALUES (
	4,
	'salt to taste',
	NULL,
	'unit'
);
INSERT INTO Ingredients VALUES (
	4,
	'frozen green peas',
	0.5,
	'cup'
);
INSERT INTO Ingredients VALUES (
	4,
	'green chile peppers, halved lengthwise',
	4.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	4,
	'ghee (clarified butter)',
	1.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	4,
	'cinnamon stick',
	1.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	4,
	'black cardamom pod',
	1.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	4,
	'bay leaves',
	2.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	4,
	'whole cloves',
	4.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	4,
	'water',
	5.0,
	'cup'
);
INSERT INTO Ingredients VALUES (
	4,
	'chopped fresh cilantro',
	0.25,
	'cup'
);



INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (
	'Fast and Delicious Black Bean Soup',
	'http://allrecipes.com/Recipe/Fast-and-Delicious-Black-Bean-Soup/Detail.aspx?event8=1&prop24=SR_Title&e11=black%20bean%20soup&e8=Quick%20Search&event10=1&soid=sr_results_p1i21',
	'http://images.media-allrecipes.com/userphotos/250x250/02/01/92/2019277.jpg',
	'00:45:00',
	'Heat the oil in a large pot over medium heat. Stir in the onion, bell pepper, carrot, and garlic, and cook 5 minutes, until tender. Mix in 1 can black beans and chicken broth. In a blender, puree remaining can of beans until smooth. Mix into the pot. Bring soup to a boil. Reduce heat to low. Mix in ham, cumin, salt, and pepper. Simmer 20 minutes. Garnish with Cheddar cheese and sour cream to serve. '
);
INSERT INTO Ingredients VALUES (
	5,
	'vegetable oil',
	2.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	5,
	'onion, chopped',
	1.0,
	'medium'
);
INSERT INTO Ingredients VALUES (
	5,
	'green bell pepper, chopped',
	1.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	5,
	'carrot, peeled and thinly sliced',
	1.0,
	'large'
);
INSERT INTO Ingredients VALUES (
	5,
	'garlic, minced',
	3.0,
	'clove'
);
INSERT INTO Ingredients VALUES (
	5,
	'black beans',
	2.0,
	'can'
);
INSERT INTO Ingredients VALUES (
	5,
	'chicken broth',
	1.0,
	'can'
);
INSERT INTO Ingredients VALUES (
	5,
	'cubed cooked ham',
	2.0,
	'cup'
);
INSERT INTO Ingredients VALUES (
	5,
	'cumin',
	0.25,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	5,
	'salt',
	0.5,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	5,
	'ground black pepper to taste',
	NULL,
	'unit'
);
INSERT INTO Ingredients VALUES (
	5,
	'shredded Cheddar cheese',
	1.0,
	'cup'
);
INSERT INTO Ingredients VALUES (
	5,
	'sour cream',
	1.0,
	'cup'
);



INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (
	'Blueberry Delight Muffins',
	'http://allrecipes.com/Recipe/Blueberry-Delight-Muffins/Detail.aspx?event8=1&prop24=SR_Title&e11=blueberry%20muffins&e8=Quick%20Search&event10=1&soid=sr_results_p1i21',
	'http://images.media-allrecipes.com/userphotos/250x250/01/47/76/1477696.jpg',
	'00:00:00',
	'Preheat the oven to 350 degrees F. Lightly oil or coat 12 muffin cups with nonstick cooking spray and set aside. To make the topping, combine the flour, wheat germ, and brown sugar in a bowl. Add the oil and stir until the dry ingredients are well coated with the oil. Set aside. Meanwhile, whisk together the flour, wheat germ, baking powder, baking soda, cinnamon and salt in a large bowl. Combine the eggs, applesauce, brown sugar, oil, and vanilla in a separate bowl and whisk until well blended. Pour the liquid ingredients over the dry ingredients and stir until just moistened. Gently stir in the blueberries. Spoon the batter into the prepared muffin cups. Arrange the topping evenly over the muffins, using the back of a spoon to gently press the topping into the batter. Bake 20 to 22 minutes, or until the topping is golden and a toothpick inserted in the center comes out clean. '
);
INSERT INTO Ingredients VALUES (
	6,
	'',
	NULL,
	'unit'
);
INSERT INTO Ingredients VALUES (
	6,
	'all-purpose flour',
	2.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	6,
	'wheat germ',
	2.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	6,
	'brown sugar',
	2.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	6,
	'canola oil',
	1.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	6,
	'',
	NULL,
	'unit'
);
INSERT INTO Ingredients VALUES (
	6,
	'all-purpose flour',
	2.0,
	'cup'
);
INSERT INTO Ingredients VALUES (
	6,
	'wheat germ',
	0.25,
	'cup'
);
INSERT INTO Ingredients VALUES (
	6,
	'baking powder',
	1.0,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	6,
	'baking soda',
	0.5,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	6,
	'ground cinnamon',
	0.5,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	6,
	'salt',
	0.25,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	6,
	'eggs, beaten',
	2.0,
	'large'
);
INSERT INTO Ingredients VALUES (
	6,
	'Motts Healthy Harvest Blueberry Delight Applesauce',
	2.0,
	'container'
);
INSERT INTO Ingredients VALUES (
	6,
	'brown sugar',
	0.5,
	'cup'
);
INSERT INTO Ingredients VALUES (
	6,
	'canola oil',
	0.25,
	'cup'
);
INSERT INTO Ingredients VALUES (
	6,
	'vanilla extract',
	1.0,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	6,
	'blueberries',
	1.0,
	'cup'
);



INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (
	'Potatoes and Corn Soup',
	'http://allrecipes.com/Recipe/Potatoes-and-Corn-Soup/Detail.aspx?event8=1&prop24=SR_Title&e11=breadsticks&e8=Quick%20Search&event10=1&soid=sr_results_p1i21',
	'http://images.media-allrecipes.com/userphotos/250x250/01/00/05/1000530.jpg',
	'00:55:00',
	'In a large pot, place the potatoes, celery and leaves, and onion. Pour in enough water to cover. Bring to a boil. Remove the celery leaves, and stir in the bouillon cubes until dissolved. Mix in the corn. Reduce heat to medium-low, and cook 20 minutes, or until the potatoes are tender. Mix the chives into the pot, and continue cooking 5 minutes before serving. '
);
INSERT INTO Ingredients VALUES (
	7,
	'potatoes, peeled and cubed',
	6.0,
	'medium'
);
INSERT INTO Ingredients VALUES (
	7,
	'celery, chopped, leaves reserved',
	6.0,
	'stalk'
);
INSERT INTO Ingredients VALUES (
	7,
	'onion, chopped',
	1.0,
	'medium'
);
INSERT INTO Ingredients VALUES (
	7,
	'chicken bouillon',
	2.0,
	'cube'
);
INSERT INTO Ingredients VALUES (
	7,
	'whole kernel corn, drained',
	2.0,
	'can'
);
INSERT INTO Ingredients VALUES (
	7,
	'chopped fresh chives',
	0.25,
	'cup'
);



INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (
	'Brownie Cones',
	'http://allrecipes.com/Recipe/Brownie-Cones/Detail.aspx?event8=1&prop24=SR_Title&e11=brownies&e8=Quick%20Search&event10=1&soid=sr_results_p1i21',
	'http://images.media-allrecipes.com/images/44555.png',
	'00:35:00',
	'Preheat oven to 350 degrees F (175 degrees C). Place brownie mix, vegetable oil, water, and eggs in a bowl; stir 50 strokes with a spoon. Spoon the brownie batter into ice cream cones, filling them about 3/4 full. Place cones on an ungreased baking sheet. Bake in the preheated oven until a toothpick inserted into the middle of a brownie center comes out clean, about 20 minutes. '
);
INSERT INTO Ingredients VALUES (
	8,
	'brownie mix',
	1.0,
	'package'
);
INSERT INTO Ingredients VALUES (
	8,
	'vegetable oil',
	0.5,
	'cup'
);
INSERT INTO Ingredients VALUES (
	8,
	'water',
	0.25,
	'cup'
);
INSERT INTO Ingredients VALUES (
	8,
	'eggs',
	2.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	8,
	'flat-bottomed wafer ice cream cones',
	12.0,
	'unit'
);



INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (
	'Alis Amazing Bruschetta',
	'http://allrecipes.com/Recipe/Alis-Amazing-Bruschetta/Detail.aspx?event8=1&prop24=SR_Title&e11=bruscheta&e8=Quick%20Search&event10=1&soid=sr_results_p1i21',
	'http://images.media-allrecipes.com/userphotos/250x250/00/01/55/15578.jpg',
	'00:15:00',
	'Preheat oven to 400 degrees F (200 degrees C). In a medium bowl, combine tomatoes, onion, olive oil, oregano, basil and parsley. Place bread on a baking sheet, and top with tomato mixture. Sprinkle with Parmesan. Bake in preheated oven for 8 to 10 minutes, or until bottom of bread is browned. Allow to cool 5 minutes before serving. '
);
INSERT INTO Ingredients VALUES (
	9,
	'tomatoes, coarsely chopped',
	2.0,
	'large'
);
INSERT INTO Ingredients VALUES (
	9,
	'sweet onion, chopped',
	0.5,
	'unit'
);
INSERT INTO Ingredients VALUES (
	9,
	'olive oil',
	2.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	9,
	'chopped fresh oregano',
	1.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	9,
	'chopped fresh basil',
	1.0,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	9,
	'chopped fresh parsley',
	2.0,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	9,
	'Italian bread, cut into 1 inch slices',
	0.5,
	'loaf'
);
INSERT INTO Ingredients VALUES (
	9,
	'freshly grated Parmesan cheese',
	0.25,
	'cup'
);



INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (
	'Chili Burgers',
	'http://allrecipes.com/Recipe/Chili-Burgers/Detail.aspx?event8=1&prop24=SR_Title&e11=burger&e8=Quick%20Search&event10=1&soid=sr_results_p1i21',
	'http://images.media-allrecipes.com/userphotos/250x250/00/10/50/105059.jpg',
	'00:20:00',
	'Preheat a grill for high heat. When the grill is hot, lightly oil the grate. In a medium bowl, mix together the ground beef, Italian sausage, chili sauce, salt and pepper. Form 8 balls out of the meat, and flatten into patties. Grill patties for 5 minutes per side, or until well done. Serve on buns with your favorite toppings. '
);
INSERT INTO Ingredients VALUES (
	10,
	'ground beef',
	1.5,
	'pound'
);
INSERT INTO Ingredients VALUES (
	10,
	'Italian sausage',
	0.5,
	'pound'
);
INSERT INTO Ingredients VALUES (
	10,
	'tomato-based chili sauce',
	0.33333334,
	'cup'
);
INSERT INTO Ingredients VALUES (
	10,
	'salt and pepper to taste',
	NULL,
	'unit'
);



INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (
	'Moms Chicken Cacciatore',
	'http://allrecipes.com/Recipe/Moms-Chicken-Cacciatore/Detail.aspx?event8=1&prop24=SR_Title&e11=cacciatori&e8=Quick%20Search&event10=1&soid=sr_results_p1i21',
	'http://images.media-allrecipes.com/userphotos/250x250/00/29/56/295628.jpg',
	'00:00:00',
	'Combine the flour, salt and pepper in a plastic bag. Shake the chicken pieces in flour until coated. Heat the oil in a large skillet (one that has a cover/lid). Fry the chicken pieces until they are browned on both sides. Remove from skillet. Add the onion, garlic and bell pepper to the skillet and saute until the onion is slightly browned. Return the chicken to the skillet and add the tomatoes, oregano and wine. Cover and simmer for 30 minutes over medium low heat. Add the mushrooms and salt and pepper to taste. Simmer for 10 more minutes. '
);
INSERT INTO Ingredients VALUES (
	11,
	'all-purpose flour for coating',
	2.0,
	'cup'
);
INSERT INTO Ingredients VALUES (
	11,
	'salt',
	0.5,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	11,
	'ground black pepper',
	0.25,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	11,
	'chicken, cut into pieces',
	1.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	11,
	'vegetable oil',
	2.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	11,
	'onion, chopped',
	1.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	11,
	'garlic, minced',
	2.0,
	'clove'
);
INSERT INTO Ingredients VALUES (
	11,
	'green bell pepper, chopped',
	1.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	11,
	'diced tomatoes',
	1.0,
	'can'
);
INSERT INTO Ingredients VALUES (
	11,
	'dried oregano',
	0.5,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	11,
	'white wine',
	0.5,
	'cup'
);
INSERT INTO Ingredients VALUES (
	11,
	'fresh mushrooms, quartered',
	2.0,
	'cup'
);
INSERT INTO Ingredients VALUES (
	11,
	'salt and pepper to taste',
	NULL,
	'unit'
);



INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (
	'Mashed Potato Stuffed Cannoli',
	'http://allrecipes.com/Recipe/Mashed-Potato-Stuffed-Cannoli/Detail.aspx?event8=1&prop24=SR_Title&e11=cannoli&e8=Quick%20Search&event10=1&soid=sr_results_p1i15',
	'http://images.media-allrecipes.com/userphotos/250x250/01/05/29/1052981.jpg',
	'00:00:00',
	'For the Parmesan cannoli: In a non stick skillet on medium high heat, scatter shredded Parmesan in a 3 to 4 inch diameter, keeping the cheese loose to create a lacy effect. Cook until golden brown on one side and gently flip over to brown on the other side - about 1-2 minutes per side. Using a wooden spoon handle, quickly and carefully wrap the each warm cannoli around the handle to form a cylinder. Gently slide off and set aside. Repeat to make approximately 25 cannoli. For the filling: Stir the green onion and parsley into the prepared Roasted Garlic Mashed Potatoes. Cover and cool slightly. When potatoes are cool enough to handle, but still warm, put them in a pastry bag and carefully fill the Parmesan cannoli tubes with the mashed potatoes. Serve immediately. '
);
INSERT INTO Ingredients VALUES (
	12,
	'',
	NULL,
	'unit'
);
INSERT INTO Ingredients VALUES (
	12,
	'shredded Parmesan cheese',
	2.0,
	'cup'
);
INSERT INTO Ingredients VALUES (
	12,
	'',
	NULL,
	'unit'
);
INSERT INTO Ingredients VALUES (
	12,
	'Idahoan Roasted Garlic Flavored Mashed Potatoes, prepared',
	1.0,
	'package'
);
INSERT INTO Ingredients VALUES (
	12,
	'green onion, washed and chopped fine',
	2.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	12,
	'Italian parsley, chopped',
	1.0,
	'tablespoon'
);



INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (
	'Grilled Spanish Mustard Beef',
	'http://allrecipes.com/Recipe/Grilled-Spanish-Mustard-Beef/Detail.aspx?event8=1&prop24=SR_Title&e11=carne%20asada&e8=Quick%20Search&event10=1&soid=sr_results_p1i15',
	'http://images.media-allrecipes.com/userphotos/250x250/01/11/70/1117059.jpg',
	'00:50:00',
	'Preheat an outdoor grill for high heat, and lightly oil the grate. Whisk sherry vinegar, olive oil, mustard, paprika, garlic, salt, and pepper together in a large bowl. Place steak in marinade and turn to coat. Marinate at room temperature for 30 minutes. Cook steak on the preheated grill, turning once, until each side is browned, steak is beginning to firm, and is hot and slightly pink in the center, about 2 minutes per side. An instant-read thermometer inserted into the center should read 140 degrees F (60 degrees C). Transfer steak to a plate and let rest for 5 to 10 minutes before slicing. '
);
INSERT INTO Ingredients VALUES (
	13,
	'sherry vinegar',
	0.25,
	'cup'
);
INSERT INTO Ingredients VALUES (
	13,
	'light olive oil',
	0.25,
	'cup'
);
INSERT INTO Ingredients VALUES (
	13,
	'Dijon mustard',
	2.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	13,
	'smoked paprika',
	2.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	13,
	'garlic, minced',
	4.0,
	'clove'
);
INSERT INTO Ingredients VALUES (
	13,
	'salt and ground black pepper to taste',
	NULL,
	'unit'
);
INSERT INTO Ingredients VALUES (
	13,
	'very thin flank steak',
	2.0,
	'pound'
);



INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (
	'Chili Powder',
	'http://allrecipes.com/Recipe/Chili-Powder/Detail.aspx?event8=1&prop24=SR_Title&e11=chili&e8=Quick%20Search&event10=1&soid=sr_results_p1i21',
	'http://images.media-allrecipes.com/userphotos/250x250/01/13/27/1132721.jpg',
	'00:05:00',
	'Whisk paprika, oregano, cumin, garlic powder, onion powder, and cayenne pepper together in a bowl. '
);
INSERT INTO Ingredients VALUES (
	14,
	'paprika',
	2.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	14,
	'oregano',
	2.0,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	14,
	'cumin',
	1.5,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	14,
	'garlic powder',
	1.5,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	14,
	'onion powder',
	0.75,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	14,
	'cayenne pepper, or to taste',
	0.5,
	'teaspoon'
);



INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (
	'Glenns Jalapeno Sauce',
	'http://allrecipes.com/Recipe/Glenns-Jalapeno-Sauce/Detail.aspx?event8=1&prop24=SR_Title&e11=chile%20relleno&e8=Quick%20Search&event10=1&soid=sr_results_p1i17',
	'http://images.media-allrecipes.com/userphotos/250x250/01/57/44/1574491.jpg',
	'00:10:00',
	'Blend sour cream, jalapeno peppers, green onions, cilantro, garlic powder, and black pepper together in a blender until smooth. '
);
INSERT INTO Ingredients VALUES (
	15,
	'sour cream',
	1.0,
	'container'
);
INSERT INTO Ingredients VALUES (
	15,
	'jalapeno peppers, seeded and chopped',
	2.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	15,
	'green onions, chopped',
	2.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	15,
	'chopped fresh cilantro',
	2.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	15,
	'garlic powder',
	0.5,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	15,
	'ground black pepper',
	0.5,
	'teaspoon'
);



INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (
	'Zippy Chocolate Chip Cookies',
	'http://allrecipes.com/Recipe/Zippy-Chocolate-Chip-Cookies/Detail.aspx?event8=1&prop24=SR_Title&e11=chocolate%20chip%20cookies&e8=Quick%20Search&event10=1&soid=sr_results_p1i21',
	'http://images.media-allrecipes.com/userphotos/250x250/02/07/00/2070028.jpg',
	'00:00:00',
	'Preheat oven to 350 degrees F (180 degrees C). Cream butter or margarine and sugars. Add already beaten eggs and vanilla. Mix dry ingredients together and mix with creamed mixture. Add chocolate chips and nuts. Bake 8 to 10 minutes until done. These are not HOT HOT -- Just a little surprise, definitely a little kick, goes well with the chocolate. '
);
INSERT INTO Ingredients VALUES (
	16,
	'butter',
	1.0,
	'cup'
);
INSERT INTO Ingredients VALUES (
	16,
	'packed brown sugar',
	1.0,
	'cup'
);
INSERT INTO Ingredients VALUES (
	16,
	'white sugar',
	0.75,
	'cup'
);
INSERT INTO Ingredients VALUES (
	16,
	'eggs',
	2.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	16,
	'vanilla extract',
	1.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	16,
	'all-purpose flour',
	2.5,
	'cup'
);
INSERT INTO Ingredients VALUES (
	16,
	'baking powder',
	0.5,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	16,
	'baking soda',
	0.5,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	16,
	'ground white pepper',
	1.0,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	16,
	'semisweet chocolate chips',
	3.0,
	'cup'
);
INSERT INTO Ingredients VALUES (
	16,
	'chopped walnuts',
	1.0,
	'cup'
);



INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (
	'Haystacks IV',
	'http://allrecipes.com/Recipe/Haystacks-IV/Detail.aspx?event8=1&prop24=SR_Title&e11=chow%20mein&e8=Quick%20Search&event10=1&soid=sr_results_p1i21',
	'http://images.media-allrecipes.com/userphotos/250x250/01/12/20/1122005.jpg',
	'01:00:00',
	'In the microwave or over a double boiler, melt butterscotch chips and peanut butter, stirring frequently until smooth. Stir in chow mein noodles and marshmallows to blend well. Drop by heaping teaspoonfuls onto waxed paper and chill until set. '
);
INSERT INTO Ingredients VALUES (
	17,
	'butterscotch chips',
	2.0,
	'cup'
);
INSERT INTO Ingredients VALUES (
	17,
	'peanut butter',
	1.0,
	'cup'
);
INSERT INTO Ingredients VALUES (
	17,
	'chow mein noodles',
	2.0,
	'can'
);
INSERT INTO Ingredients VALUES (
	17,
	'miniature marshmallows',
	4.0,
	'cup'
);



INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (
	'Lemon Pepper Wings',
	'http://allrecipes.com/Recipe/Lemon-Pepper-Wings/Detail.aspx?event8=1&prop24=SR_Title&e11=deep%20fried%20candy%20bars&e8=Quick%20Search&event10=1&soid=sr_results_p1i21',
	'http://images.media-allrecipes.com/userphotos/250x250/02/03/56/2035649.jpg',
	'00:30:00',
	'Heat oil in a deep-fryer or large saucepan to 350 degrees F (175 degrees C). Whisk butter and lemon pepper seasoning together in a large bowl. Place onions in the preheated oil and cook until just beginning to brown, about 5 minutes. Remove and discard onions. Working in batches, cook wings in oil until crispy on the outside and cooked through, about 8 minutes. Remove wings to a paper towel-lined plate to drain excess oil. Toss wings with lemon pepper mixture until completely coated. Return to paper towel-lined plate to drain excess liquid. '
);
INSERT INTO Ingredients VALUES (
	18,
	'peanut oil, or as needed',
	2.0,
	'cup'
);
INSERT INTO Ingredients VALUES (
	18,
	'unsalted butter, melted',
	0.25,
	'cup'
);
INSERT INTO Ingredients VALUES (
	18,
	'lemon pepper seasoning',
	2.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	18,
	'pearl onions',
	6.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	18,
	'chicken wings',
	16.0,
	'unit'
);



INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (
	'Shrimp and Bacon Deviled Eggs',
	'http://allrecipes.com/Recipe/Shrimp-and-Bacon-Deviled-Eggs/Detail.aspx?event8=1&prop24=SR_Title&e11=deviled%20eggs&e8=Quick%20Search&event10=1&soid=sr_results_p1i21',
	'http://images.media-allrecipes.com/userphotos/250x250/02/28/66/2286623.jpg',
	'01:00:00',
	'Place eggs in a saucepan and cover with water. Bring to a boil, remove from heat, and let eggs stand in hot water for 15 minutes. Remove eggs from hot water, cool under cold running water, and peel. Place bacon in a large skillet; cook over medium-high heat, turning occasionally, until evenly browned, about 10 minutes. Drain bacon on paper towels; crumble bacon when cool enough to handle. Cut each egg in half lengthwise; place half the egg yolks in a bowl, reserving remaining yolks for another use. Mash yolks with a fork; stir in potato flakes, mayonnaise, chives, Dijon mustard, seafood seasoning, black pepper, and red pepper until smooth. Stir shrimp, parsley, and cilantro into yolk mixture. Arrange egg whites cut-side-up on a serving platter. Spoon about 1 rounded tablespoon yolk mixture into each egg white half; sprinkle with crumbled bacon. '
);
INSERT INTO Ingredients VALUES (
	19,
	'eggs',
	8.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	19,
	'bacon',
	3.0,
	'slice'
);
INSERT INTO Ingredients VALUES (
	19,
	'instant potato flakes',
	0.25,
	'cup'
);
INSERT INTO Ingredients VALUES (
	19,
	'fat-free mayonnaise',
	0.25,
	'cup'
);
INSERT INTO Ingredients VALUES (
	19,
	'chopped fresh chives',
	1.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	19,
	'Dijon mustard',
	2.0,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	19,
	'seafood seasoning (such as Old Bay)',
	0.5,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	19,
	'freshly ground black pepper',
	0.125,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	19,
	'ground cayenne pepper',
	0.125,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	19,
	'cooked shrimp - peeled, deveined, and chopped',
	6.0,
	'ounce'
);
INSERT INTO Ingredients VALUES (
	19,
	'chopped fresh parsley',
	2.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	19,
	'chopped fresh cilantro',
	2.0,
	'tablespoon'
);



INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (
	'Funnel Cakes III',
	'http://allrecipes.com/Recipe/Funnel-Cakes-III/Detail.aspx?event8=1&prop24=SR_Title&e11=donuts&e8=Quick%20Search&event10=1&soid=sr_results_p1i21',
	'http://images.media-allrecipes.com/userphotos/250x250/00/62/24/622445.jpg',
	'00:00:00',
	'Beat egg. Mix in milk. Sift flour, salt, sugar, and baking powder; beat into egg mixture until smooth. Pour oil into a heavy pan until it is 1 inch deep. Heat to 375 degrees F (190 degrees C). Pour batter through funnel into oil with a circular motion to form a spiral. Fry until lightly brown; turn over to brown the other side. Cook to golden brown, and remove to drain on paper towels. Sprinkle with confectioners sugar while still warm. '
);
INSERT INTO Ingredients VALUES (
	20,
	'egg',
	1.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	20,
	'milk',
	0.6666667,
	'cup'
);
INSERT INTO Ingredients VALUES (
	20,
	'salt',
	0.25,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	20,
	'white sugar',
	2.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	20,
	'sifted all-purpose flour',
	1.3333334,
	'cup'
);
INSERT INTO Ingredients VALUES (
	20,
	'baking powder',
	0.75,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	20,
	'vegetable oil for frying',
	1.0,
	'quart'
);
INSERT INTO Ingredients VALUES (
	20,
	'confectioners sugar for dusting',
	0.25,
	'cup'
);



INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (
	'Caprese-Stuffed Zucchini',
	'http://allrecipes.com/Recipe/Caprese-Stuffed-Zucchini/Detail.aspx?event8=1&prop24=SR_Title&e11=egg%20in%20a%20boat&e8=Quick%20Search&event10=1&soid=sr_results_p1i14',
	'http://images.media-allrecipes.com/images/44555.png',
	'01:00:00',
	'Preheat oven to 350 degrees F (175 degrees C). Line a baking sheet with parchment paper. Season zucchini with sea salt and freshly ground black pepper. Drizzle 2 tablespoons olive oil over the zucchini halves. Bake zucchini in preheated oven until softened, about 10 minutes. Remove to a platter to cool; cut into 2-inch segments, keeping them together to resemble intact halves. Season eggplant slices on both sides with salt and pepper; arrange onto the baking sheet. Bake eggplant for 15 minutes, flip, and continue baking until browned, 15 to 20 minutes more; remove to a cutting board and let cool slightly. Remove and discard skin from eggplant. Chop eggplant flesh and transfer to a large mixing bowl; add tomatoes and garlic. Chop 3/4 cup basil leaves; add to eggplant mixture and season with 1 teaspoon salt and 1/2 teaspoon black pepper. Drizzle 3 tablespoons olive oil over the mixture; toss to coat. Spoon the mixture onto the zucchini halves. Drizzle balsamic vinegar and more olive oil over the stuffed zucchini. Tear remaining basil leaves and sprinkle over the zucchinis. '
);
INSERT INTO Ingredients VALUES (
	21,
	'zucchinis, halved lengthwise and seeded',
	2.0,
	'large'
);
INSERT INTO Ingredients VALUES (
	21,
	'sea salt to taste',
	NULL,
	'unit'
);
INSERT INTO Ingredients VALUES (
	21,
	'freshly ground black pepper to taste',
	NULL,
	'unit'
);
INSERT INTO Ingredients VALUES (
	21,
	'extra-virgin olive oil, or to taste',
	NULL,
	'unit'
);
INSERT INTO Ingredients VALUES (
	21,
	'eggplant',
	2.0,
	'slice'
);
INSERT INTO Ingredients VALUES (
	21,
	'cherry tomatoes, quartered',
	1.0,
	'cup'
);
INSERT INTO Ingredients VALUES (
	21,
	'garlic, minced',
	1.0,
	'clove'
);
INSERT INTO Ingredients VALUES (
	21,
	'fresh basil leaves, divided',
	1.0,
	'cup'
);
INSERT INTO Ingredients VALUES (
	21,
	'sea salt',
	1.0,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	21,
	'ground black pepper',
	0.5,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	21,
	'extra-virgin olive oil, plus more for drizzling',
	3.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	21,
	'balsamic vinegar',
	1.0,
	'tablespoon'
);



INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (
	'Shrimp Enchiladas',
	'http://allrecipes.com/Recipe/Shrimp-Enchiladas/Detail.aspx?event8=1&prop24=SR_Title&e11=enchiladas&e8=Quick%20Search&event10=1&soid=sr_results_p1i21',
	'http://images.media-allrecipes.com/userphotos/250x250/00/83/07/830718.jpg',
	'02:20:00',
	'In a mixing bowl, combine 4 tablespoons olive oil, garlic, ginger, hot sauce, and shrimp. Coat shrimp well with mixture, and marinate 2 hours. Preheat oven to 350 degrees F (175 degrees C). Grease a 9 inch glass pie dish with the remaining 1 tablespoon of olive oil. Fill flour tortillas with marinated shrimp, cheese blend and salsa. Fold tortillas into a roll and place in the greased pie dish. Spread a thin layer of salsa on top of the tortillas. Bake in a preheated oven for 20 minutes or until shrimp are pink. '
);
INSERT INTO Ingredients VALUES (
	22,
	'olive oil',
	5.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	22,
	'minced garlic',
	2.0,
	'clove'
);
INSERT INTO Ingredients VALUES (
	22,
	'ground ginger',
	1.0,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	22,
	'hot sauce',
	0.5,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	22,
	'shrimp, peeled and deveined, without tails',
	16.0,
	'large'
);
INSERT INTO Ingredients VALUES (
	22,
	'flour tortillas',
	4.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	22,
	'shredded Cheddar and Monterey cheese blend',
	0.75,
	'cup'
);
INSERT INTO Ingredients VALUES (
	22,
	'fresh salsa',
	2.0,
	'cup'
);



INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (
	'Lighter Fettuccini Alfredo',
	'http://allrecipes.com/Recipe/Lighter-Fettuccini-Alfredo/Detail.aspx?event8=1&prop24=SR_Title&e11=fettucini%20alfredo&e8=Quick%20Search&event10=1&soid=sr_results_p1i21',
	'http://images.media-allrecipes.com/userphotos/250x250/00/55/84/558470.jpg',
	'00:00:00',
	'In a large pot of boiling salted water cook fettuccini until al dente. Drain. Combine milk, cubed Neufchatel cheese, butter or margarine, garlic powder, onion powder, minced garlic, and salt. Stir until smooth. Stir in grated Parmesan cheese and cook 2 to 3 minutes, or until blended. Toss pasta with Alfredo sauce and serve warm. '
);
INSERT INTO Ingredients VALUES (
	23,
	'dry fettuccine pasta',
	12.0,
	'ounce'
);
INSERT INTO Ingredients VALUES (
	23,
	'nonfat milk',
	1.0,
	'cup'
);
INSERT INTO Ingredients VALUES (
	23,
	'reduced fat margarine',
	0.5,
	'cup'
);
INSERT INTO Ingredients VALUES (
	23,
	'Neufchatel cheese, cubed',
	8.0,
	'ounce'
);
INSERT INTO Ingredients VALUES (
	23,
	'garlic powder',
	0.25,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	23,
	'minced garlic',
	0.5,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	23,
	'onion salt',
	0.25,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	23,
	'grated Parmesan cheese',
	1.0,
	'cup'
);



INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (
	'Fabulous Frosted French Toast',
	'http://allrecipes.com/Recipe/Fabulous-Frosted-French-Toast/Detail.aspx?event8=1&prop24=SR_Title&e11=french%20fries&e8=Quick%20Search&event10=1&soid=sr_results_p1i21',
	'http://images.media-allrecipes.com/userphotos/250x250/00/52/60/526099.jpg',
	'00:35:00',
	'In a medium bowl, whisk together the eggs, milk, 2 tablespoons of sugar, and cinnamon. Melt one tablespoon of butter in a large skillet over medium heat. Dip a few bread slices into the egg mixture just to coat. Place in the hot skillet, and cook until golden on each side, about 4 minutes per side. Repeat with remaining slices of bread. Melt 1 tablespoon of butter in the skillet before frying each batch of toast. While the toast is cooking, mix cream cheese, 2 tablespoons of sugar, sour cream, and whipped topping using an electric mixer or blender until smooth, yet firm. Place servings of warm French toast onto plates, and top with a generous dollop of the frosting. '
);
INSERT INTO Ingredients VALUES (
	24,
	'eggs',
	6.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	24,
	'skim milk',
	1.5,
	'cup'
);
INSERT INTO Ingredients VALUES (
	24,
	'white sugar',
	2.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	24,
	'ground cinnamon',
	2.0,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	24,
	'French bread, cut into 3/4 inch slices',
	1.0,
	'loaf'
);
INSERT INTO Ingredients VALUES (
	24,
	'butter',
	0.25,
	'cup'
);
INSERT INTO Ingredients VALUES (
	24,
	'fat-free cream cheese, softened',
	1.0,
	'package'
);
INSERT INTO Ingredients VALUES (
	24,
	'white sugar',
	2.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	24,
	'fat-free sour cream',
	2.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	24,
	'frozen whipped topping, thawed',
	2.0,
	'tablespoon'
);



INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (
	'Chucks Molasses French Toast',
	'http://allrecipes.com/Recipe/Chucks-Molasses-French-Toast/Detail.aspx?event8=1&prop24=SR_Title&e11=french%20toast&e8=Quick%20Search&event10=1&soid=sr_results_p1i21',
	'http://images.media-allrecipes.com/userphotos/250x250/00/78/49/784964.jpg',
	'00:25:00',
	'Beat together the eggs, molasses, cream, vanilla, ginger, and cinnamon in a bowl until smooth. Dip the challah slices in the batter until coated on all sides. Melt half of the butter in a large skillet over medium heat. Place half of the challah slices into the pan, and cook until golden brown on each side, about 3 minutes per side. Repeat with remaining butter and challah slices. '
);
INSERT INTO Ingredients VALUES (
	25,
	'eggs',
	4.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	25,
	'molasses',
	3.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	25,
	'heavy cream',
	0.5,
	'cup'
);
INSERT INTO Ingredients VALUES (
	25,
	'vanilla extract',
	1.0,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	25,
	'ground ginger',
	1.0,
	'pinch'
);
INSERT INTO Ingredients VALUES (
	25,
	'ground cinnamon, or more to taste',
	1.0,
	'pinch'
);
INSERT INTO Ingredients VALUES (
	25,
	'challah bread',
	12.0,
	'thick slice'
);
INSERT INTO Ingredients VALUES (
	25,
	'butter',
	0.25,
	'cup'
);



INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (
	'Breakfast Fried Rice',
	'http://allrecipes.com/Recipe/Breakfast-Fried-Rice/Detail.aspx?event8=1&prop24=SR_Title&e11=fried%20rice&e8=Quick%20Search&event10=1&soid=sr_results_p1i21',
	'http://images.media-allrecipes.com/userphotos/250x250/01/88/69/1886979.jpg',
	'00:50:00',
	'Bring water and rice to a boil in a saucepan. Reduce heat to medium-low, cover, and simmer until rice is tender and liquid is absorbed, 20 to 25 minutes. Place bacon in a large skillet and cook over medium-high heat, turning occasionally, until evenly browned, about 10 minutes. Transfer bacon slices to a paper-towel lined plate to drain and crumble into bite-size pieces; reserve rendered bacon fat in skillet. Cook and stir eggs in the same skillet over medium heat until slightly set, 1 to 3 minutes. Stir yellow onion, peas, green onion, and 1 1/2 teaspoons soy sauce into eggs; cook and stir until yellow onion is translucent, about 5 minutes more. Reduce heat to low; stir rice, crumbled bacon, and remaining soy sauce into egg mixture until well-combined and heated through, 1 to 3 minutes. '
);
INSERT INTO Ingredients VALUES (
	26,
	'water',
	4.0,
	'cup'
);
INSERT INTO Ingredients VALUES (
	26,
	'uncooked white rice',
	2.0,
	'cup'
);
INSERT INTO Ingredients VALUES (
	26,
	'bacon',
	6.0,
	'slice'
);
INSERT INTO Ingredients VALUES (
	26,
	'eggs, beaten',
	4.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	26,
	'yellow onion, chopped',
	1.0,
	'large'
);
INSERT INTO Ingredients VALUES (
	26,
	'frozen peas',
	1.0,
	'cup'
);
INSERT INTO Ingredients VALUES (
	26,
	'green onions, chopped',
	4.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	26,
	'soy sauce, divided',
	1.5,
	'tablespoon'
);



INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (
	'Garlic Mashed Cauliflower',
	'http://allrecipes.com/Recipe/Garlic-Mashed-Cauliflower/Detail.aspx?event8=1&prop24=SR_Title&e11=garlic%20mashed%20potatoes&e8=Quick%20Search&event10=1&soid=sr_results_p1i21',
	'http://images.media-allrecipes.com/userphotos/250x250/01/01/21/1012130.jpg',
	'00:25:00',
	'Place a steamer insert into a saucepan and fill with water to just below the bottom of the steamer. Bring water to a boil. Add cauliflower, cover, and steam until tender, about 10 minutes. Meanwhile, heat olive oil in a small skillet over medium heat; cook and stir garlic until softened, about 2 minutes. Remove from heat. Transfer half the cauliflower to a food processor; cover and blend on high. Add remaining cauliflower florets, one at a time, until vegetables are creamy. Blend in garlic, Parmesan cheese, cream cheese, salt, and black pepper. '
);
INSERT INTO Ingredients VALUES (
	27,
	'cauliflower, cut into florets',
	1.0,
	'head'
);
INSERT INTO Ingredients VALUES (
	27,
	'olive oil',
	1.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	27,
	'garlic, smashed',
	1.0,
	'clove'
);
INSERT INTO Ingredients VALUES (
	27,
	'grated Parmesan cheese',
	0.25,
	'cup'
);
INSERT INTO Ingredients VALUES (
	27,
	'reduced-fat cream cheese',
	1.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	27,
	'kosher salt',
	0.5,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	27,
	'freshly ground black pepper',
	0.125,
	'teaspoon'
);



INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (
	'Bos Best White German Chocolate Cake',
	'http://allrecipes.com/Recipe/Bos-Best-White-German-Chocolate-Cake/Detail.aspx?event8=1&prop24=SR_Title&e11=german%20chocolate%20cake&e8=Quick%20Search&event10=1&soid=sr_results_p1i21',
	'http://images.media-allrecipes.com/images/44555.png',
	'02:40:00',
	'Preheat oven to 350 degrees F (175 degrees C). Grease and flour three 9-inch baking pans. Mix flour, baking powder, and salt together in a bowl. Place white chocolate in a microwave-safe bowl; cook in microwave on high until melted, stirring between 30 second intervals, until smooth. Beat 1 1/4 cup butter and 2 1/4 cups sugar together in a large bowl until light and fluffy. Beat in 5 egg yolks, one at a time, until incorporated. Stir in melted white chocolate and 1 teaspoon vanilla extract until evenly mixed. Beat flour mixture into butter-white chocolate mixture, alternating with buttermilk, until just mixed. Beat the 5 egg whites in a separate bowl until stiff peaks form. Lift your beater or whisk straight up: the egg whites should form a sharp peak that holds its shape. Fold egg whites into the cake batter. Divide batter among the three prepared baking pans. Bake in the preheated oven until a toothpick inserted in the center of each cake comes out clean, 35 to 40 minutes. Cool cakes in pans for 10 minutes before transferring to wire rack to cool completely. Whisk 4 egg yolks, evaporated milk, and 1 1/2 teaspoons vanilla extract in a large saucepan until well blended. Add 1 1/2 cup white sugar and 3/4 cup butter; cook over medium heat until thickened and golden brown, stirring constantly, about 12 minutes. Remove from heat. Stir coconut and pecans into frosting mixture. Cool to room temperature. Place one cake on a serving plate. Spread a layer of coconut frosting on top of cake. Place second cake on top of frosting layer; spread with a layer of coconut frosting. Place last cake on top; frost top and sides of cake with remaining frosting. '
);
INSERT INTO Ingredients VALUES (
	28,
	'all-purpose flour',
	3.0,
	'cup'
);
INSERT INTO Ingredients VALUES (
	28,
	'baking powder',
	1.0,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	28,
	'salt',
	0.5,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	28,
	'white chocolate, chopped',
	5.0,
	'square'
);
INSERT INTO Ingredients VALUES (
	28,
	'butter',
	1.25,
	'cup'
);
INSERT INTO Ingredients VALUES (
	28,
	'white sugar',
	2.25,
	'cup'
);
INSERT INTO Ingredients VALUES (
	28,
	'eggs, separated',
	5.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	28,
	'vanilla extract',
	1.0,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	28,
	'buttermilk',
	1.25,
	'cup'
);
INSERT INTO Ingredients VALUES (
	28,
	'egg yolks',
	4.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	28,
	'evaporated milk',
	1.0,
	'can'
);
INSERT INTO Ingredients VALUES (
	28,
	'vanilla extract',
	1.5,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	28,
	'white sugar',
	1.5,
	'cup'
);
INSERT INTO Ingredients VALUES (
	28,
	'butter',
	0.75,
	'cup'
);
INSERT INTO Ingredients VALUES (
	28,
	'sweetened flaked coconut',
	1.0,
	'package'
);
INSERT INTO Ingredients VALUES (
	28,
	'chopped pecans',
	1.5,
	'cup'
);



INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (
	'Crab Alfredo',
	'http://allrecipes.com/Recipe/Crab-Alfredo/Detail.aspx?event8=1&prop24=SR_Title&e11=glass%20noodles&e8=Quick%20Search&event10=1&soid=sr_results_p1i21',
	'http://images.media-allrecipes.com/userphotos/250x250/01/08/82/1088283.jpg',
	'00:35:00',
	'Bring a large pot of lightly salted water to a boil. Add pasta and cook for 8 to 10 minutes or until al dente; drain. Keep warm and covered. Meanwhile, melt the butter in a large saucepan over medium heat. Add the minced garlic and cook until garlic releases its aroma, about 2 minutes, being careful not to let the garlic brown. Stir in the flour, salt, pepper, and cayenne pepper. Reduce heat, and cook, stirring constantly for about 2 minutes. Add the half-and-half and stir over medium heat until slightly thickened, about 3 minutes. Add the cream cheese and Parmesan cheese to the sauce and stir until cheeses melt and mixture is smooth. Mix in the crabmeat and continue cooking until crabmeat is heated through, about 3 minutes. Divide the fettucine between 2 plates or bowls and top with the crab sauce. '
);
INSERT INTO Ingredients VALUES (
	29,
	'dried fettucine',
	8.0,
	'ounce'
);
INSERT INTO Ingredients VALUES (
	29,
	'butter',
	3.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	29,
	'garlic, minced',
	2.0,
	'clove'
);
INSERT INTO Ingredients VALUES (
	29,
	'all-purpose flour',
	3.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	29,
	'salt and black pepper to taste',
	NULL,
	'unit'
);
INSERT INTO Ingredients VALUES (
	29,
	'cayenne pepper',
	0.5,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	29,
	'half-and-half',
	2.0,
	'cup'
);
INSERT INTO Ingredients VALUES (
	29,
	'cream cheese, softened',
	1.0,
	'package'
);
INSERT INTO Ingredients VALUES (
	29,
	'grated Parmesan cheese',
	0.5,
	'cup'
);
INSERT INTO Ingredients VALUES (
	29,
	'crabmeat, flaked',
	8.0,
	'ounce'
);



INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (
	'Gnocchi in Fontina Sauce',
	'http://allrecipes.com/Recipe/Gnocchi-in-Fontina-Sauce/Detail.aspx?event8=1&prop24=SR_Title&e11=gnocchi&e8=Quick%20Search&event10=1&soid=sr_results_p1i21',
	'http://images.media-allrecipes.com/userphotos/250x250/00/00/25/2542.jpg',
	'00:20:00',
	'Bring a large pot of lightly salted water to a boil. Add the gnocchi, and cook until tender, about 5 minutes. Drain, and set aside. Once the gnocchi goes into the pot, start the sauce, as you want the gnocchi to be done first. Melt the butter in a saucepan over medium heat. Add the shallots, and cook for a few minutes, until tender. Stir in the cream, and heat to almost a boil. Gradually mix in the fontina and parmesan cheeses, being careful not to boil. Stir until smooth, then remove from the heat immediately, or the sauce may clump. Place gnocchi into serving dishes, and spoon the sauce over them. Garnish with chopped fresh basil. '
);
INSERT INTO Ingredients VALUES (
	30,
	'refrigerated gnocchi',
	1.0,
	'pound'
);
INSERT INTO Ingredients VALUES (
	30,
	'unsalted butter',
	6.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	30,
	'chopped shallots',
	2.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	30,
	'Italian fontina cheese, cubed',
	8.0,
	'ounce'
);
INSERT INTO Ingredients VALUES (
	30,
	'heavy cream',
	0.33333334,
	'cup'
);
INSERT INTO Ingredients VALUES (
	30,
	'freshly grated Parmesan cheese',
	3.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	30,
	'chopped fresh basil',
	1.0,
	'tablespoon'
);



INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (
	'Southern Fried Green Beans',
	'http://allrecipes.com/Recipe/Southern-Fried-Green-Beans/Detail.aspx?event8=1&prop24=SR_Title&e11=green%20beans&e8=Quick%20Search&event10=1&soid=sr_results_p1i21',
	'http://images.media-allrecipes.com/userphotos/250x250/01/09/17/1091798.jpg',
	'00:35:00',
	'Place the bacon in a skillet; cook over medium-high heat, turning occasionally, until evenly browned and crisp. Mix the sugar and green beans into the bacon. Cook over medium-high heat until green beans become become soft and limp and start to caramelize. '
);
INSERT INTO Ingredients VALUES (
	31,
	'bacon, diced',
	5.0,
	'slice'
);
INSERT INTO Ingredients VALUES (
	31,
	'green beans, drained',
	2.0,
	'can'
);
INSERT INTO Ingredients VALUES (
	31,
	'white sugar',
	1.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	31,
	'salt and pepper to taste',
	NULL,
	'unit'
);



INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (
	'Hash Brown Casserole I',
	'http://allrecipes.com/Recipe/Hash-Brown-Casserole-I/Detail.aspx?event8=1&prop24=SR_Title&e11=hash%20browns&e8=Quick%20Search&event10=1&soid=sr_results_p1i21',
	'http://images.media-allrecipes.com/userphotos/250x250/00/05/42/54210.jpg',
	'00:00:00',
	'Preheat oven to 350 degrees F (175 degrees C). Grease one 8x12 inch baking dish. Over medium heat, cook the onion until soft. In a large bowl, combine the onion, potatoes, sour cream, soup, cheese, pepper and hot sauce. Mix well and pour into baking dish. Bake for 50 minutes. In a saute pan, heat butter or margarine and crackers. Cook until golden brown. Sprinkle over casserole and bake for 30 additional minutes. '
);
INSERT INTO Ingredients VALUES (
	32,
	'onion, chopped',
	1.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	32,
	'frozen hash brown potatoes, thawed',
	1.0,
	'package'
);
INSERT INTO Ingredients VALUES (
	32,
	'sour cream',
	1.0,
	'pint'
);
INSERT INTO Ingredients VALUES (
	32,
	'condensed cream of celery soup',
	2.0,
	'can'
);
INSERT INTO Ingredients VALUES (
	32,
	'shredded Cheddar cheese',
	1.0,
	'cup'
);
INSERT INTO Ingredients VALUES (
	32,
	'ground black pepper',
	0.25,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	32,
	'hot pepper sauce',
	1.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	32,
	'butter',
	3.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	32,
	'buttery round crackers, crushed',
	4.0,
	'ounce'
);



INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (
	'Bocconcini Salad',
	'http://allrecipes.com/Recipe/Bocconcini-Salad/Detail.aspx?event8=1&prop24=SR_Title&e11=insalata%20caprese&e8=Quick%20Search&event10=1&soid=sr_results_p1i4',
	'http://images.media-allrecipes.com/userphotos/250x250/00/96/98/969819.jpg',
	'00:20:00',
	'In a large salad bowl, combine the mozzarella, cherry tomatoes, bell pepper, celery, endive and arugula. Whisk together the lemon juice and olive oil; pour over the salad. Toss until all the ingredients are thoroughly coated with the dressing. Transfer salad to individual serving plates, if desired. Sprinkle the basil over the salad, season with salt and pepper, and serve immediately. '
);
INSERT INTO Ingredients VALUES (
	33,
	'bocconcini (bite-size mozzarella balls)',
	1.0,
	'pound'
);
INSERT INTO Ingredients VALUES (
	33,
	'cherry tomatoes, halved',
	8.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	33,
	'chopped green bell pepper',
	0.5,
	'cup'
);
INSERT INTO Ingredients VALUES (
	33,
	'chopped celery',
	0.5,
	'cup'
);
INSERT INTO Ingredients VALUES (
	33,
	'Belgian endive leaves',
	0.5,
	'cup'
);
INSERT INTO Ingredients VALUES (
	33,
	'coarsely chopped arugula, stems included',
	0.5,
	'cup'
);
INSERT INTO Ingredients VALUES (
	33,
	'fresh lemon juice',
	1.5,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	33,
	'extra virgin olive oil',
	3.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	33,
	'chopped fresh basil leaves',
	2.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	33,
	'salt and freshly ground black pepper',
	NULL,
	'unit'
);



INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (
	'Bacon-Wrapped Grilled Elk Backstrap',
	'http://allrecipes.com/Recipe/Bacon-Wrapped-Grilled-Elk-Backstrap/Detail.aspx?event8=1&prop24=SR_Title&e11=kebab&e8=Quick%20Search&event10=1&soid=sr_results_p1i21',
	'http://images.media-allrecipes.com/userphotos/250x250/00/64/44/644471.jpg',
	'00:25:00',
	'Preheat an outdoor grill for medium heat. Season backstrap pieces with liquid smoke and Worcestershire sauce. Sprinkle with garlic powder, onion powder, and pepper. Wrap each piece of meat with a strip of bacon, and place on a metal skewer. Cook the elk on the preheated grill until the bacon becomes slightly burnt, and the meat has cooked to medium-rare, 15 to 20 minutes. '
);
INSERT INTO Ingredients VALUES (
	34,
	'elk loin (backstrap), cut into 2 ounce pieces',
	2.0,
	'pound'
);
INSERT INTO Ingredients VALUES (
	34,
	'liquid smoke flavoring',
	1.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	34,
	'Worcestershire sauce',
	1.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	34,
	'garlic powder, or to taste',
	0.5,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	34,
	'onion powder, or to taste',
	0.5,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	34,
	'black pepper, or to taste',
	0.5,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	34,
	'thick cut bacon',
	16.0,
	'slice'
);



INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (
	'Murica Dogs',
	'http://allrecipes.com/Recipe/Murica-Dogs/Detail.aspx?event8=1&prop24=SR_Title&e11=kimchi&e8=Quick%20Search&event10=1&soid=sr_results_p1i17',
	'http://images.media-allrecipes.com/images/44555.png',
	'00:35:00',
	'Put sausages into a skillet and pour enough water into the skillet so the sausages are 2/3 covered. Bring water to a boil, place a cover on the skillet, and cook sausages, turning every few minutes, until no longer pink in the center, 8 to 10 minutes. An instant-read thermometer inserted into the center should read 160 degrees F (70 degrees C). Pour enough oil into a separate skillet to just cover the bottom; heat over medium-high heat. Saute jalapeno pepper in hot oil until softened, 3 to 4 minutes. Melt 2 tablespoons butter in the skillet with the jalapeno pepper. Once butter is hot, cook onion in hot butter until softened, 4 to 5 minutes. Reduce heat to medium-low, add the kimchi, and cook until soft, 1 to 2 minutes. Put skillet with sausages over medium heat. Pour onion mixture into the skillet with the sausages. Return now-empty skillet to medium heat. Melt enough butter in the skillet to cover bottom completely. Grill hoagie buns in batches, adding butter between batches as needed, in skillet until toasted, 2 to 3 minutes per side. Put a sausage into each toasted bun. Spoon vegetable mixture over each sausage. '
);
INSERT INTO Ingredients VALUES (
	35,
	'Italian sausage links',
	6.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	35,
	'vegetable oil, or as needed',
	2.0,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	35,
	'jalapeno pepper, diced small',
	1.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	35,
	'butter, or to taste, divided',
	3.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	35,
	'white onion, minced',
	1.0,
	'large'
);
INSERT INTO Ingredients VALUES (
	35,
	'kimchi, cut into thin strips',
	0.6666667,
	'cup'
);
INSERT INTO Ingredients VALUES (
	35,
	'hoagie rolls, split lengthwise',
	6.0,
	'unit'
);



INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (
	'Eunahs Korean-Style Seaweed Soup',
	'http://allrecipes.com/Recipe/Eunahs-Korean-Style-Seaweed-Soup/Detail.aspx?event8=1&prop24=SR_Title&e11=korean%20stew&e8=Quick%20Search&event10=1&soid=sr_results_p1i13',
	'http://images.media-allrecipes.com/images/44555.png',
	'00:45:00',
	'Soak the seaweed in room temperature water until soft, about 15 minutes; drain. Rinse the sheets and cut into 2 inch long pieces; set aside. Heat the sesame oil in a saucepan over medium-high heat. Stir in the beef, salt, and 1/3 of the soy sauce. Cook and stir until the beef is crumbly and no longer pink, about 4 minutes. Add the seaweed and the remaining soy sauce; cook and stir 1 minute. Stir in the garlic and pour in the water. Bring to a boil; reduce heat to medium-low and simmer until the beef and seaweed are tender, about 15 minutes more. '
);
INSERT INTO Ingredients VALUES (
	36,
	'dried wakame (brown) seaweed',
	1.0,
	'ounce'
);
INSERT INTO Ingredients VALUES (
	36,
	'sesame oil',
	2.0,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	36,
	'extra lean ground beef',
	0.5,
	'cup'
);
INSERT INTO Ingredients VALUES (
	36,
	'salt, or to taste',
	1.0,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	36,
	'soy sauce',
	1.5,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	36,
	'minced garlic',
	1.0,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	36,
	'water',
	7.0,
	'cup'
);



INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (
	'Kung Wow Chicken',
	'http://allrecipes.com/Recipe/Kung-Wow-Chicken/Detail.aspx?event8=1&prop24=SR_Title&e11=kung%20pao%20chicken&e8=Quick%20Search&event10=1&soid=sr_results_p1i5',
	'http://images.media-allrecipes.com/userphotos/250x250/00/80/29/802971.jpg',
	'01:35:00',
	'Whisk together 1 tablespoon white wine, 1 tablespoon soy sauce, 1 teaspoon brown sugar, and finely chopped green onion. Stir in chicken pieces to coat. Cover and refrigerate for 1 hour. Combine white vinegar, rice vinegar, 1 tablespoon soy sauce, sambal chile paste, sesame oil, 2 tablespoons brown sugar, ketchup, 2 tablespoon white wine, and garlic in a bowl. Whisk thoroughly; set aside. Mix cornstarch with cold water in a small bowl. Heat peanut oil in a heavy duty, nonstick skillet over high heat. Stir in chicken; cook and stir until chicken begins to brown, about 2 minutes Stir in zucchini and red bell pepper; cook for 2 more minutes. Add chicken broth and stir. Stir in vinegar mixture; cook and stir until vegetables are tender and chicken is no longer pink in the center, about 2 minutes. Stir in cornstarch mixture until sauce is thickened, about 30 seconds; remove from heat. Toss in peanuts; season with salt and pepper to taste. Stir in green onion tops. Serve over white rice. '
);
INSERT INTO Ingredients VALUES (
	37,
	'white wine',
	1.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	37,
	'soy sauce',
	1.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	37,
	'brown sugar',
	1.0,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	37,
	'green onions, finely chopped (white parts only)',
	3.0,
	'medium'
);
INSERT INTO Ingredients VALUES (
	37,
	'skinless, boneless chicken breast, cut into 1-inch pieces',
	1.0,
	'pound'
);
INSERT INTO Ingredients VALUES (
	37,
	'&nbsp;',
	NULL,
	'unit'
);
INSERT INTO Ingredients VALUES (
	37,
	'white vinegar',
	1.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	37,
	'rice vinegar',
	2.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	37,
	'soy sauce, or to taste',
	1.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	37,
	'Asian chili paste (sambal), or more to taste',
	1.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	37,
	'sesame oil',
	1.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	37,
	'brown sugar',
	2.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	37,
	'ketchup',
	2.0,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	37,
	'white wine',
	2.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	37,
	'garlic, minced',
	4.0,
	'clove'
);
INSERT INTO Ingredients VALUES (
	37,
	'&nbsp;',
	NULL,
	'unit'
);
INSERT INTO Ingredients VALUES (
	37,
	'cornstarch',
	1.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	37,
	'water',
	2.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	37,
	'peanut oil',
	2.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	37,
	'cubed zucchini',
	2.0,
	'cup'
);
INSERT INTO Ingredients VALUES (
	37,
	'cubed red bell pepper',
	1.0,
	'cup'
);
INSERT INTO Ingredients VALUES (
	37,
	'chicken broth',
	0.5,
	'cup'
);
INSERT INTO Ingredients VALUES (
	37,
	'roasted, salted peanuts',
	0.25,
	'cup'
);
INSERT INTO Ingredients VALUES (
	37,
	'salt and ground black pepper to taste',
	NULL,
	'unit'
);
INSERT INTO Ingredients VALUES (
	37,
	'chopped green onion tops',
	0.25,
	'cup'
);
INSERT INTO Ingredients VALUES (
	37,
	'cooked white rice',
	4.0,
	'cup'
);



INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (
	'Passover Lasagna',
	'http://allrecipes.com/Recipe/Passover-Lasagna/Detail.aspx?event8=1&prop24=SR_Title&e11=lasagna&e8=Quick%20Search&event10=1&soid=sr_results_p1i21',
	'http://images.media-allrecipes.com/images/44555.png',
	'00:45:00',
	'Preheat an oven to 350 degrees F (175 degrees C). Spray a 9x13-inch pan with cooking spray. Break matzo sheets in half and run under warm water to soften. Pour tomato sauce into bowl, and season with salt and pepper. Coat the bottom of the prepared pan with some of the tomato sauce, then begin layering with the softened matzo sheet, Swiss cheese, mozzarella cheese, and tomato sauce. Continue layering until the cheeses are used up, finishing with a layer of matzo. Top with the remaining tomato sauce, and sprinkle with Parmesan cheese and oregano. Bake in the preheated oven until the cheese is melted, 25 to 30 minutes. '
);
INSERT INTO Ingredients VALUES (
	38,
	'matzo sheets',
	1.0,
	'package'
);
INSERT INTO Ingredients VALUES (
	38,
	'tomato sauce',
	1.0,
	'quart'
);
INSERT INTO Ingredients VALUES (
	38,
	'salt and pepper to taste',
	NULL,
	'unit'
);
INSERT INTO Ingredients VALUES (
	38,
	'sliced Swiss cheese',
	1.0,
	'package'
);
INSERT INTO Ingredients VALUES (
	38,
	'shredded mozzarella cheese',
	2.0,
	'cup'
);
INSERT INTO Ingredients VALUES (
	38,
	'grated Parmesan cheese',
	0.25,
	'cup'
);
INSERT INTO Ingredients VALUES (
	38,
	'dried oregano',
	1.0,
	'teaspoon'
);



INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (
	'Citrus Lemonade',
	'http://allrecipes.com/Recipe/Citrus-Lemonade/Detail.aspx?event8=1&prop24=SR_Title&e11=lemonade&e8=Quick%20Search&event10=1&soid=sr_results_p1i21',
	'http://images.media-allrecipes.com/userphotos/250x250/00/11/39/113958.jpg',
	'00:20:00',
	'Pour the sugar, lemon juice, lime juice, and orange juice into a gallon-sized container; stir until the sugar has dissolved. Serve over ice with a slice of lime if desired. '
);
INSERT INTO Ingredients VALUES (
	39,
	'white sugar, or to taste',
	1.0,
	'cup'
);
INSERT INTO Ingredients VALUES (
	39,
	'lemons, juiced',
	4.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	39,
	'limes, juiced',
	4.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	39,
	'oranges, juiced',
	4.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	39,
	'cold water',
	3.0,
	'quart'
);
INSERT INTO Ingredients VALUES (
	39,
	'lime, sliced into rounds',
	1.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	39,
	'ice cubes',
	12.0,
	'cup'
);



INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (
	'Garlic Linguine',
	'http://allrecipes.com/Recipe/Garlic-Linguine/Detail.aspx?event8=1&prop24=SR_Title&e11=linguini&e8=Quick%20Search&event10=1&soid=sr_results_p1i21',
	'http://images.media-allrecipes.com/userphotos/250x250/00/68/66/686694.jpg',
	'00:00:00',
	'Cook pasta in a large pot of boiling water until done. Drain. Meanwhile, heat oil in large saucepan. Add garlic and cook 2 minutes, stirring constantly. Crush herbs, and add to the garlic. Add linguine. Heat through, stirring frequently. Fold in tomatoes. Serve. '
);
INSERT INTO Ingredients VALUES (
	40,
	'linguini pasta',
	1.0,
	'package'
);
INSERT INTO Ingredients VALUES (
	40,
	'olive oil',
	2.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	40,
	'minced garlic',
	1.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	40,
	'dried basil',
	1.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	40,
	'dried oregano',
	1.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	40,
	'dried thyme',
	1.0,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	40,
	'chopped tomatoes',
	2.0,
	'cup'
);



INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (
	'Cheese and Hamburger Macaroni',
	'http://allrecipes.com/Recipe/Cheese-and-Hamburger-Macaroni/Detail.aspx?event8=1&prop24=SR_Title&e11=macaroni%20and%20cheese&e8=Quick%20Search&event10=1&soid=sr_results_p1i21',
	'http://images.media-allrecipes.com/userphotos/250x250/01/02/01/1020197.jpg',
	'00:25:00',
	'Heat a large skillet over medium-high heat. Cook and stir ground beef, onion, garlic powder, onion powder, salt, and black pepper in the hot skillet until browned and crumbly, 5 to 7 minutes; drain and discard grease. Return skillet to burner over high heat. Add water; cover skillet and bring to a boil. Stir macaroni into the boiling water-ground beef mixture; cover and lower heat to medium. Cook, keeping covered, for 5 minutes. Stir, cover, and cook until macaroni is tender, about 5 more minutes. Stir processed cheese food into ground beef-macaroni mixture until melted. Remove from heat; stir in sour cream. '
);
INSERT INTO Ingredients VALUES (
	41,
	'lean ground beef, or more to taste',
	0.5,
	'pound'
);
INSERT INTO Ingredients VALUES (
	41,
	'onion, minced',
	0.5,
	'small'
);
INSERT INTO Ingredients VALUES (
	41,
	'garlic powder',
	1.0,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	41,
	'onion powder',
	1.0,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	41,
	'salt and ground black pepper to taste',
	1.0,
	'pinch'
);
INSERT INTO Ingredients VALUES (
	41,
	'water',
	2.0,
	'cup'
);
INSERT INTO Ingredients VALUES (
	41,
	'elbow macaroni',
	2.0,
	'cup'
);
INSERT INTO Ingredients VALUES (
	41,
	'reduced-fat processed cheese food (such as Velveeta), cut into small pieces',
	8.0,
	'ounce'
);
INSERT INTO Ingredients VALUES (
	41,
	'reduced-fat sour cream, or more to taste',
	2.0,
	'tablespoon'
);



INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (
	'Margarita Cupcakes',
	'http://allrecipes.com/Recipe/Margarita-Cupcakes/Detail.aspx?event8=1&prop24=SR_Title&e11=margaritas&e8=Quick%20Search&event10=1&soid=sr_results_p1i21',
	'http://images.media-allrecipes.com/userphotos/250x250/02/09/47/2094730.jpg',
	'00:45:00',
	'Preheat oven to 325 degrees F (165 degrees C). Line muffin cups with paper liners. Mix cake mix and butter together in a large bowl; add eggs, margarita mix, and egg yolks and stir just until combined. Pour lemon-lime soda into batter and stir until foam is dissolved. Stir tequila into the batter. Pour batter into the prepared muffin cups. Bake in the preheated oven until a toothpick inserted in the center comes out clean, about 30 minutes. '
);
INSERT INTO Ingredients VALUES (
	42,
	'yellow cake mix (such as Betty Crocker)',
	1.0,
	'package'
);
INSERT INTO Ingredients VALUES (
	42,
	'butter, melted',
	0.5,
	'cup'
);
INSERT INTO Ingredients VALUES (
	42,
	'eggs',
	3.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	42,
	'lime margarita mix (such as Jose Cuervo)',
	0.5,
	'cup'
);
INSERT INTO Ingredients VALUES (
	42,
	'egg yolk',
	1.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	42,
	'lemon-lime soda',
	0.75,
	'cup'
);
INSERT INTO Ingredients VALUES (
	42,
	'tequila (such as Jose Cuervo)',
	1.5,
	'jigger'
);



INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (
	'Mexican Rice II',
	'http://allrecipes.com/Recipe/Mexican-Rice-II/Detail.aspx?event8=1&prop24=SR_Title&e11=mexican%20rice&e8=Quick%20Search&event10=1&soid=sr_results_p1i21',
	'http://images.media-allrecipes.com/userphotos/250x250/00/43/73/437348.jpg',
	'00:30:00',
	'Heat oil in a large saucepan over medium heat and add rice. Cook, stirring constantly, until puffed and golden. While rice is cooking, sprinkle with salt and cumin. Stir in onions and cook until tender. Stir in tomato sauce and chicken broth; bring to a boil. Reduce heat to low, cover and simmer for 20 to 25 minutes. Fluff with a fork. '
);
INSERT INTO Ingredients VALUES (
	43,
	'vegetable oil',
	3.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	43,
	'uncooked long-grain rice',
	1.0,
	'cup'
);
INSERT INTO Ingredients VALUES (
	43,
	'garlic salt',
	1.0,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	43,
	'ground cumin',
	0.5,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	43,
	'chopped onion',
	0.25,
	'cup'
);
INSERT INTO Ingredients VALUES (
	43,
	'tomato sauce',
	0.5,
	'cup'
);
INSERT INTO Ingredients VALUES (
	43,
	'chicken broth',
	2.0,
	'cup'
);



INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (
	'Pasta Milan',
	'http://allrecipes.com/Recipe/Pasta-Milan/Detail.aspx?event8=1&prop24=SR_Title&e11=milanesa&e8=Quick%20Search&event10=1&soid=sr_results_p1i5',
	'http://images.media-allrecipes.com/userphotos/250x250/00/98/50/985067.jpg',
	'00:35:00',
	'Bring a large pot of lightly salted water to a boil. Add pasta, peas and asparagus to boiling water. Cook for 5 minutes or until pasta is al dente. Drain. Meanwhile, crumble cheese with the cream and season with salt and pepper to taste. In large bowl, toss pasta and vegetables with cheese mixture, stirring until the cheese has melted and the pasta is well coated with the sauce. Serve immediately. '
);
INSERT INTO Ingredients VALUES (
	44,
	'penne pasta',
	8.0,
	'ounce'
);
INSERT INTO Ingredients VALUES (
	44,
	'frozen green peas',
	4.0,
	'ounce'
);
INSERT INTO Ingredients VALUES (
	44,
	'asparagus tips',
	4.0,
	'ounce'
);
INSERT INTO Ingredients VALUES (
	44,
	'Gorgonzola cheese',
	4.0,
	'ounce'
);
INSERT INTO Ingredients VALUES (
	44,
	'heavy whipping cream',
	0.33333334,
	'cup'
);
INSERT INTO Ingredients VALUES (
	44,
	'salt and pepper to taste',
	NULL,
	'unit'
);



INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (
	'Claudettes Minestrone',
	'http://allrecipes.com/Recipe/Claudettes-Minestrone/Detail.aspx?event8=1&prop24=SR_Title&e11=minestrone%20soup&e8=Quick%20Search&event10=1&soid=sr_results_p1i21',
	'http://images.media-allrecipes.com/userphotos/250x250/00/96/46/964647.jpg',
	'00:00:00',
	'In a large pot combine the potatoes, carrots, celery, onion, garlic, beans, tomato paste and water. Cook over medium heat until all the vegetables are tender. Transfer soup to a food processor or blender and puree until smooth. Return to pot and stir in the pasta. Cook until pasta is done. Serve with Romano or Parmesan cheese, if desired. '
);
INSERT INTO Ingredients VALUES (
	45,
	'potatoes, peeled and cubed',
	5.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	45,
	'carrots, chopped',
	5.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	45,
	'celery, chopped',
	4.0,
	'stalk'
);
INSERT INTO Ingredients VALUES (
	45,
	'onion, chopped',
	1.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	45,
	'garlic, minced',
	1.0,
	'clove'
);
INSERT INTO Ingredients VALUES (
	45,
	'tomato paste',
	0.5,
	'cup'
);
INSERT INTO Ingredients VALUES (
	45,
	'kidney beans',
	1.0,
	'can'
);
INSERT INTO Ingredients VALUES (
	45,
	'water',
	2.0,
	'quart'
);
INSERT INTO Ingredients VALUES (
	45,
	'seashell pasta',
	1.0,
	'cup'
);



INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (
	'Shrimp and Chicken Miso Ramen',
	'http://allrecipes.com/Recipe/Shrimp-and-Chicken-Miso-Ramen/Detail.aspx?event8=1&prop24=SR_Title&e11=miso%20ramen&e8=Quick%20Search&event10=1&soid=sr_results_p1i1',
	'http://images.media-allrecipes.com/images/44555.png',
	'00:35:00',
	'Soak wakame in a bowl of cold water; set aside. Heat oil in a skillet over medium heat; cook and stir chicken and shrimp until chicken is no longer pink in the center and shrimp is bright pink, 5 to 10 minutes. Bring 1 pint cold water to a boil and stir in dashi powder; reduce heat to medium and add vermicelli. Mix miso paste and about 2 tablespoons hot dashi broth together in a bowl; pour back into broth and stir until miso is incorporated. Keep liquid at a simmer until noodles are tender, about 2 minutes. Add 1 cup hot water to broth if taste is too strong. Drain wakame. Add wakame, chicken-shrimp mixture, seafood sticks, red chile pepper, soy sauce, and sesame seeds to broth and mix well. Transfer mixture to serving bowls and top with spring onions. '
);
INSERT INTO Ingredients VALUES (
	46,
	'wakame (dried seaweed), or to taste',
	1.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	46,
	'vegetable oil, or as needed',
	2.0,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	46,
	'chicken breast, cut into strips',
	1.0,
	'large'
);
INSERT INTO Ingredients VALUES (
	46,
	'shrimp',
	3.5,
	'ounce'
);
INSERT INTO Ingredients VALUES (
	46,
	'cold water',
	1.0,
	'pint'
);
INSERT INTO Ingredients VALUES (
	46,
	'dashi powder, or to taste',
	1.0,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	46,
	'rice vermicelli, or to taste',
	1.5,
	'cup'
);
INSERT INTO Ingredients VALUES (
	46,
	'white miso paste, or more to taste',
	2.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	46,
	'hot water, as needed',
	1.0,
	'cup'
);
INSERT INTO Ingredients VALUES (
	46,
	'imitation seafood sticks, sliced into strips',
	3.0,
	'fillet'
);
INSERT INTO Ingredients VALUES (
	46,
	'fresh red chile pepper, minced',
	1.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	46,
	'soy sauce',
	2.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	46,
	'sesame seeds',
	1.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	46,
	'spring onions, chopped',
	2.0,
	'unit'
);



INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (
	'Zesty Orange Rice Cake',
	'http://allrecipes.com/Recipe/Zesty-Orange-Rice-Cake/Detail.aspx?event8=1&prop24=SR_Title&e11=mochi&e8=Quick%20Search&event10=1&soid=sr_results_p1i18',
	'http://images.media-allrecipes.com/images/44555.png',
	'02:10:00',
	'Bring milk to a simmer in a saucepan; add vanilla bean and stir. Mix rice and white sugar into simmering milk; add lemon peel. Bring liquid to a boil, reduce heat to low, and simmer, stirring constantly, until rice is tender, 20 to 25 minutes. Transfer saucepan to the refrigerator and chill, at least 30 minutes. Whisk egg yolks and orange liqueur together in a bowl. Beat egg whites in a separate bowl until foamy. Continue to beat egg whites until stiff peaks form. Lift your beater or whisk straight up: the egg whites will form sharp peaks. Preheat oven to 350 degrees F (175 degrees C). Grease or line a 9-inch cake pan with parchment paper. Remove vanilla bean and lemon peel from rice. Stir raisins and orange zest into rice; add egg yolk mixture and stir. Softly fold egg whites into rice mixture. Slowly pour rice mixture into the prepared cake pan. Bake in the preheated oven until set, about 1 hour. Sprinkle confectioners sugar over rice cake. '
);
INSERT INTO Ingredients VALUES (
	47,
	'milk',
	7.0,
	'cup'
);
INSERT INTO Ingredients VALUES (
	47,
	'vanilla bean',
	1.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	47,
	'Arborio rice',
	1.5,
	'cup'
);
INSERT INTO Ingredients VALUES (
	47,
	'white sugar',
	1.0,
	'cup'
);
INSERT INTO Ingredients VALUES (
	47,
	'strips lemon peel',
	3.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	47,
	'eggs, separated',
	5.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	47,
	'orange liqueur',
	1.0,
	'jigger'
);
INSERT INTO Ingredients VALUES (
	47,
	'raisins',
	0.25,
	'cup'
);
INSERT INTO Ingredients VALUES (
	47,
	'orange, zested',
	1.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	47,
	'confectioners sugar, or to taste',
	1.0,
	'tablespoon'
);



INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (
	'Indian Chicken Curry (Murgh Kari)',
	'http://allrecipes.com/Recipe/Indian-Chicken-Curry-Murgh-Kari/Detail.aspx?event8=1&prop24=SR_Title&e11=murgh%20kari&e8=Quick%20Search&event10=1&soid=sr_results_p1i1',
	'http://images.media-allrecipes.com/userphotos/250x250/00/35/87/358734.jpg',
	'01:00:00',
	'Sprinkle the chicken breasts with 2 teaspoons salt. Heat the oil in a large skillet over high heat; partially cook the chicken in the hot oil in batches until completely browned. Transfer the browned chicken breasts to a plate and set aside. Reduce the heat under the skillet to medium-high; add the onion, garlic, and ginger to the oil remaining in the skillet and cook and stir until the onion turns translucent, about 8 minutes. Stir the curry powder, cumin, turmeric, coriander, cayenne, and 1 tablespoon of water into the onion mixture; allow to heat together for about 1 minute while stirring. Mix the tomatoes, yogurt, 1 tablespoon chopped cilantro, and 1 teaspoon salt into the mixture. Return the chicken breast to the skillet along with any juices on the plate. Pour 1/2 cup water into the mixture; bring to a boil, turning the chicken to coat with the sauce. Sprinkle the garam masala and 1 tablespoon cilantro over the chicken. Cover the skillet and simmer until the chicken breasts are no longer pink in the center and the juices run clear, about 20 minutes. An instant-read thermometer inserted into the center should read at least 165 degrees F (74 degrees C). Sprinkle with lemon juice to serve. '
);
INSERT INTO Ingredients VALUES (
	48,
	'skinless, boneless chicken breast halves',
	2.0,
	'pound'
);
INSERT INTO Ingredients VALUES (
	48,
	'salt',
	2.0,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	48,
	'cooking oil',
	0.5,
	'cup'
);
INSERT INTO Ingredients VALUES (
	48,
	'chopped onion',
	1.5,
	'cup'
);
INSERT INTO Ingredients VALUES (
	48,
	'minced garlic',
	1.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	48,
	'minced fresh ginger root',
	1.5,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	48,
	'curry powder',
	1.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	48,
	'ground cumin',
	1.0,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	48,
	'ground turmeric',
	1.0,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	48,
	'ground coriander',
	1.0,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	48,
	'cayenne pepper',
	1.0,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	48,
	'water',
	1.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	48,
	'crushed tomatoes',
	1.0,
	'can'
);
INSERT INTO Ingredients VALUES (
	48,
	'plain yogurt',
	1.0,
	'cup'
);
INSERT INTO Ingredients VALUES (
	48,
	'chopped fresh cilantro',
	1.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	48,
	'salt',
	1.0,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	48,
	'water',
	0.5,
	'cup'
);
INSERT INTO Ingredients VALUES (
	48,
	'garam masala',
	1.0,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	48,
	'chopped fresh cilantro',
	1.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	48,
	'fresh lemon juice',
	1.0,
	'tablespoon'
);



INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (
	'Panang Curry with Chicken',
	'http://allrecipes.com/Recipe/Panang-Curry-with-Chicken/Detail.aspx?event8=1&prop24=SR_Title&e11=panang%20curry&e8=Quick%20Search&event10=1&soid=sr_results_p1i1',
	'http://images.media-allrecipes.com/userphotos/250x250/00/81/53/815395.jpg',
	'00:35:00',
	'Fry the curry paste in the oil in a large skillet or wok over medium heat until fragrant. Stir the coconut milk into the curry paste and bring to a boil. Add the chicken; cook and stir until the chicken is nearly cooked through, 10 to 15 minutes. Stir the palm sugar, fish sauce, and lime leaves into the mixture; simmer together for 5 minutes. Taste and adjust the saltiness by adding more fish sauce if necessary. Garnish with sliced red chile peppers and Thai basil leaves to serve. '
);
INSERT INTO Ingredients VALUES (
	49,
	'Panang curry paste',
	5.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	49,
	'cooking oil',
	NULL,
	'unit'
);
INSERT INTO Ingredients VALUES (
	49,
	'coconut milk',
	4.0,
	'cup'
);
INSERT INTO Ingredients VALUES (
	49,
	'skinless, boneless chicken breast, cubed',
	0.6666667,
	'pound'
);
INSERT INTO Ingredients VALUES (
	49,
	'palm sugar',
	2.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	49,
	'fish sauce, or to taste',
	2.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	49,
	'kaffir lime leaves, torn',
	6.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	49,
	'fresh red chile peppers, sliced',
	2.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	49,
	'fresh Thai basil leaves',
	0.25,
	'cup'
);



INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (
	'Soy Pancakes',
	'http://allrecipes.com/Recipe/Soy-Pancakes/Detail.aspx?event8=1&prop24=SR_Title&e11=pancakes&e8=Quick%20Search&event10=1&soid=sr_results_p1i21',
	'http://images.media-allrecipes.com/userphotos/250x250/01/11/75/1117527.jpg',
	'00:10:00',
	'Heat a lightly oiled griddle over medium-high heat. Whisk eggs, yogurt, soy flour, sugar substitute, olive oil, flaxseed, vanilla, baking powder, salt, and cinnamon together in a bowl until smooth. Ladle batter onto griddle by 1/4 cupful; spread lightly with the back of the ladle. Cook until bubbles form and the edges are dry, 2 to 3 minutes. Flip carefully and cook until browned on the other side, another 2 to 3 minutes. Repeat with remaining batter. '
);
INSERT INTO Ingredients VALUES (
	50,
	'large eggs',
	2.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	50,
	'fat-free plain yogurt',
	0.33333334,
	'cup'
);
INSERT INTO Ingredients VALUES (
	50,
	'soy flour',
	0.25,
	'cup'
);
INSERT INTO Ingredients VALUES (
	50,
	'stevia sugar substitute (such as Truvia)',
	4.0,
	'packet'
);
INSERT INTO Ingredients VALUES (
	50,
	'olive oil',
	1.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	50,
	'ground flaxseed',
	1.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	50,
	'vanilla extract',
	1.0,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	50,
	'baking powder',
	1.0,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	50,
	'salt',
	0.5,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	50,
	'ground cinnamon',
	0.5,
	'teaspoon'
);



INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (
	'Turkey and Bacon Panini with Chipotle Mayonnaise',
	'http://allrecipes.com/Recipe/Turkey-and-Bacon-Panini-with-Chipotle-Mayonnaise/Detail.aspx?event8=1&prop24=SR_Title&e11=panini&e8=Quick%20Search&event10=1&soid=sr_results_p1i21',
	'http://images.media-allrecipes.com/userphotos/250x250/00/65/12/651270.jpg',
	'00:40:00',
	'Preheat a panini press according to manufacturers instructions. Place the bacon in a large, deep skillet, and cook over medium-high heat, turning occasionally, until evenly browned, about 10 minutes. Drain the bacon slices on a paper towel-lined plate. Meanwhile, melt the butter in a large skillet over medium heat. Cook and stir the garlic and onion until the onion has softened and turned translucent, about 10 minutes. Stir in the spinach and cook until wilted, about 3 minutes more. While the onions and spinach are cooking, stir together the mayonnaise, minced chipotle peppers, and adobo sauce in a small bowl. Spread the mayonnaise over 4 slices of focaccia bread. Place a slice of cheese onto the 4 slices, then divide the turkey among the sandwiches. Place 2 strips of bacon onto each sandwich and top with the spinach mixture. Place the remaining slices of bread onto the sandwiches. Cook the sandwiches in the preheated panini grill according to manufacturers directions until crispy and golden brown, about 5 minutes. '
);
INSERT INTO Ingredients VALUES (
	51,
	'bacon',
	8.0,
	'slice'
);
INSERT INTO Ingredients VALUES (
	51,
	'butter',
	1.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	51,
	'garlic, minced',
	2.0,
	'clove'
);
INSERT INTO Ingredients VALUES (
	51,
	'red onion, thinly sliced',
	0.5,
	'unit'
);
INSERT INTO Ingredients VALUES (
	51,
	'fresh spinach leaves',
	3.0,
	'cup'
);
INSERT INTO Ingredients VALUES (
	51,
	'&nbsp;',
	NULL,
	'unit'
);
INSERT INTO Ingredients VALUES (
	51,
	'reduced-fat mayonnaise',
	0.5,
	'cup'
);
INSERT INTO Ingredients VALUES (
	51,
	'chipotle peppers in adobo sauce, minced',
	2.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	51,
	'adobo sauce from chipotle peppers',
	1.0,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	51,
	'focaccia bread',
	8.0,
	'piece'
);
INSERT INTO Ingredients VALUES (
	51,
	'provolone cheese',
	4.0,
	'slice'
);
INSERT INTO Ingredients VALUES (
	51,
	'sliced deli turkey meat',
	0.5,
	'pound'
);



INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (
	'Pizza Supreme',
	'http://allrecipes.com/Recipe/Pizza-Supreme/Detail.aspx?event8=1&prop24=SR_Title&e11=pizza&e8=Quick%20Search&event10=1&soid=sr_results_p1i21',
	'http://images.media-allrecipes.com/userphotos/250x250/01/02/04/1020443.jpg',
	'00:30:00',
	'Preheat oven to 450 degrees F. Heat oil in large nonstick skillet over medium-high heat and cook Recipe Ready Pizza Supreme Blend, stirring occasionally, 10 minutes or until vegetables are softened and any liquid is absorbed. Arrange pizza crust on baking sheet and evenly spread with pizza sauce. Top with vegetable mixture and pepperoni. Sprinkle with cheese. Bake 10 minutes or until cheese is melted. '
);
INSERT INTO Ingredients VALUES (
	52,
	'olive oil',
	1.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	52,
	'Birds Eye Recipe Ready Pizza Supreme Blend',
	1.0,
	'bag'
);
INSERT INTO Ingredients VALUES (
	52,
	'pre-baked whole wheat or regular pizza crust',
	1.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	52,
	'prepared pizza sauce',
	1.0,
	'cup'
);
INSERT INTO Ingredients VALUES (
	52,
	'sliced pepperoni',
	1.0,
	'ounce'
);
INSERT INTO Ingredients VALUES (
	52,
	'shredded mozzarella cheese',
	1.0,
	'cup'
);



INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (
	'Salmon Pot Pie',
	'http://allrecipes.com/Recipe/Salmon-Pot-Pie/Detail.aspx?event8=1&prop24=SR_Title&e11=poached%20salmon&e8=Quick%20Search&event10=1&soid=sr_results_p1i21',
	'http://images.media-allrecipes.com/userphotos/250x250/01/09/77/1097748.jpg',
	'01:05:00',
	'Preheat oven to 425 degrees F (220 degrees C). Grease two 2-cup baking dishes. Bring the clam juice to a simmer in a small pot. Place salmon fillet into clam juice; poach until fish flakes easily with a fork, about 10 minutes. Remove salmon to a plate; reserve poaching liquid. Heat olive oil and butter in a skillet over medium heat. Stir in carrot, celery, leek, and shallot; cook and stir until vegetables are tender, about 5 minutes. Whisk flour into vegetable mixture; cook and stir until flour is golden, about 5 minutes. Whisk reserved poaching liquid and cream into vegetable mixture; return to a simmer and cook, stirring occasionally, until sauce thickens, about 3 minutes. Stir dill and lemon juice into mixture; season with salt and pepper. Break salmon fillet into bite-size pieces; divide into prepared baking dishes. Cover salmon with 1/3 the sauce; layer 5 shrimp into each dish. Cover shrimp with 1/3 the sauce; divide smoked salmon evenly into each dish. Top with remaining 1/3 the sauce. Roll out puff pastry sheet 1/8-inch thick on a lightly floured surface. Cut two pastry circles large enough to cover the baking dishes and place one circle over each dish. Place dishes on a baking sheet. Bake in the preheated oven until pastry is risen and golden brown, about 15 minutes. Cool for 5 minutes before serving. '
);
INSERT INTO Ingredients VALUES (
	53,
	'clam juice',
	3.0,
	'cup'
);
INSERT INTO Ingredients VALUES (
	53,
	'salmon fillet, skin removed',
	1.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	53,
	'olive oil',
	1.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	53,
	'butter',
	2.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	53,
	'carrot, peeled and diced',
	1.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	53,
	'celery, diced',
	1.0,
	'stalk'
);
INSERT INTO Ingredients VALUES (
	53,
	'leek, diced',
	1.0,
	'small'
);
INSERT INTO Ingredients VALUES (
	53,
	'shallot, minced',
	1.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	53,
	'all-purpose flour, or as needed',
	3.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	53,
	'heavy whipping cream',
	1.0,
	'cup'
);
INSERT INTO Ingredients VALUES (
	53,
	'chopped fresh dill, or to taste',
	3.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	53,
	'lemon, juiced, or to taste',
	0.5,
	'unit'
);
INSERT INTO Ingredients VALUES (
	53,
	'salt and ground black pepper to taste',
	NULL,
	'unit'
);
INSERT INTO Ingredients VALUES (
	53,
	'medium shrimp, peeled and deveined',
	10.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	53,
	'smoked salmon, chopped',
	1.5,
	'ounce'
);
INSERT INTO Ingredients VALUES (
	53,
	'frozen puff pastry, thawed',
	0.5,
	'sheet'
);



INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (
	'Chicken Livers with Gorgonzola Polenta',
	'http://allrecipes.com/Recipe/Chicken-Livers-with-Gorgonzola-Polenta/Detail.aspx?event8=1&prop24=SR_Title&e11=polenta&e8=Quick%20Search&event10=1&soid=sr_results_p1i21',
	'http://images.media-allrecipes.com/userphotos/250x250/00/23/82/238287.jpg',
	'01:00:00',
	'Heat olive oil in a large skillet over medium heat. Add the onion and bell pepper, and season with a little salt and pepper. Cook, stirring frequently, until tender. Add mushrooms and garlic to the skillet, and cook for a few minutes until fragrant. Move the vegetables to the sides of the skillet, and add the chicken livers. Cook livers for 5 minutes, turning frequently. Stir tomatoes and wine into the skillet, and turn the heat to medium-high. Simmer for 20 minutes, or until most of the liquid is gone. Taste and season with salt and pepper. Meanwhile, pour chicken stock into a saucepan, and bring to a boil. Slowly pour in polenta while stirring vigorously. Cook for a few minutes, then stir in milk. Reduce heat to low, cover and simmer for about 5 minutes, until thick. Stir gorgonzola into the polenta until melted. Spoon polenta onto plates, and cover with the chicken liver sauce. '
);
INSERT INTO Ingredients VALUES (
	54,
	'olive oil',
	2.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	54,
	'chicken livers, trimmed and chopped',
	1.0,
	'pound'
);
INSERT INTO Ingredients VALUES (
	54,
	'onion, sliced',
	1.0,
	'medium'
);
INSERT INTO Ingredients VALUES (
	54,
	'green bell pepper, chopped',
	1.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	54,
	'garlic, minced',
	4.0,
	'clove'
);
INSERT INTO Ingredients VALUES (
	54,
	'mushrooms, sliced',
	7.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	54,
	'peeled and diced tomatoes, drained',
	1.0,
	'can'
);
INSERT INTO Ingredients VALUES (
	54,
	'white wine',
	1.0,
	'cup'
);
INSERT INTO Ingredients VALUES (
	54,
	'salt and pepper to taste',
	NULL,
	'unit'
);
INSERT INTO Ingredients VALUES (
	54,
	'&nbsp;',
	NULL,
	'unit'
);
INSERT INTO Ingredients VALUES (
	54,
	'chicken stock',
	2.0,
	'cup'
);
INSERT INTO Ingredients VALUES (
	54,
	'milk',
	0.75,
	'cup'
);
INSERT INTO Ingredients VALUES (
	54,
	'dry polenta',
	1.0,
	'cup'
);
INSERT INTO Ingredients VALUES (
	54,
	'Gorgonzola cheese, crumbled',
	4.0,
	'ounce'
);



INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (
	'Gringo Posole',
	'http://allrecipes.com/Recipe/Gringo-Posole/Detail.aspx?event8=1&prop24=SR_Title&e11=pork%20pozole&e8=Quick%20Search&event10=1&soid=sr_results_p1i6',
	'http://images.media-allrecipes.com/userphotos/250x250/00/81/15/811598.jpg',
	'04:05:00',
	'Pour water into slow cooker, and set the cooker to High to preheat. Heat the vegetable oil in a large skillet over medium heat, and brown the pork on all sides, stirring occasionally, about 10 minutes. Place the browned pork into the hot water in the slow cooker, leaving oil in the skillet. Cook and stir the green and red bell peppers, onion, and garlic in the hot skillet over medium-low heat until the onion is translucent, about 5 minutes. Transfer the vegetables into the slow cooker. Drop in the bouillon cubes. Add water if necessary to barely cover the ingredients, set the cooker to Medium, and cook until the vegetables are tender, 1 1/2 to 2 hours. Pour in the diced tomatoes with chiles, and stir to combine. Cook for 1 more hour; stir in the hominy with liquid, cumin, red pepper, and black pepper, and cook 1 additional hour. '
);
INSERT INTO Ingredients VALUES (
	55,
	'water, or more as needed to cover',
	1.0,
	'cup'
);
INSERT INTO Ingredients VALUES (
	55,
	'vegetable oil, or as needed',
	1.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	55,
	'pork stew meat, cut into 1-inch pieces',
	0.5,
	'pound'
);
INSERT INTO Ingredients VALUES (
	55,
	'green bell pepper, coarsely chopped',
	1.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	55,
	'red bell pepper, coarsely chopped',
	1.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	55,
	'onion, finely chopped',
	1.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	55,
	'garlic, minced',
	2.0,
	'clove'
);
INSERT INTO Ingredients VALUES (
	55,
	'beef bouillon',
	2.0,
	'cube'
);
INSERT INTO Ingredients VALUES (
	55,
	'diced tomatoes with green chile peppers (such as RO*TEL), undrained',
	2.0,
	'can'
);
INSERT INTO Ingredients VALUES (
	55,
	'white hominy, undrained',
	1.0,
	'can'
);
INSERT INTO Ingredients VALUES (
	55,
	'yellow hominy, undrained',
	1.0,
	'can'
);
INSERT INTO Ingredients VALUES (
	55,
	'ground cumin',
	1.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	55,
	'ground red pepper',
	1.0,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	55,
	'ground black pepper',
	1.0,
	'teaspoon'
);



INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (
	'Speedy Chili Pot Pie',
	'http://allrecipes.com/Recipe/Speedy-Chili-Pot-Pie/Detail.aspx?event8=1&prop24=SR_Title&e11=pot%20pie&e8=Quick%20Search&event10=1&soid=sr_results_p1i21',
	'http://images.media-allrecipes.com/userphotos/250x250/02/02/59/2025985.jpg',
	'00:30:00',
	'Preheat oven to 400 degrees F (200 degrees C). Pour the turkey chili into a 9-inch pie dish. In a bowl, whisk together the corn bread mix, milk, and egg until slightly lumpy; spoon the corn bread batter on top of the chili. Bake in the preheated oven until the edges of the corn bread begin to brown and the center is set, 20 to 25 minutes. Sprinkle with Cheddar cheese and a dollop of sour cream. '
);
INSERT INTO Ingredients VALUES (
	56,
	'turkey chili with beans, undrained',
	2.0,
	'can'
);
INSERT INTO Ingredients VALUES (
	56,
	'corn bread/muffin mix',
	1.0,
	'package'
);
INSERT INTO Ingredients VALUES (
	56,
	'milk',
	0.33333334,
	'cup'
);
INSERT INTO Ingredients VALUES (
	56,
	'egg',
	1.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	56,
	'shredded Cheddar cheese, or as desired',
	2.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	56,
	'sour cream, or as desired',
	1.0,
	'tablespoon'
);



INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (
	'Fiesta Au Gratin',
	'http://allrecipes.com/Recipe/Fiesta-Au-Gratin/Detail.aspx?event8=1&prop24=SR_Title&e11=potatoes%20au%20gratin&e8=Quick%20Search&event10=1&soid=sr_results_p1i21',
	'http://images.media-allrecipes.com/userphotos/250x250/01/45/32/1453257.jpg',
	'00:00:00',
	'Prepare Idahoan Au Gratin Homestyle Casserole according to stovetop or oven directions. Add salsa, corn, cheese and chicken in the last 5 minutes of cook time. Finish cooking until all ingredients are heated through and sauce is thickened. Top with crushed tortilla chips. '
);
INSERT INTO Ingredients VALUES (
	57,
	'Idahoan Au Gratin Homestyle Casserole',
	1.0,
	'package'
);
INSERT INTO Ingredients VALUES (
	57,
	'chunky-style salsa',
	0.75,
	'cup'
);
INSERT INTO Ingredients VALUES (
	57,
	'corn',
	1.0,
	'can'
);
INSERT INTO Ingredients VALUES (
	57,
	'shredded Mexican cheese',
	0.5,
	'cup'
);
INSERT INTO Ingredients VALUES (
	57,
	'diced chicken, drained',
	1.0,
	'can'
);
INSERT INTO Ingredients VALUES (
	57,
	'Tortilla chips',
	NULL,
	'unit'
);



INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (
	'Andrews Herb Risotto',
	'http://allrecipes.com/Recipe/Andrews-Herb-Risotto/Detail.aspx?event8=1&prop24=SR_Title&e11=risotto&e8=Quick%20Search&event10=1&soid=sr_results_p1i21',
	'http://images.media-allrecipes.com/userphotos/250x250/01/49/37/1493713.jpg',
	'00:45:00',
	'Heat oil and butter in a medium heavy saucepan over medium heat. Add fennel, bell pepper, onion, garlic, 1 1/2 tablespoons mint, 1 1/2 tablespoons parsley, 1 tablespoon rosemary and 1 teaspoon lemon zest. Saute, stirring, until vegetables are slightly softened (about 2 to 3 minutes). Stir in coriander and rice and saute, stirring, until rice grains are oil-coated (about 3 minutes). Pour in wine and stock and reduce heat to medium low. Simmer uncovered for 20 to 25 minutes, or until liquid is almost absorbed and rice is tender but firm. (Note: Stir once or twice while simmering.) Remove pan from heat and season with salt and pepper to taste. Stir in remaining mint, parsley, rosemary and lemon zest, then add lemon juice and cheese. Cover saucepan with waxed paper and let stand 8 to 10 minutes before serving. '
);
INSERT INTO Ingredients VALUES (
	58,
	'canola oil',
	3.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	58,
	'butter',
	3.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	58,
	'trimmed, diced fennel bulb',
	1.0,
	'cup'
);
INSERT INTO Ingredients VALUES (
	58,
	'red bell pepper, diced',
	1.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	58,
	'yellow onion, diced',
	1.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	58,
	'garlic, minced',
	3.0,
	'clove'
);
INSERT INTO Ingredients VALUES (
	58,
	'chopped fresh mint, divided',
	3.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	58,
	'chopped fresh parsley, divided',
	3.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	58,
	'chopped fresh rosemary, divided',
	2.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	58,
	'grated lemon zest, divided',
	2.0,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	58,
	'ground coriander',
	0.5,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	58,
	'uncooked Arborio rice',
	1.5,
	'cup'
);
INSERT INTO Ingredients VALUES (
	58,
	'dry white wine',
	0.5,
	'cup'
);
INSERT INTO Ingredients VALUES (
	58,
	'chicken stock',
	3.5,
	'cup'
);
INSERT INTO Ingredients VALUES (
	58,
	'salt and pepper to taste',
	NULL,
	'unit'
);
INSERT INTO Ingredients VALUES (
	58,
	'fresh lemon juice',
	1.5,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	58,
	'grated Parmesan cheese',
	0.33333334,
	'cup'
);



INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (
	'Barbeque Bacon Quesadillas',
	'http://allrecipes.com/Recipe/Barbeque-Bacon-Quesadillas/Detail.aspx?event8=1&prop24=SR_Title&e11=quesadilla&e8=Quick%20Search&event10=1&soid=sr_results_p1i21',
	'http://images.media-allrecipes.com/userphotos/250x250/00/65/92/659286.jpg',
	'00:35:00',
	'Heat 1 tablespoon olive oil over medium heat in a large skillet. Add onion; cook and stir onions until softened about 5 minutes. Stir in bacon pieces and brown sugar, and cook until bacon pieces are crisp. Remove from skillet. Spread 1/4 cup barbecue sauce on one tortilla. Sprinkle with 1/4 of the bacon and onion mixture, 1 tablespoon cilantro, and 1/2 cup Cheddar cheese. Top with a tortilla. Heat 1 teaspoon olive oil over medium heat in a large skillet. Place the uncooked quesadilla in the skillet. Cook on one side until browned and crisp, about 3 minutes. Flip, and cook on the other side until the cheese is completely melted, about 2 minutes more. Remove to a paper towel lined plate to cool. Repeat with remaining six tortillas. Slice into quarters using a sharp knife or kitchen scissors when cool enough to handle. '
);
INSERT INTO Ingredients VALUES (
	59,
	'olive oil',
	2.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	59,
	'yellow onion, sliced thin',
	0.5,
	'large'
);
INSERT INTO Ingredients VALUES (
	59,
	'bacon, diced',
	6.0,
	'slice'
);
INSERT INTO Ingredients VALUES (
	59,
	'brown sugar',
	1.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	59,
	'flour tortillas',
	8.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	59,
	'spicy barbeque sauce',
	1.0,
	'cup'
);
INSERT INTO Ingredients VALUES (
	59,
	'chopped fresh cilantro',
	0.25,
	'cup'
);
INSERT INTO Ingredients VALUES (
	59,
	'shredded Cheddar cheese',
	2.0,
	'cup'
);



INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (
	'Quiche Seville',
	'http://allrecipes.com/Recipe/Quiche-Seville/Detail.aspx?event8=1&prop24=SR_Title&e11=quiche&e8=Quick%20Search&event10=1&soid=sr_results_p1i21',
	'http://images.media-allrecipes.com/userphotos/250x250/00/65/26/652650.jpg',
	'01:15:00',
	'Preheat oven to 375 degrees F (190 degrees C). Bake thawed pastry shell at 375 degrees F (190 degrees C) for 10 minutes. Remove from oven and let cool. Reduce oven temperature to 350 degrees F (175 degrees C). Meanwhile, in a medium bowl, combine the sour cream, bacon, cheese, French-fried onions, eggs, Worcestershire sauce and ground black pepper. Mix all together well and pour into the cooled pie shell. Bake at 350 degrees F (175 degrees C) for 35 to 45 minutes, or until quiche is set. '
);
INSERT INTO Ingredients VALUES (
	60,
	'pastry for a 9 inch single crust pie',
	1.0,
	'recipe'
);
INSERT INTO Ingredients VALUES (
	60,
	'sour cream',
	1.0,
	'cup'
);
INSERT INTO Ingredients VALUES (
	60,
	'bacon',
	10.0,
	'thick slice'
);
INSERT INTO Ingredients VALUES (
	60,
	'shredded Monterey Jack cheese',
	1.0,
	'cup'
);
INSERT INTO Ingredients VALUES (
	60,
	'French-fried dried onions',
	2.75,
	'ounce'
);
INSERT INTO Ingredients VALUES (
	60,
	'eggs, beaten',
	6.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	60,
	'Worcestershire sauce',
	0.5,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	60,
	'ground black pepper to taste',
	NULL,
	'unit'
);



INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (
	'Ratatouille with Curry',
	'http://allrecipes.com/Recipe/Ratatouille-with-Curry/Detail.aspx?event8=1&prop24=SR_Title&e11=ratatouille&e8=Quick%20Search&event10=1&soid=sr_results_p1i18',
	'http://images.media-allrecipes.com/images/44555.png',
	'00:30:00',
	'Heat olive oil in a large skillet over medium heat; cook and stir eggplant, zucchini, onion, celery, and red bell pepper until tender, 10 to 15 minutes. Add cider vinegar, tomato paste, garlic, curry powder, salt, and oregano; simmer until liquid is slightly reduced, 5 to 10 minutes. '
);
INSERT INTO Ingredients VALUES (
	61,
	'olive oil',
	2.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	61,
	'cubed eggplant',
	2.0,
	'cup'
);
INSERT INTO Ingredients VALUES (
	61,
	'cubed zucchini',
	2.0,
	'cup'
);
INSERT INTO Ingredients VALUES (
	61,
	'diced onion',
	1.0,
	'cup'
);
INSERT INTO Ingredients VALUES (
	61,
	'diced celery',
	0.5,
	'cup'
);
INSERT INTO Ingredients VALUES (
	61,
	'diced red bell pepper',
	0.5,
	'cup'
);
INSERT INTO Ingredients VALUES (
	61,
	'cider vinegar',
	0.5,
	'cup'
);
INSERT INTO Ingredients VALUES (
	61,
	'tomato paste',
	5.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	61,
	'garlic, minced',
	4.0,
	'clove'
);
INSERT INTO Ingredients VALUES (
	61,
	'curry powder',
	1.0,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	61,
	'salt, or to taste',
	1.0,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	61,
	'dried oregano',
	0.5,
	'teaspoon'
);



INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (
	'Portobello Mushroom Ravioli with Prawns',
	'http://allrecipes.com/Recipe/Portobello-Mushroom-Ravioli-with-Prawns/Detail.aspx?event8=1&prop24=SR_Title&e11=ravioli&e8=Quick%20Search&event10=1&soid=sr_results_p1i21',
	'http://images.media-allrecipes.com/userphotos/250x250/00/79/90/799098.jpg',
	'00:40:00',
	'Have a stock pot of water near boiling before starting the sauce for this recipe! If youre fast at making the sauce, throw in ravioli when you begin to make the sauce. If not, cook ravioli according to package directions. In a large saucepan, melt 1/4 cup of butter or margarine over a medium heat. Saute garlic for 1 to 2 minutes. Stir in olive oil and capers. Add 4 ounces of white wine and prawns, and bring to a boil. Reduce heat and simmer for 2 to 3 minutes, letting wine reduce. Stir in sliced mushrooms, and additional butter and wine so that the sauce is thick, but still liquid after 2 to 3 minutes. Stir in lemon juice, and add fresh pepper to taste. To serve, place raviolis on 4 plates, then place 5 to 6 prawns on each plate. Evenly distribute the remaining sauce between the four plates, and garnish with lots of freshly grated parmesan cheese! '
);
INSERT INTO Ingredients VALUES (
	62,
	'prawns, peeled and deveined',
	20.0,
	'large'
);
INSERT INTO Ingredients VALUES (
	62,
	'prepared fresh cheese ravioli',
	12.0,
	'ounce'
);
INSERT INTO Ingredients VALUES (
	62,
	'large portobello mushrooms, sliced',
	7.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	62,
	'garlic, minced',
	3.0,
	'clove'
);
INSERT INTO Ingredients VALUES (
	62,
	'capers',
	3.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	62,
	'butter',
	0.375,
	'cup'
);
INSERT INTO Ingredients VALUES (
	62,
	'white wine',
	5.0,
	'fluid ounce'
);
INSERT INTO Ingredients VALUES (
	62,
	'olive oil',
	2.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	62,
	'freshly ground black pepper',
	NULL,
	'unit'
);
INSERT INTO Ingredients VALUES (
	62,
	'grated Parmesan cheese',
	2.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	62,
	'lemon, juiced',
	0.5,
	'unit'
);



INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (
	'Succulent Roast Chicken',
	'http://allrecipes.com/Recipe/Succulent-Roast-Chicken/Detail.aspx?event8=1&prop24=SR_Title&e11=roast%20chicken&e8=Quick%20Search&event10=1&soid=sr_results_p1i21',
	'http://images.media-allrecipes.com/userphotos/250x250/00/56/82/568278.jpg',
	'02:00:00',
	'Preheat an oven to 425 degrees F (220 degrees C). Combine the lemon zest, rosemary, thyme, and minced garlic in a small bowl; stir in the olive oil, then season to taste with salt and pepper. Separate the skin around the breast and thighs from the meat. Rub the herb mixture onto the meat, underneath the skin. Cut the zested lemon in half, and place half of the lemon into the cavity of the chicken along with the whole garlic cloves. Place the chicken into a roasting pan, and squeeze the remaining lemon half evenly over the skin of the chicken. Bake the chicken in the preheated oven until no longer pink at the bone and the juices run clear, about 1 hour, 35 minutes. An instant-read thermometer inserted into the thickest part of the thigh, near the bone should read 180 degrees F (82 degrees C). Remove the chicken from the oven, cover with a doubled sheet of aluminum foil, and allow to rest in a warm area for 10 minutes before slicing. '
);
INSERT INTO Ingredients VALUES (
	63,
	'lemon, zested',
	1.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	63,
	'fresh rosemary, chopped',
	2.0,
	'sprig'
);
INSERT INTO Ingredients VALUES (
	63,
	'fresh thyme, chopped',
	3.0,
	'sprig'
);
INSERT INTO Ingredients VALUES (
	63,
	'garlic, minced',
	2.0,
	'clove'
);
INSERT INTO Ingredients VALUES (
	63,
	'olive oil',
	1.0,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	63,
	'sea salt and pepper to taste',
	1.0,
	'pinch'
);
INSERT INTO Ingredients VALUES (
	63,
	'whole chicken',
	1.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	63,
	'whole garlic cloves',
	4.0,
	'unit'
);



INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (
	'Balsamic Roasted Vegetable Salad',
	'http://allrecipes.com/Recipe/Balsamic-Roasted-Vegetable-Salad/Detail.aspx?event8=1&prop24=SR_Title&e11=roasted%20vegetables&e8=Quick%20Search&event10=1&soid=sr_results_p1i21',
	'http://images.media-allrecipes.com/userphotos/250x250/00/70/36/703682.jpg',
	'01:25:00',
	'Preheat oven to 400 degrees F (200 degrees C). Line a baking sheet with aluminum foil. Place potatoes into a microwave safe dish, and place into the microwave. Cook on High until the potatoes are just tender, 3 to 4 minutes. Place the potatoes into a large bowl along with the onion, bell pepper, garlic, and eggplant. Sprinkle with rosemary, thyme, and olive oil. Toss to coat the vegetables with olive oil, then season with salt to taste. Spread vegetables onto prepared baking sheet. Roast the vegetables in the preheated oven until they begin to brown at the edges, about 35 minutes. Stir in the cherry tomato halves, and continue cooking 15 minutes more. Toss the roasted vegetables in a large bowl with the pine nuts, spinach, and balsamic vinegar. '
);
INSERT INTO Ingredients VALUES (
	64,
	'new potatoes, halved',
	12.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	64,
	'red onions, each cut into 8 wedges',
	2.0,
	'large'
);
INSERT INTO Ingredients VALUES (
	64,
	'yellow bell peppers, seeded and cubed',
	2.0,
	'large'
);
INSERT INTO Ingredients VALUES (
	64,
	'garlic, peeled',
	4.0,
	'clove'
);
INSERT INTO Ingredients VALUES (
	64,
	'eggplant, thickly sliced',
	1.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	64,
	'chopped fresh rosemary',
	1.0,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	64,
	'chopped fresh thyme',
	2.0,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	64,
	'olive oil',
	2.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	64,
	'salt to taste',
	NULL,
	'unit'
);
INSERT INTO Ingredients VALUES (
	64,
	'cherry tomatoes, halved',
	1.0,
	'pint'
);
INSERT INTO Ingredients VALUES (
	64,
	'toasted pine nuts',
	0.33333334,
	'cup'
);
INSERT INTO Ingredients VALUES (
	64,
	'baby spinach leaves',
	1.0,
	'bag'
);
INSERT INTO Ingredients VALUES (
	64,
	'balsamic vinegar',
	2.0,
	'tablespoon'
);



INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (
	'Blueberry Salad',
	'http://allrecipes.com/Recipe/Blueberry-Salad/Detail.aspx?event8=1&prop24=SR_Title&e11=salad&e8=Quick%20Search&event10=1&soid=sr_results_p1i21',
	'http://images.media-allrecipes.com/userphotos/250x250/00/30/36/303657.jpg',
	'01:00:00',
	'Combine hot water and gelatin; stir until dissolved. Stir in pineapple and blueberry pie filling. Pour into a 9x13 inch dish and chill in refrigerator until firm. Cream together cream cheese and sugar. Beat in sour cream and vanilla. Spread over firm gelatin. Chill until serving. '
);
INSERT INTO Ingredients VALUES (
	65,
	'raspberry flavored Jell-O mix',
	2.0,
	'package'
);
INSERT INTO Ingredients VALUES (
	65,
	'hot water',
	2.0,
	'cup'
);
INSERT INTO Ingredients VALUES (
	65,
	'crushed pineapple, drained',
	1.0,
	'can'
);
INSERT INTO Ingredients VALUES (
	65,
	'blueberry pie filling',
	1.0,
	'can'
);
INSERT INTO Ingredients VALUES (
	65,
	'cream cheese',
	1.0,
	'package'
);
INSERT INTO Ingredients VALUES (
	65,
	'white sugar',
	0.5,
	'cup'
);
INSERT INTO Ingredients VALUES (
	65,
	'sour cream',
	1.0,
	'cup'
);
INSERT INTO Ingredients VALUES (
	65,
	'vanilla extract',
	1.0,
	'teaspoon'
);



INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (
	'Sambar - Spicy Indian Curry',
	'http://allrecipes.com/Recipe/Sambar---Spicy-Indian-Curry/Detail.aspx?event8=1&prop24=SR_Title&e11=sambar&e8=Quick%20Search&event10=1&soid=sr_results_p1i2',
	'http://images.media-allrecipes.com/images/44555.png',
	'00:55:00',
	'Place 2 cups water, cabbage, carrot, green beans, bell pepper, and yellow split peas in a pressure cooker; lock lid. Bring cooker up to pressure and cook until peas are tender, 6 to 8 minutes. If your pressure cooker does not have a quick-release function, reduce cooking times slightly as food will continue to cook while pressure releases slowly. Drain and reserve excess liquid; set vegetables aside. Mix ground coriander, sambar powder, chili powder, and 1/2 teaspoon water in a bowl to create a paste. Heat vegetable oil in a skillet over medium-high heat; cook and stir cumin seeds and mustard seeds until seeds sputter, about 1 minute; add asafoetida powder. Stir in the sambar paste; cook and stir until thickened, about 1 minute. Season with turmeric, and stir in vegetables. If vegetable mixture is too thick, stir in reserved cooking liquid. Mix cilantro, coconut, tamarind pulp, brown sugar, and salt into vegetable mixture. Simmer for 10 to 15 minutes more. '
);
INSERT INTO Ingredients VALUES (
	66,
	'water',
	2.0,
	'cup'
);
INSERT INTO Ingredients VALUES (
	66,
	'sliced cabbage',
	0.5,
	'cup'
);
INSERT INTO Ingredients VALUES (
	66,
	'sliced carrot',
	0.5,
	'cup'
);
INSERT INTO Ingredients VALUES (
	66,
	'fresh green beans, trimmed',
	0.5,
	'cup'
);
INSERT INTO Ingredients VALUES (
	66,
	'sliced green bell pepper',
	0.5,
	'cup'
);
INSERT INTO Ingredients VALUES (
	66,
	'yellow split peas (tuvar dal)',
	0.5,
	'cup'
);
INSERT INTO Ingredients VALUES (
	66,
	'ground coriander',
	1.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	66,
	'sambar powder',
	2.0,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	66,
	'chili powder',
	0.5,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	66,
	'water',
	0.5,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	66,
	'vegetable oil',
	1.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	66,
	'cumin seeds',
	1.0,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	66,
	'mustard seed',
	0.5,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	66,
	'asafoetida powder',
	1.0,
	'pinch'
);
INSERT INTO Ingredients VALUES (
	66,
	'ground turmeric',
	0.5,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	66,
	'chopped fresh cilantro',
	2.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	66,
	'fresh grated coconut',
	2.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	66,
	'tamarind pulp',
	2.0,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	66,
	'brown sugar',
	1.0,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	66,
	'salt to taste',
	NULL,
	'unit'
);



INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (
	'Spicy Sushi Dipping Sauce',
	'http://allrecipes.com/Recipe/Spicy-Sushi-Dipping-Sauce/Detail.aspx?event8=1&prop24=SR_Title&e11=sashimi&e8=Quick%20Search&event10=1&soid=sr_results_p1i10',
	'http://images.media-allrecipes.com/images/44555.png',
	'00:05:00',
	'Stir soy sauce, chile-garlic sauce, sesame oil, and garlic powder together in a small bowl; add lemon slice. '
);
INSERT INTO Ingredients VALUES (
	67,
	'soy sauce',
	2.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	67,
	'chile-garlic sauce (such as Sriracha)',
	0.5,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	67,
	'sesame oil',
	0.25,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	67,
	'garlic powder',
	1.0,
	'pinch'
);
INSERT INTO Ingredients VALUES (
	67,
	'lemon',
	1.0,
	'thin slice'
);



INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (
	'Scrambled Eggs a la Charlotte',
	'http://allrecipes.com/Recipe/Scrambled-Eggs-a-la-Charlotte/Detail.aspx?event8=1&prop24=SR_Title&e11=scrambled%20eggs&e8=Quick%20Search&event10=1&soid=sr_results_p1i21',
	'http://images.media-allrecipes.com/userphotos/250x250/02/29/16/2291629.jpg',
	'00:20:00',
	'Combine tomato, green bell pepper, onion, and tarragon in a large bowl. Whisk eggs, milk, salt, and black pepper in another bowl. Melt butter in a skillet over medium heat. Cook and stir egg mixture in hot butter until nearly set, about 2 minutes. Stir vegetable mixture into eggs; continue to cook and stir until eggs are set and vegetables begin to soften, about 3 minutes more. '
);
INSERT INTO Ingredients VALUES (
	68,
	'tomato, seeded and diced',
	1.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	68,
	'green bell pepper, diced',
	1.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	68,
	'onion, diced',
	1.0,
	'small'
);
INSERT INTO Ingredients VALUES (
	68,
	'dried tarragon',
	1.0,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	68,
	'eggs',
	6.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	68,
	'milk',
	0.25,
	'cup'
);
INSERT INTO Ingredients VALUES (
	68,
	'salt and ground black pepper to taste',
	NULL,
	'unit'
);
INSERT INTO Ingredients VALUES (
	68,
	'butter',
	2.0,
	'tablespoon'
);



INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (
	'Tequila Shrimp',
	'http://allrecipes.com/Recipe/Tequila-Shrimp/Detail.aspx?event8=1&prop24=SR_Title&e11=shrimp%20cocktail&e8=Quick%20Search&event10=1&soid=sr_results_p1i21',
	'http://images.media-allrecipes.com/userphotos/250x250/00/37/76/377618.jpg',
	'00:20:00',
	'Melt butter in a large skillet over medium heat. Saute garlic until light brown. Place shrimp in the pan, and cook for 3 minutes. Pour in tequila, and season with cilantro, salt, and pepper. Cook for 2 more minutes. '
);
INSERT INTO Ingredients VALUES (
	69,
	'unsalted butter',
	2.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	69,
	'garlic, chopped',
	4.0,
	'clove'
);
INSERT INTO Ingredients VALUES (
	69,
	'large shrimp - peeled and deveined',
	1.5,
	'pound'
);
INSERT INTO Ingredients VALUES (
	69,
	'tequila',
	0.5,
	'cup'
);
INSERT INTO Ingredients VALUES (
	69,
	'chopped fresh cilantro',
	0.5,
	'cup'
);
INSERT INTO Ingredients VALUES (
	69,
	'salt and pepper to taste',
	NULL,
	'unit'
);



INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (
	'Shrimp Scampi ala Norelllaura',
	'http://allrecipes.com/Recipe/Shrimp-Scampi-ala-Norelllaura/Detail.aspx?event8=1&prop24=SR_Title&e11=shrimp%20scampi&e8=Quick%20Search&event10=1&soid=sr_results_p1i21',
	'http://images.media-allrecipes.com/userphotos/250x250/02/00/66/2006630.jpg',
	'00:50:00',
	'Heat the olive oil in a large skillet over medium-low heat; cook and stir the garlic, bell pepper, and red pepper flakes in the oil about 20 minutes. Dredge the shrimp in the flour to coat, then shake off the excess. Raise heat to medium-high and stir in the shrimp and tomato; cook until the shrimp is pink, 3 to 5 minutes. Add the lemon juice, wine, and butter; continue cooking until the sauce thickens, about 5 minutes more. Garnish with parsley to serve. '
);
INSERT INTO Ingredients VALUES (
	70,
	'extra virgin olive oil',
	0.33333334,
	'cup'
);
INSERT INTO Ingredients VALUES (
	70,
	'garlic, minced',
	3.0,
	'clove'
);
INSERT INTO Ingredients VALUES (
	70,
	'diced red bell pepper',
	0.25,
	'cup'
);
INSERT INTO Ingredients VALUES (
	70,
	'red pepper flakes',
	1.0,
	'pinch'
);
INSERT INTO Ingredients VALUES (
	70,
	'peeled and deveined large shrimp',
	1.0,
	'pound'
);
INSERT INTO Ingredients VALUES (
	70,
	'flour for dredging',
	1.0,
	'cup'
);
INSERT INTO Ingredients VALUES (
	70,
	'tomato, diced',
	1.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	70,
	'fresh lemon juice',
	2.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	70,
	'dry white wine',
	0.6666667,
	'cup'
);
INSERT INTO Ingredients VALUES (
	70,
	'butter',
	3.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	70,
	'chopped fresh parsley',
	1.0,
	'tablespoon'
);



INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (
	'Spaghetti with a Twist',
	'http://allrecipes.com/Recipe/Spaghetti-with-a-Twist/Detail.aspx?event8=1&prop24=SR_Title&e11=spaghetti&e8=Quick%20Search&event10=1&soid=sr_results_p1i21',
	'http://images.media-allrecipes.com/userphotos/250x250/01/95/16/1951611.jpg',
	'00:00:00',
	'In a large pot with boiling salted water cook spaghetti until al dente. Drain well. Meanwhile, in a large skillet cook the garlic until brown, add one bouillon cube and one cup of water and stir until bouillon cube is dissolved. Once dissolved, add 3 dashes of soy sauce. In a covered container add one half of the sauce to the drained and cooked spaghetti. Add salt and pepper and shake container vigorously. If desired, add more of the sauce to taste. Allow mixture to stand to intensify flavors. Serve. '
);
INSERT INTO Ingredients VALUES (
	71,
	'spaghetti',
	1.0,
	'pound'
);
INSERT INTO Ingredients VALUES (
	71,
	'garlic, minced',
	3.0,
	'clove'
);
INSERT INTO Ingredients VALUES (
	71,
	'beef bouillon',
	1.0,
	'cube'
);
INSERT INTO Ingredients VALUES (
	71,
	'water',
	1.0,
	'cup'
);
INSERT INTO Ingredients VALUES (
	71,
	'soy sauce',
	3.0,
	'dashe'
);
INSERT INTO Ingredients VALUES (
	71,
	'salt to taste',
	NULL,
	'unit'
);
INSERT INTO Ingredients VALUES (
	71,
	'ground black pepper to taste',
	NULL,
	'unit'
);



INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (
	'Rosemary Steak',
	'http://allrecipes.com/Recipe/Rosemary-Steak/Detail.aspx?event8=1&prop24=SR_Title&e11=steak&e8=Quick%20Search&event10=1&soid=sr_results_p1i21',
	'http://images.media-allrecipes.com/userphotos/250x250/00/16/21/162154.jpg',
	'03:16:00',
	'Combine the red wine, salt and rosemary in a small bowl. Let stand at room temperature for 2 to 3 hours. Heat a large griddle or cast-iron skillet over high heat. Place the steaks on the hot pan, and cook for about 8 minutes per side, or to desired degree of doneness. The internal temperature should be at least 145 degrees F (62 degrees C) for medium rare. Pour in the wine mixture, and allow it to boil for a minute. Serve steaks with sauce on a deep platter. '
);
INSERT INTO Ingredients VALUES (
	72,
	'red wine',
	1.0,
	'cup'
);
INSERT INTO Ingredients VALUES (
	72,
	'salt',
	1.0,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	72,
	'fresh rosemary',
	1.0,
	'sprig'
);
INSERT INTO Ingredients VALUES (
	72,
	'New York strip steaks, cut 1-inch thick',
	4.0,
	'unit'
);



INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (
	'Not-So-Corny Tamale Pie',
	'http://allrecipes.com/Recipe/Not-So-Corny-Tamale-Pie/Detail.aspx?event8=1&prop24=SR_Title&e11=tamales&e8=Quick%20Search&event10=1&soid=sr_results_p1i21',
	'http://images.media-allrecipes.com/images/44555.png',
	'00:40:00',
	'Preheat oven to 400 degrees F (200 degrees C). Heat oil in a cast-iron skillet over medium-high heat; saute onion until lightly browned, 5 to 10 minutes. Add ground beef; cook and stir until beef is browned and crumbly, 5 to 10 minutes. Mix pinto beans and black beans into beef mixture. Sprinkle Mexican cheese blend over beef-bean mixture; stir. Mix diced tomatoes with green chile peppers into beef-bean mixture. Mix corn bread mix, milk, and eggs together in a bowl until batter is smooth. Spread batter over top of beef-bean mixture. Bake in the preheated oven until a toothpick inserted in the center of the cornbread comes out clean, 15 to 20 minutes. '
);
INSERT INTO Ingredients VALUES (
	73,
	'vegetable oil, or as needed',
	2.0,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	73,
	'onion, chopped',
	1.0,
	'small'
);
INSERT INTO Ingredients VALUES (
	73,
	'ground beef',
	1.5,
	'pound'
);
INSERT INTO Ingredients VALUES (
	73,
	'pinto beans, rinsed and drained',
	1.0,
	'can'
);
INSERT INTO Ingredients VALUES (
	73,
	'black beans, rinsed and drained',
	1.0,
	'can'
);
INSERT INTO Ingredients VALUES (
	73,
	'shredded Mexican cheese blend',
	0.5,
	'cup'
);
INSERT INTO Ingredients VALUES (
	73,
	'diced tomatoes with green chile peppers (such as RO*TEL)',
	1.0,
	'can'
);
INSERT INTO Ingredients VALUES (
	73,
	'corn bread mix (such as Jiffy)',
	2.0,
	'package'
);
INSERT INTO Ingredients VALUES (
	73,
	'milk',
	0.6666667,
	'cup'
);
INSERT INTO Ingredients VALUES (
	73,
	'eggs',
	2.0,
	'unit'
);



INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (
	'Tofu with Pork and Cashews',
	'http://allrecipes.com/Recipe/Tofu-with-Pork-and-Cashews/Detail.aspx?event8=1&prop24=SR_Title&e11=tofu%20stir%20fry&e8=Quick%20Search&event10=1&soid=sr_results_p1i21',
	'http://images.media-allrecipes.com/userphotos/250x250/00/00/95/9573.jpg',
	'00:40:00',
	'Place tofu slices on several layers of paper towels, cover with additional paper towels, and place a dinner plate on top. Let stand 30 minutes. Then cut tofu into 1/2 inch cubes. In a small bowl, whisk together broth, cornstarch, soy sauce, oyster sauce, and chili garlic sauce. Warm oil in a large skillet over medium-high heat. Stir in pork, and cook 2 minutes, stirring constantly. Stir in ginger and garlic. Then stir in tofu, and cook until golden, about 4 minutes. Stir in broth mixture, bring to a boil; simmer until mixture thickens, about 1 minute. Remove from heat. Serve over cooked rice garnished with green onions and cashews. '
);
INSERT INTO Ingredients VALUES (
	74,
	'firm tofu, cut into 6 slices',
	1.0,
	'package'
);
INSERT INTO Ingredients VALUES (
	74,
	'chicken broth',
	0.5,
	'cup'
);
INSERT INTO Ingredients VALUES (
	74,
	'cornstarch',
	1.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	74,
	'soy sauce',
	2.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	74,
	'oyster sauce',
	1.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	74,
	'chili garlic sauce',
	2.0,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	74,
	'vegetable oil',
	2.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	74,
	'boneless pork loin chops, cut into bite sized pieces',
	2.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	74,
	'minced fresh ginger',
	1.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	74,
	'minced garlic',
	1.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	74,
	'cooked brown rice',
	2.0,
	'cup'
);
INSERT INTO Ingredients VALUES (
	74,
	'chopped green onions',
	0.33333334,
	'cup'
);
INSERT INTO Ingredients VALUES (
	74,
	'cashews',
	0.33333334,
	'cup'
);



INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (
	'Rosemary Tomato Leek Soup',
	'http://allrecipes.com/Recipe/Rosemary-Tomato-Leek-Soup/Detail.aspx?event8=1&prop24=SR_Title&e11=tomato%20soup&e8=Quick%20Search&event10=1&soid=sr_results_p1i21',
	'http://images.media-allrecipes.com/userphotos/250x250/01/05/81/1058183.jpg',
	'01:30:00',
	'Melt butter in a large saucepan over medium heat; cook and stir leek, rosemary, and garlic until leek is tender and translucent, about 15 minutes. Add diced tomatoes and cayenne pepper; bring to a simmer. Add minced basil; continue simmering until soup is reduced by half, about 1 hour. Remove half of the soup and puree in a blender until smooth. Return pureed soup to the saucepan. Stir in cream to desired consistency. Season to taste with salt and ground black pepper. '
);
INSERT INTO Ingredients VALUES (
	75,
	'butter',
	0.25,
	'cup'
);
INSERT INTO Ingredients VALUES (
	75,
	'leek - cut lengthwise, washed, trimmed, and thinly sliced',
	1.0,
	'large'
);
INSERT INTO Ingredients VALUES (
	75,
	'fresh rosemary, leaves stripped',
	3.0,
	'sprig'
);
INSERT INTO Ingredients VALUES (
	75,
	'minced garlic',
	2.0,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	75,
	'diced tomatoes',
	4.0,
	'can'
);
INSERT INTO Ingredients VALUES (
	75,
	'cayenne pepper',
	0.25,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	75,
	'basil, minced',
	10.0,
	'leave'
);
INSERT INTO Ingredients VALUES (
	75,
	'heavy whipping cream, or as needed',
	NULL,
	'unit'
);
INSERT INTO Ingredients VALUES (
	75,
	'salt and ground black pepper to taste',
	NULL,
	'unit'
);



INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (
	'Easy Chicken Salad',
	'http://allrecipes.com/Recipe/Easy-Chicken-Salad/Detail.aspx?event8=1&prop24=SR_Title&e11=tostadas&e8=Quick%20Search&event10=1&soid=sr_results_p1i21',
	'http://images.media-allrecipes.com/userphotos/250x250/01/82/04/1820456.jpg',
	'00:00:00',
	'Combine the chicken, vegetables, corn, scallions, mayonnaise, mustard, salt and pepper. Mix well. Ready to serve! '
);
INSERT INTO Ingredients VALUES (
	76,
	'skinless, boneless chicken breast halves - boiled',
	6.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	76,
	'mixed vegetables, drained',
	1.0,
	'can'
);
INSERT INTO Ingredients VALUES (
	76,
	'sweet corn',
	1.0,
	'can'
);
INSERT INTO Ingredients VALUES (
	76,
	'green onions, chopped',
	1.0,
	'bunch'
);
INSERT INTO Ingredients VALUES (
	76,
	'mayonnaise',
	0.5,
	'cup'
);
INSERT INTO Ingredients VALUES (
	76,
	'prepared mustard',
	1.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	76,
	'salt and pepper to taste',
	NULL,
	'unit'
);



INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (
	'Char Siu Pork',
	'http://allrecipes.com/Recipe/Char-Siu-Pork/Detail.aspx?event8=1&prop24=SR_Title&e11=udon&e8=Quick%20Search&event10=1&soid=sr_results_p1i11',
	'http://images.media-allrecipes.com/userphotos/250x250/00/97/44/974452.jpg',
	'05:00:00',
	'Combine honey, hoisin sauce, dark soy sauce, star anise, five-spice powder, and aji mirin in a glass measuring cup. Set microwave oven for 60 percent power and heat in microwave oven for 22 seconds. Stir mixture and pour into a large resealable plastic bag. Add pork loin to the bag, knead to coat meat with marinade, and refrigerate at least 4 hours or up to two days. Preheat grill for medium heat and lightly oil the grate. Remove pork roast from bag and wrap meat tightly in aluminum foil. Discard used marinade. Cook on the preheated grill until an instant-read meat thermometer inserted into the thickest part of the roast reads 155 degrees F (70 degrees C), about 50 minutes. Let meat stand for 10 minutes before slicing. '
);
INSERT INTO Ingredients VALUES (
	77,
	'honey',
	2.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	77,
	'hoisin sauce',
	2.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	77,
	'dark soy sauce',
	2.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	77,
	'whole star anise pod, crushed',
	1.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	77,
	'Chinese five-spice powder',
	1.0,
	'pinch'
);
INSERT INTO Ingredients VALUES (
	77,
	'aji mirin (sweet rice cooking wine), or more to taste',
	1.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	77,
	'boneless pork loin roast',
	1.0,
	'unit'
);



INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (
	'Fabulous Wet Burritos',
	'http://allrecipes.com/Recipe/Fabulous-Wet-Burritos/Detail.aspx?event8=1&prop24=SR_Title&e11=wet%20burrito&e8=Quick%20Search&event10=1&soid=sr_results_p1i2',
	'http://images.media-allrecipes.com/userphotos/250x250/00/61/60/616032.jpg',
	'00:45:00',
	'Crumble ground beef into a skillet over medium-high heat. Cook and stir until evenly browned. Add onion, and cook until translucent. Drain grease, and season with garlic, cumin, salt and pepper. Stir in the green chilies and refried beans until well blended. Turn off heat, but keep warm. In a saucepan, combine the chili without beans, tomato soup and enchilada sauce. Mix well, and cook over medium heat until heated through. Turn off heat and keep warm. Place a warmed tortilla on a plate, and spoon a generous 1/2 cup of the ground beef mixture onto the center. Top with lettuce and tomato to your liking. Roll up tortilla over the filling. Spoon a generous amount of the sauce over the top, and sprinkle with cheese and green onions. Heat in the microwave for 30 seconds, or until cheese is melted. Repeat with remaining tortillas. '
);
INSERT INTO Ingredients VALUES (
	78,
	'ground beef',
	1.0,
	'pound'
);
INSERT INTO Ingredients VALUES (
	78,
	'chopped onion',
	0.5,
	'cup'
);
INSERT INTO Ingredients VALUES (
	78,
	'garlic, minced',
	1.0,
	'clove'
);
INSERT INTO Ingredients VALUES (
	78,
	'cumin',
	0.5,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	78,
	'salt',
	0.25,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	78,
	'pepper',
	0.125,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	78,
	'diced green chile peppers',
	1.0,
	'can'
);
INSERT INTO Ingredients VALUES (
	78,
	'refried beans',
	1.0,
	'can'
);
INSERT INTO Ingredients VALUES (
	78,
	'chili without beans',
	1.0,
	'can'
);
INSERT INTO Ingredients VALUES (
	78,
	'condensed tomato soup',
	1.0,
	'can'
);
INSERT INTO Ingredients VALUES (
	78,
	'enchilada sauce',
	1.0,
	'can'
);
INSERT INTO Ingredients VALUES (
	78,
	'flour tortillas, warmed',
	6.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	78,
	'shredded lettuce',
	2.0,
	'cup'
);
INSERT INTO Ingredients VALUES (
	78,
	'chopped tomatoes',
	1.0,
	'cup'
);
INSERT INTO Ingredients VALUES (
	78,
	'shredded Mexican blend cheese',
	2.0,
	'cup'
);
INSERT INTO Ingredients VALUES (
	78,
	'chopped green onions',
	0.5,
	'cup'
);



INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (
	'Okonomiyaki',
	'http://allrecipes.com/Recipe/Okonomiyaki/Detail.aspx?event8=1&prop24=SR_Title&e11=yakisoba&e8=Quick%20Search&event10=1&soid=sr_results_p1i4',
	'http://images.media-allrecipes.com/userphotos/250x250/00/35/35/353534.jpg',
	'00:27:00',
	'In a large bowl, mix chicken, cabbage, carrots, green onions, green beans, green bell pepper and zucchini. In a separate bowl, beat together eggs, flour, chicken stock and soy sauce. Pour batter over chicken mixture and toss to thoroughly coat. Mix vegetable oil and sesame oil in a skillet over medium heat. Scoop about 1/4 cup batter into skillet, enough to make a 2 1/2 inch circle. Cover and cook 4 minutes, or until bottom is golden brown. Flip and continue cooking 4 minutes, or until cooked through. Drain on paper towels. '
);
INSERT INTO Ingredients VALUES (
	79,
	'chopped cooked chicken',
	1.0,
	'cup'
);
INSERT INTO Ingredients VALUES (
	79,
	'thinly sliced napa cabbage',
	1.5,
	'cup'
);
INSERT INTO Ingredients VALUES (
	79,
	'shredded carrots',
	0.25,
	'cup'
);
INSERT INTO Ingredients VALUES (
	79,
	'green onions, chopped',
	3.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	79,
	'fresh green beans, cut into 1/2 inch pieces',
	12.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	79,
	'green bell pepper, cut into thin strips',
	1.0,
	'small'
);
INSERT INTO Ingredients VALUES (
	79,
	'zucchini, cut into thin strips',
	1.0,
	'small'
);
INSERT INTO Ingredients VALUES (
	79,
	'eggs, lightly beaten',
	3.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	79,
	'all-purpose flour',
	0.75,
	'cup'
);
INSERT INTO Ingredients VALUES (
	79,
	'chicken stock',
	0.75,
	'cup'
);
INSERT INTO Ingredients VALUES (
	79,
	'soy sauce',
	2.0,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	79,
	'vegetable oil',
	1.0,
	'teaspoon'
);
INSERT INTO Ingredients VALUES (
	79,
	'toasted sesame oil',
	0.25,
	'teaspoon'
);



INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (
	'Roasted Zucchini Casserole',
	'http://allrecipes.com/Recipe/Roasted-Zucchini-Casserole/Detail.aspx?event8=1&prop24=SR_Title&e11=zucchini%20casserole&e8=Quick%20Search&event10=1&soid=sr_results_p1i21',
	'http://images.media-allrecipes.com/userphotos/250x250/01/63/22/1632211.jpg',
	'01:40:00',
	'Preheat oven to 400 degrees F (200 degrees C). Toss zucchinis and onions in a large bowl with olive oil until evenly coated. Spread vegetables into a large baking dish. Roast vegetables in the preheated oven until golden, about 30 minutes. Season with salt and pepper. Reduce oven heat to 350 degrees F (175 degrees C). Fill a large pot with lightly salted water and bring to a boil. Stir in penne and return to a boil. Cook pasta uncovered, stirring occasionally, until cooked through but still firm to the bite, about 11 minutes; drain. Lightly grease a 9x13-inch baking dish. Heat marinara sauce in a saucepan over medium heat until sauce is hot. Spread hot marinara sauce into the prepared baking dish, followed by penne pasta and zucchini mixture. Sprinkle Parmesan cheese atop vegetables. Bake in the preheated oven until sauce is bubbly, 35 to 40 minutes. Allow casserole to rest for 5 minutes before serving. '
);
INSERT INTO Ingredients VALUES (
	80,
	'zucchinis, sliced',
	3.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	80,
	'onions, sliced',
	2.0,
	'unit'
);
INSERT INTO Ingredients VALUES (
	80,
	'olive oil',
	3.0,
	'tablespoon'
);
INSERT INTO Ingredients VALUES (
	80,
	'salt and ground black pepper to taste',
	NULL,
	'unit'
);
INSERT INTO Ingredients VALUES (
	80,
	'penne pasta',
	1.0,
	'package'
);
INSERT INTO Ingredients VALUES (
	80,
	'marinara sauce',
	1.0,
	'jar'
);
INSERT INTO Ingredients VALUES (
	80,
	'grated Parmesan cheese',
	0.5,
	'cup'
);




