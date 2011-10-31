function PrimeFactorGenerator () {
  this.primeWithNoFactors = 2;

  this.generate = function (number){
    factors = [];
    // Start with 2 because it is lowest possible prime factor
    possibleFactor = this.primeWithNoFactors;

    while ( number >= this.primeWithNoFactors ) {
      // Nested iteration as the same factor may yield no remainder more than once
      while ( number % possibleFactor == 0){
        factors.push(possibleFactor);
        number /= possibleFactor;
      }

      possibleFactor++;
    }

    // If number still >= lowest prime it can only be lowest prime
    if (number >= this.primeWithNoFactors ){
      factors.push(number);
    }

    return factors;
  }
}
