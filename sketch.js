var happeningTime = 760320;
var noiseScale = 0.02;
var debate; 

var balloon1;
var balloon2;
var balloon3;
var balloon4;
var balloon5;
var notBalloon;
var savedTime;
var passedTime;
var printTime;
var timer = "Timer:";

function setup(){
	createCanvas(400,400,100);
	balloon1 = new Balloon();
	balloon2 = new Balloon();
	balloon3 = new Balloon();
	balloon4 = new Balloon();
	balloon5 = new Balloon();
	notBalloon = new Balloon();

	//textFont(fontRegular);

	savedTime = millis();

	debate = round(random(0,1));
	boolean(debate);
	console.log(boolean(debate));
}

function draw(){
	background(255);
	balloon1.move_S();
	balloon1.display_R();
	balloon2.move_N();
	balloon2.display_B();
	balloon3.move_E();
	balloon3.display_O();
	balloon4.move_W();
	balloon4.display_Y();
	balloon5.move_NW();
	balloon5.display_G();
	notBalloon.textDisplay();

	passedTime = millis() - savedTime;
	//console.log(passedTime);
	printTime = round(passedTime);
	
	title();
	textCaption();
	textSize(12);
	text(timer, 10,10,60,30);

	text(printTime, 50,10,60,30);
	fill(0,0,0);

	//console.log(passedTime);
	}

