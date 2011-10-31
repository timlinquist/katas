describe('Generating factors of prime numbers', function () {
  var generator;

  beforeEach(function() {
    generator = new PrimeFactorGenerator();
  });

  it('should have no factors for 0', function (){
    expect(generator.generate(0)).toEqual([]);
  });

  it('should have no factors for anything <= 1'), function (){
    expect(gnerator.generate(1).toEqual([]));
  }

  it('should have itself as a prime factor', function () {
    expect(generator.generate(2)).toEqual([2]);
  });

  it('should have 2,2 as prime factors of 4', function(){
    expect(generator.generate(4)).toEqual([2,2]);
  });

  it('should have 2,3 as prime factors of 6', function(){
    expect(generator.generate(6)).toEqual([2,3]);
  });

  it('should have 2,2,2 as prime factors of 8', function(){
    expect(generator.generate(8)).toEqual([2,2,2]);
  });

  it('should have 3,3 as prime factors of 9', function(){
    expect(generator.generate(9)).toEqual([3,3]);
  });
});

