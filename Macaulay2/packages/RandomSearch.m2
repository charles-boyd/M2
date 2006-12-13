newPackage ("RandomSearch",
       	Version => "0.2", 
    	Date => "December 2, 2006",
    	Authors => {
	     {Name => "Mike Stillman", Email => "mike@math.cornell.edu"},
	     {Name => "David Eisenbud", Email => "de@msri.org"}
	     },
    	Headline => "random search for interesting examples",
    	DebuggingMode => false
    	)

export {search,
     randomBinomialFcn, 
     EMailAddress,
     AnnounceTime,
     MailInterval,
     Iterations,
     CollectGarbageInterval,
     RandomSeed,
     FileName,
     RegularityBound,
     NumVariables,
     NumGenerators,
     randomSparseIdeal     
     }

lastemail = 0
examples'found = 0

-- We must be careful to not send too many emails!
-- So we limit the number to one per searchOpts.MailInterval seconds.
appendToFile = (filename, str) -> openOutAppend filename << str << close

emailString = (str, address) -> (
     if address =!= null then (
     	  appendToFile(tempfilename, str);
	  if currentTime() - lastemail >= searchOpts.MailInterval
	  then (
	       subject := if examples'found > 0 then "found" else "looking";
     	       if 0 != run ("mail -v -s "|subject|" "|address|" <"|tempfilename)
	       then error "failed to send email";
     	       tempfilename << header << close;
	       lastemail = currentTime();
	       examples'found = 0;
	       );
     ))

handleExample = (i,str) -> (
     F := "ex "|i|" "|str;
     -- display on screen
     << F << flush;
     -- append to example file
     appendToFile(examplefilename, F);
     -- email to user
     emailString(F, searchOpts.EMailAddress);
     )

handleBad = (i) -> (
     F := "no examples found in last "|searchOpts.AnnounceTime|" seconds working on ex "|i|"\n";
     -- display on screen
     << F << flush;
     -- email to user
     emailString(F, searchOpts.EMailAddress);
     )

doLoop = (niterations) -> (
  lastemail = 0;
  examples'found = 0;
  for i from 1 to niterations do (
     if i % garbageInterval === 0 then collectGarbage();
     if currentTime() - lastdone > searchOpts.AnnounceTime then (
     	  handleBad i;	  
       	  lastdone = currentTime();
       );
     str := exampleFcn();
     if str =!= null then (
	  examples'found = examples'found+1;
	  handleExample(i,str);
	  lastdone = currentTime();
	  );
  ))

search = method(Options => {
	  EMailAddress => null, --"mes15@cornell.edu",
	  AnnounceTime => 60*60*4, -- 4 hours (time in seconds)
	  MailInterval => 60*10, -- 10 minutes (time in seconds)
	  Iterations => 10000,
	  CollectGarbageInterval => 10,
	  RandomSeed => null,
	  FileName => ""
	  })
	  
search(String,Function) := opts -> (head, fcn) -> (
     searchOpts = opts;
     exampleFcn = fcn;
     garbageInterval = opts.CollectGarbageInterval;
     if opts.RandomSeed === null then
       seed = processID() * currentTime()
     else
       seed = opts.RandomSeed;
     setRandomSeed seed;
     tempfilename = temporaryFileName()|"-"|seed;
     header = head | "\n seed "|seed|" processID "|processID()|"\n";
     tempfilename << header << close;
     << "starting run of " << opts.Iterations << " examples" << endl;
     << header << flush;
     examplefilename = opts.FileName|"-"|processID();
     lastdone = currentTime();
     doLoop opts.Iterations;
     emailString("finished iteration\n", searchOpts.EMailAddress);
     )

