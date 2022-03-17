let humanScore = 0;
let computerScore = 0;
let currentRoundNumber = 1;

// Write your code below:

const generateTarget = () => {
  Math.floor(Math.random() * 10);
}

const compareGuesses = (humanGuess, computerGuess, secretTarget) => {
  if(humanGuess === generateTarget()){
    return true;
  }else if(computerGuess === generateTarget()){
    return false;
  }
  else if(humanGuess === computerGuess){
    return true;
  }
}

const updateScore = winner => {
  if(winner === 'human'){
    humanScore++;
  }else if(winner === 'computer'){
    computerScore++
  } 
}

const advanceRound = () => {
  currentRoundNumber++;
}

console.log(generateTarget())

