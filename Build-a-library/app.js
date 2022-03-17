class Media {
  constructor(title){
    this._title = title;
    this._isCheckedOut = false;
    this._ratings = [];
  }
  // Getters and Setters for each property in the parent class
  get title(){
    return this._title;
  }
  get isCheckedOut(){
    return this._isCheckedOut;
  }
  get ratings(){
    return this._ratings;
  }

  // Changes checkout status to true or false based on its current status
  toggleCheckOutStatus(){
    if(this._isCheckedOut === false){
      this._isCheckedOut = true;
    }else{
      this._isCheckedOut = true;
    }
      
  }
  // This method gets the average rating of an instance of a class
  getAverageRating(){
    let ratingsSum = this._ratings.reduce((currentSum, rating) => currentSum + rating, 0);
    const ratingLenght = this._ratings.length;
    return ratingsSum/ ratingLenght;
  }

  addRating(rating){
    this._ratings.push(rating);
  }



  set isCheckedOut(isCheckOut){
    this._isCheckedOut = isCheckOut;
  }
}

// The Book Class

class Book extends Media{
  constructor(author, title, pages){
    super(title);
    this._author = author;
    this._pages = pages;
  }
  get author(){
    return this._author;
  }
  get pages(){
    return this._pages;
  }

}

// The Book Class
class Movie extends Media{
  constructor(director, title, runTime){
    super(title);
    this._director = director;
    this._runTime = runTime;
  }

  get director(){
    return this._director;
  }
  get runTime(){
    return this._runtime;
  }
}
// An instance of the book class
const historyOfEverything = new Book('Bill Bryson', 'A Short History of Nearly Everything', 544);
historyOfEverything.toggleCheckOutStatus();
console.log(historyOfEverything.isCheckedOut); //should return true


historyOfEverything.addRating(4);
historyOfEverything.addRating(5);
historyOfEverything.addRating(5);

// average rating for historyOfEverything object
let averageRating = historyOfEverything.getAverageRating();

console.log(averageRating);

// A movie instance
const speed = new Movie('Jan de Bont', 'Speed', 116);
speed.toggleCheckOutStatus(); // should return true
console.log(speed.isCheckedOut)

speed.addRating(1);
speed.addRating(1);
speed.addRating(5);

let speedAverageRating = speed.getAverageRating();
console.log(speedAverageRating);