-- Test regularity and projective dimension of many ideals generated by quadrics
randomSparseIdeal = (B,r,n) -> (
     -- B is a list of monomials
     -- r is the size of each poly
     -- n is the number of polys
     -- returns an ideal
     S := ring B#0;
     ideal apply(n, j -> 
	  sum apply(r, i -> random coefficientRing S * B#(random(#B))))
     )

optsRandomBinomialFcn = {
	  RegularityBound => 11,
	  NumVariables => 10,
	  NumGenerators => 7,
	  Degree => 2,
	  CoefficientRing => ZZ/5
	  }
     
randomBinomialFcn = optsRandomBinomialFcn >> opts -> () -> (
     numvars := opts.NumVariables;
     numgenerators := opts.NumGenerators;
     deg := opts.Degree;
     kk := opts.CoefficientRing;
     regBound := opts.RegularityBound;
     R := kk[vars(0..numvars-1)];
     B := flatten entries basis(deg,R);
     fcn := () -> (
	  I := randomSparseIdeal(B,2,numgenerators);
	  r := regularity I;
	  if codim I < numgenerators and r >= regBound
	  then " regularity "|r|" "|toExternalString I|"\n"
	  else null);
     header := numgenerators|" polynomials of degree "|deg|" in "|toExternalString R;
     (header, fcn)
     )

beginDocumentation()

end
restart
load "/Users/mike/M2/Macaulay2/packages/RandomSearch.m2"

search splice (randomBinomialFcn(
	  NumVariables => 10,
	  NumGenerators => 7,
  	  Degree => 2,
          RegularityBound => 10,
	  CoefficientRing => ZZ/5),
  EMailAddress => "mes15@cornell.edu",
  MailInterval => 60*30,
  AnnounceTime => 60*1, 
  Iterations => 1000000,
  CollectGarbageInterval => 5,
  FileName => "blah"
  )
     
-- ideal (2*b*e+2*c*f,-e*h+i*j,-2*e^2-2*g^2,-c*e-g*h,-2*d*j,a*g-c*i)
load "/nfs/homes4/mike/M2/Macaulay2/packages/RandomSearch.m2"

-- regularity 12 ideal (2*f*h+e*i,-2*b^2-d*i,-a*g-2*i^2,2*e*g-2*d*h,-2*a*b-a*g,-2*d^2+a*i,-2*f^2-b*g)

-- What about 5 quadrics?
load "/Users/mike/M2/Macaulay2/packages/RandomSearch.m2"
R = ZZ/5[vars(0..9)]
B = flatten entries basis(2,R)
H = () -> randomSparseIdeal(B,2,5)

time Is = for i from 1 to 10000 list (J := trim H(); if numgens J < 5 then continue else toString J);
#Is
time reglist = tally apply(Is, s -> regularity value s)
select(Is, s -> regularity value s >= 7)
Bs = partition(s -> betti res value s, Is);
#(keys Bs)
netList keys Bs

seed = currentTime()
setRandomSeed seed
time Is = for i from 1 to 100000 list (J := trim H(); 
     if numgens J < 5 or regularity  J < 7 then 
     continue 
     else (<< toString J << endl; toString J));
#Is
time reglist = tally apply(Is, s -> regularity value s)
Is/print;
Is/(s -> betti res value s)
Is/(s -> codim value s)
tally(Is/(s -> poincare value s))
-- regularity 7
-- ideal (b*g-e*h,d*f-e*h,c*e+2*f*h,d^2+2*d*h,b^2+2*c^2)
-- ideal (c*f+d*h,a*f-e*g,e^2,b*c-2*f*g,b^2+h^2)
-- ideal (h^2,g^2,d*f+e*g,b*e-c*h,b*c+a*f), 
-- ideal (f^2-2*b*g,d*f+2*a*g,a*e+2*d*g,b^2-b*f,a*b-c*e)
-- ideal (e*f-2*c*h,c*f-d*h,d^2,a*b+2*e*h,a^2)
-- ideal (g^2,a*f-g*h,d^2,a*d+c*e,a*c-e*f)
-- ideal (g^2,b*f+2*f^2,e^2+f^2,a*e+b*h,b^2+e*g)
-- ideal (g^2+2*h^2,a*g,a*e-2*b*h,c*d-e*g,a*c-d*f)
-- ideal (c*g,d*f-b*g,a*f+d*h,a*c+2*g^2,a^2)
-- ideal (f^2-2*a*h,e^2+2*f*h,c*e-d*h,a*b-2*h^2,a^2-2*a*h)
-- ideal (f*g+2*e*h,d*f+2*h^2,c*f-2*b*g,d^2,b*c-2*a*d)
-- ideal (b*g+2*d*g,d^2+2*b*h,c^2+2*a*g,a*c+2*d*h,b^2-2*g^2)
-- ideal (e*f-2*a*g,d*e,d^2+2*e^2,b*c+a*d,a*c+g*h)
-- ideal (i^2,b*e+2*d*f,b*d-2*f*i,c^2-2*e^2,a*c+d*g)
-- ideal (a*g-f*h,d^2-2*d*f,a*d-g*i,c^2,b*c-a*f)
-- ideal (b*j,f^2,c*d+2*a*f,a*c-2*b*i,b^2+2*f*j)
-- ideal (g^2+h^2,e*g-2*d*j,c*d+h*i,a*c-f*g,a^2)
-- ideal (f^2-2*j^2,e*f+2*h*i,a*d+2*c*j,a*b-2*d*h,a^2+2*h^2)
-- ideal (a*i-2*j^2,g*h-2*b*j,a*g+i*j,a*c-2*d*g,a^2+2*g^2)
-- ideal (c*h-g*j,e*g+d*j,d*g+2*h^2,b*d-2*a*j,a^2)
-- ideal (g*h+a*i,g^2+2*i^2,d*g-2*f*j,f^2+b*i,b*f)

restart
load "/Users/mike/M2/Macaulay2/packages/RandomSearch.m2"
R = ZZ/5[vars(0..9)]
B0 = ideal(a,b,c)
B = flatten entries super basis(2,B0)

H = () -> randomSparseIdeal(B,2,4)
seed = currentTime()
setRandomSeed seed
time Is = for i from 1 to 100000 list (J := trim H(); 
     if numgens J < 4 or regularity  J < 6 then 
     continue 
     else (<< toString J << endl; toString J));