//Balloon Class
function Balloon(){
	this.x = random(width/2);
	this.y = random(1,10);
	this.x_N = random(width/2);
	this.y_N = height-10;
	this.x_E = random(1,10);
	this.y_E = height/2-random(5,10);
	this.x_W = width-20;
	this.y_W = height/2+10;
	this.x_NW = width-10;
	this.y_NW = height-10;

	this.diameter = 20;
	this.speed = 0;
	this.gravity = 0.01;
	this.x2 = 0.75;
	this.bloat = 0.1;

	var theta=1;
	var theta_vel = 0;
	var theta_acc = 0.0001;
	var h = random(0,360);
	var r = height*0.45;

	var s3 = "We decided on what to eat and I start by saying I feel bloated.";
	var s4 = "Julia decides not to hear what I have to tell her about our mom.";
	var s5 = "Julia decides to hear what I have to tell her about our mom. We start debating about our family.";
	var s6 = "Julia is slightly embarrassed by the balloons. They are hitting her head.";
	var s7 = "Strangers think it's her birthday and give her high 5s.";
	var s8 = "How embarrassing.";
	//console.log(this.debate);

	this.textDisplay = function(){

		//CHANGING TEXT IS HERE

			if(passedTime > happeningTime/29 && passedTime < happeningTime/ 26 && boolean(debate)===true){
				textSize(12);
				fill(50);
				text(s5, width/2, height-150, 150, 150);
				console.log("text shows");
			}

			if(passedTime > happeningTime/26 && passedTime < happeningTime/23 && boolean(debate)===false){
				textSize(12);
				fill(50);
				text(s4, width/2, height-150, 150, 150);
			}

			if(passedTime > happeningTime/23 && passedTime < happeningTime/20 && boolean(debate)===true){
				textSize(12);
				fill(50);
				text(s6, width/2, height-150, 150, 150);
			}

			if(passedTime > happeningTime/17 && passedTime < happeningTime/14 && boolean(debate)===true){
				textSize(12);
				fill(50);
				text(s7, width/2, height-150, 150, 150);
			}
			if(passedTime > happeningTime/14 && passedTime < happeningTime/11 && boolean(debate)===true){
				textSize(12);
				fill(50);
				text(s8, width/2, height-150, 150, 150);
			}
	};

	this.move_NW = function(){
		this.x_NW -= this.speed;
		this.y_NW -= this.speed;
		this.speed += this.gravity;

		if(this.y_NW < height/2 || this.x_NW < width/2){
			this.speed *= -this.x2;
			this.x2 += 0.01*this.gravity;
		}

		if(passedTime > happeningTime/30){
			this.diameter += this.bloat;
		}

		if(this.diameter > 50){
			this.diameter *= -1;
		}

		if(passedTime > happeningTime/15 && boolean(debate)===true){
			frameRate(30);
			//translate(width/2, height/2);
			this.x_NW = r*cos(theta)+width/2;
			this.y_NW = r*sin(theta)+height/2;

			theta_vel += theta_acc;
			theta += theta_vel;

			//console.log("#1 NW going in circles");
		}

		if(passedTime > happeningTime/2 && boolean(debate) === true){
			noStroke();
			frameRate(30);
			this.x_NW = 300;
			this.y_NW += this.speed;
			this.speed += this.gravity;
				if(this.y > height){
						this.speed = this.speed * -0.95;
						console.log("slowing down");
				}
		}
		//console.log(this.diameter);
	};

	this.move_W = function(){
		this.x_W -= this.speed;
		this.speed += this.gravity;

		if(this.x_W < width/2+5){
			this.speed *= -this.x2;
			this.x2 += 0.01*this.gravity;
		}

		if(passedTime > happeningTime/45){
			this.diameter += this.bloat;
		}


		if(passedTime > happeningTime/45 && passedTime < happeningTime/30){
			this.diameter += this.bloat;

			textSize(12);
			fill(50);
			text(s3, width/2, height-150, 150, 150);
		}

		if(this.diameter > 50){
			this.diameter *= -1;
		}

		if(passedTime > happeningTime/17 && boolean(debate)===true){
			frameRate(30);
			//translate(width/2, height/2);
			this.x_W = r*cos(theta)+width/2;
			this.y_W = r*sin(theta)+height/2;

			theta_vel += theta_acc;
			theta += theta_vel;

			//console.log("#2 W going in circles");
		}
		if(passedTime > happeningTime/3 && boolean(debate) === true){
			noStroke();
			frameRate(30);
			this.x_W = 250;
			this.y_W += this.speed;
			this.speed += this.gravity;
				if(this.y > height){
						this.speed = this.speed * -0.95;
						console.log("slowing down");
				}
		}

	};

	this.move_E = function(){
		this.x_E += this.speed;
		this.speed += this.gravity;

		if(this.x_E > width/2 - 10){
			this.speed *= -this.x2;
			this.x2 += 0.01*this.gravity;
		}

		if(passedTime > happeningTime/25){
			this.diameter += this.bloat;
		}

		if(this.diameter > 50){
			this.diameter *= -1;
		}

		if(passedTime > happeningTime/19 && boolean(debate)===true){
			frameRate(30);
			//translate(width/2, height/2);
			this.x_E = r*cos(theta)+width/2;
			this.y_E = r*sin(theta)+height/2;

			theta_vel += theta_acc;
			theta += theta_vel;

			//console.log("#3 E going in circles");
		}

		if(passedTime > happeningTime/4 && boolean(debate) === true){
			noStroke();
			frameRate(30);
			this.x_E = 100;
			this.y_E += this.speed;
			this.speed += this.gravity;
				if(this.y > height){
						this.speed = this.speed * -0.95;
						console.log("slowing down");
				}
		}

	};

	this.move_S = function(){
		this.x += this.speed;
		this.y += this.speed;

		this.speed += this.gravity;

		if(this.y > height/2 - 10) {
			this.speed *= -this.x2;
			this.x2 += 0.01*this.gravity;
		}

		if(passedTime > happeningTime/40){
			this.diameter += this.bloat;
		}

		if(this.diameter > 50){
			this.diameter *= -1;
		}

		if(passedTime > happeningTime/21 && boolean(debate)===true){
			frameRate(30);
			//translate(width/2, height/2);
			this.x = r*cos(theta)+width/2;
			this.y = r*sin(theta)+height/2;

			theta_vel += theta_acc;
			theta += theta_vel;

			//console.log("#4 S going in circles");
		}

		if(passedTime > happeningTime/5 && boolean(debate) === true){
			noStroke();
			frameRate(30);
			this.x = 400;
			this.y += this.speed;
			this.speed += this.gravity;
				if(this.y > height){
						this.speed = this.speed * -0.95;
						console.log("slowing down");
				}
			}
	};

	this.move_N = function(){
		this.x_N += this.speed;
		this.y_N -= this.speed;

		this.speed += this.gravity;

		if(this.y_N < height/2) {
			this.speed *= -this.x2;
			this.x2 += 0.01*this.gravity;
		}

		if(passedTime > happeningTime/35){
			this.diameter += this.bloat;
		}

		if(this.diameter > 50){
			this.diameter *= -1;
		}

		if(passedTime > happeningTime/23 && boolean(debate)===true){
			frameRate(30);
			//translate(width/2, height/2);
			this.x_N = r*cos(theta)+width/2;
			this.y_N = r*sin(theta)+height/2;

			theta_vel += theta_acc;
			theta += theta_vel;

			//console.log("#5 N going in circles");
		}

		if(passedTime > happeningTime/2 && boolean(debate) === true){
			noStroke();
			frameRate(30);
			this.x_N = 150;
			this.y_N += this.speed;
			this.speed += this.gravity;
				if(this.y > height){
						this.speed = this.speed * -0.95;
						console.log("slowing down");
				}
		}
	};

////CHANGING COLORS////

	this.display_Y = function(){
		noStroke();
		fill('rgba(255,225,100,0.5)');
		
	
		if(passedTime > happeningTime/27 && boolean(debate) === true){
			
			for(var x=0; x<width; x++){
				fill(h, 90, 90);
				this.diameter = 20;
				h = (h+1)%360;
				frameRate(10);
			}
		}

		if(passedTime > happeningTime/14 && boolean(debate) === true){
				noStroke();
				fill('rgba(255,255,100,0.5)');
		}

		ellipse(this.x_W, this.y_W, this.diameter, this.diameter);
	};

	this.display_R = function(){
		noStroke();
		fill('rgba(255,0,100,0.5)');

		if(passedTime > happeningTime/28 && boolean(debate) === true){
				
				for(var x=0; x<width; x++){
				fill(90, h, 90);
				this.diameter = 20;
				h = (h+1)%360;
				frameRate(10);
			}

		if(passedTime > happeningTime/15 && boolean(debate) === true){
					noStroke();
					fill('rgba(255,0,100,0.5)');
					console.log("going to drop");
			}
		}

		ellipse(this.x, this.y, this.diameter, this.diameter);
	};
	
	this.display_B = function(){
		noStroke();
		fill('rgba(50,0,255,0.5)');

		if(passedTime > happeningTime/29 && boolean(debate)===true){
				
				for(var x=0; x<width; x++){
				fill(200, 200, h);
				this.diameter = 20;
				h = (h+1)%360;
				frameRate(10);
			}
		}

		if(passedTime > happeningTime/13 && boolean(debate) === true){
			noStroke();
			fill('rgba(50,0,255,0.5)');
		}

		ellipse(this.x_N, this.y_N, this.diameter, this.diameter); 
	};

	this.display_O = function(){
		noStroke();
		fill('rgba(255,160,0,0.5)');

		if(passedTime > happeningTime/30 && boolean(debate) === true){
				
				for(var x=0; x<width; x++){
				fill(h, 200, 200);
				this.diameter = 20;
				h = (h+1)%360;
				frameRate(10);
			}
		}

		if(passedTime > happeningTime/13 && boolean(debate) === true){
			noStroke();
			fill('rgba(255,160,0,0.5)');
		}

		ellipse(this.x_E, this.y_E, this.diameter, this.diameter);
	};

	this.display_G = function(){
		noStroke();
		fill('rgba(0,255,50,0.5)');
	
		if(passedTime > happeningTime/31 && boolean(debate)===true){
				for(var x=0; x<width; x++){
				fill(200, h, 200);
				this.diameter = 20;
				h = (h+1)%360;
				frameRate(10);
			}
		}

		if(passedTime > happeningTime/13 && boolean(debate) === true){
			noStroke();
			fill('rgba(0,255,50,0.5)');
		}	

		ellipse(this.x_NW, this.y_NW, this.diameter, this.diameter);
	};
}

function textCaption(x,y){

	var s1 = "on July 3, 2015";
	var s2 = "from 12:16AM to 12:46AM";
	var s3 = "we meet at Spring and Bowery";
	var interval = 2000;
	var time = millis();

	if(passedTime > happeningTime/90){

			textSize(12);
			fill(50);
			text(s1, width/2, height-25);

			//console.log("90");

			};

	if(passedTime > happeningTime/80){

			textSize(12);
			fill(50);
			text(s2, width/2, height-40);

			//console.log("80");

			};

	if(passedTime > happeningTime/70 ){

			textSize(12);
			fill(50);
			text(s3, width/2, height-55);

			//console.log("70");

			};

}


function title(){
	var title ="Happening with Julia"
			textSize(24);
			fill(50);
			text(title, width/2, 10,150,150);

}
/*
function preload (){
	fontRegular = loadFont("assets/AkzidenzGroteskStd-Md.otf");
}
*/