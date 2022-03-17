// Returns a random DNA base
const returnRandBase = () => {
  const dnaBases = ['A', 'T', 'C', 'G']
  return dnaBases[Math.floor(Math.random() * 4)] 
}

// Returns a random single stand of DNA containing 15 bases
const mockUpStrand = () => {
  const newStrand = []
  for (let i = 0; i < 15; i++) {
    newStrand.push(returnRandBase())
  }
  return newStrand
}

const pAequorFactory = (number, dnaBases)=>{
  return{
    _specNumber: number,
    _dna:dnaBases,

    mutate(){
      let currentbase = Math.floor(Math.random() * this._dna.lenth);
      let withoutA = ['T', 'C', 'G'];
      let withoutT = ['A', 'C', 'G'];
      let withoutC = ['T', 'A', 'G'];
      let withoutG = ['T', 'C', 'A'];

      if(this._dna[currentbase] === 'A'){
        this._dna[currentbase] = withoutA[Math.floor(Math.random()*withoutA.length)];
      }else if(this._dna[currentbase] === 'T'){
        this._dna[currentbase] = withoutT[Math.floor(Math.random()*withoutT.length)];
      }else if(this._dna[currentbase] === 'C'){
         this._dna[currentbase] = withoutC[Math.floor(Math.random()*withoutC.length)];
      }else if(this._dna[currentbase] === 'G'){
         this._dna[currentbase] = withoutG[Math.floor(Math.random()*withoutG.length)];
      }
      return this._dna;
    },
    compareDNA(pAequor){
      let identicalCounter = 0;
      for(let i = 0;i < this._dna.length;i++){
        if(this._dna[i] === pAequor._dna[i]){
           identicalCounter++;
        }
      }
      let percentageDNA = Math.floor((identicalCounter/ this._dna.length) * 100);
      console.log(`speciment ${this._specNumber} and ${pAequor._specNumber} have ${percentageDNA}% DNA in common`);
    }

  }
};








