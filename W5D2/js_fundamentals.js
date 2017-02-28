function mysteryScoping1() {
  var x = 'out of block';
  if (true) {
    var x = 'in block';
    console.log(x);
  }
  console.log(x);
}
/*
mysteryScoping1() returns
in block
in block
*/

function mysteryScoping2() {
  const x = 'out of block';
  if (true) {
    const x = 'in block';
    console.log(x);
  }
  console.log(x);
}
/*
mysteryScoping2() returns
in block
out of block
*/


// function mysteryScoping3() {
//   const x = 'out of block';
//   if (true) {
//     var x = 'in block';
//     console.log(x);
//   }
//   console.log(x);
// }
/*
mysteryScoping3() throws an error
const x can't be declared again
by var
*/

function mysteryScoping4() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  console.log(x);
}
/*
mysteryScoping4() returns
in block
out of block
*/


// function mysteryScoping5() {
//   let x = 'out of block';
//   if (true) {
//     let x = 'in block';
//     console.log(x);
//   }
//   let x = 'out of block again';
//   console.log(x);
// }
/*
mysteryScoping5() throws an error
x can't be declared more than once
within the same scope
*/

function madLib(verb, adj, noun){
  console.log(`We shall ${verb.toUpperCase()} the ${adj.toUpperCase()} ${noun.toUpperCase()}.`);
}

madLib('make', 'best', 'guac');
// "We shall MAKE the BEST GUAC."

function isSubstring(searchString, subString) {
  console.log(searchString.includes(subString));
}

isSubstring("time to program", "time");
// returns true
isSubstring("Jump for joy", "joys");
// returns false

function fizzBuzz(array){
  let buzz = []

  array.forEach(function (num){
    if ((num % 3) === 0 && (num % 5) != 0) {
      buzz.push(num);
    }
    if ((num % 3) != 0 && (num % 5) === 0) {
      buzz.push(num);
    }
  });

  return buzz;
}

console.log(fizzBuzz([3,5,15,18]));
// returns 3, 5, 18

function isPrime(n) {
  for(let i = 2; i < n; i++){
    if (n % i === 0) {
      return false;
    }
  }
  return true;
}


function firstNPrimes(n) {

  function isPrime(num) {
    for(let i = 2; i < num; i++){
      if (num % i === 0) {
        return false;
      }
    }
    return true;
  }

  let primes = [];
  for(let j = 2; primes.length === n; j++) {
    if (isPrime(j)) {
      primes.push(j);
    }
  }
  return primes;
}

console.log(firstNPrimes(3));
