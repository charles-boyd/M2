-- An example of Uli Walther and Anurag Singh
-- Email dated 4/17/2006
R=ZZ[b,c,s,t,u,v,w,x,y,z,MonomialSize=>16];
f1=b*t*v^2+c*s*u^2;
f2=-b*s*u*x+b*t*v*y+c*s*u*x-c*t*v*y;
f3=-b*s*x^2-c*t*y^2;
g1=s*x^2+t*y^2;
g2=-s*u*x-t*v*y;
g3=s*u^2+t*v^2;
p=2
k=2
ff=((f1*g1)^p+(f2*g2)^p+(f3*g3)^p) // p;
f0=ff*((f1*f2*f3)^k);
time assert (f0 % ideal((f1)^(p+k),(f2)^(p+k),(f3)^(p+k)) == 0)

J = ideal((f1)^(p+k),(f2)^(p+k),(f3)^(p+k))

-- I don't understand why the following line runs out of memory when the test is run with the makefile under Mac OS,
-- but not when I try the same thing by running M2 myself.  So, if it runs out of memory during "make check",
-- try it separately.  Then if it works, declare it passes the test.
time assert (f0 % J == 0)


-- This is a certification that f0 is in the given ideal:
J = ideal((f1)^(p+k),(f2)^(p+k),(f3)^(p+k))
G0 = 288162911981*b^4*s^6*u^2*x^10-90514559409*b^3*c*s^6*u^2*x^10+685766*b^2*c^2*s^6*u^2*x^10-165140*b*c^3*s^6*u^2*x^10+38632968954695*b^4*s^5*t*v^2*x^10+7075298699280259*b^3*c*s^5*t*v^2*x^10+2675664255*b^2*c^2*s^5*t*v^2*x^10+154028890280310*b^4*s^5*t*u*v*x^9*y-4382096409342*b^3*c*s^5*t*u*v*x^9*y-315583783829*b^2*c^2*s^5*t*u*v*x^9*y-3567552340*b*c^3*s^5*t*u*v*x^9*y+108331359027208*b^4*s^5*t*u^2*x^8*y^2-42461806715247577*b^3*c*s^5*t*u^2*x^8*y^2+28301177390811829*b^2*c^2*s^5*t*u^2*x^8*y^2-7074319843159692*b*c^3*s^5*t*u^2*x^8*y^2+825700*c^4*s^5*t*u^2*x^8*y^2-8408630948529*b^4*s^4*t^2*v^2*x^8*y^2+152431342173515*b^3*c*s^4*t^2*v^2*x^8*y^2+28301037004543357*b^2*c^2*s^4*t^2*v^2*x^8*y^2+8919045990*b*c^3*s^4*t^2*v^2*x^8*y^2+10700675338*b^4*s^4*t^2*u*v*x^7*y^3+616072758419886*b^3*c*s^4*t^2*u*v*x^7*y^3-17464181585334*b^2*c^2*s^4*t^2*u*v*x^7*y^3-1305137836674*b*c^3*s^4*t^2*u*v*x^7*y^3-3569534020*c^4*s^4*t^2*u*v*x^7*y^3+35371599199410493*b^4*s^4*t^2*u^2*x^6*y^4-141053071366487341*b^3*c*s^4*t^2*u^2*x^6*y^4+42379486726169643*b^2*c^2*s^4*t^2*u^2*x^6*y^4-28280782118525769*b*c^3*s^4*t^2*u^2*x^6*y^4+7074319839730866*c^4*s^4*t^2*u^2*x^6*y^4-2675168834*b^4*s^3*t^3*v^2*x^6*y^4-33623823118779*b^3*c*s^3*t^3*v^2*x^6*y^4+223379628134103*b^2*c^2*s^3*t^3*v^2*x^6*y^4+42451171726046177*b*c^3*s^3*t^3*v^2*x^6*y^4+6244372575*c^4*s^3*t^3*v^2*x^6*y^4-28296289797246365*b^4*s^3*t^3*u*v*x^5*y^5+113185180594299494*b^3*c*s^3*t^3*u*v*x^5*y^5-168853651063052472*b^2*c^2*s^3*t^3*u*v*x^5*y^5+113158995042413630*b*c^3*s^3*t^3*u*v*x^5*y^5-28298268921205493*c^4*s^3*t^3*u*v*x^5*y^5-29186967833072*b^4*s^3*t^3*u^2*x^4*y^6+42562666910977757*b^3*c*s^3*t^3*u^2*x^4*y^6-169308809819674063*b^2*c^2*s^3*t^3*u^2*x^4*y^6+15658592508029*b*c^3*s^3*t^3*u^2*x^4*y^6-3988539897803*c^4*s^3*t^3*u^2*x^4*y^6+7073825058741084*b^4*s^2*t^4*v^2*x^4*y^6-28295300235955173*b^3*c*s^2*t^4*v^2*x^4*y^6+42392498570718681*b^2*c^2*s^2*t^4*v^2*x^4*y^6-28153371566962177*b*c^3*s^2*t^4*v^2*x^4*y^6+35374073104359403*c^4*s^2*t^4*v^2*x^4*y^6+38674587863440*b^4*s^2*t^4*u*v*x^3*y^7-153378935481010*b^3*c*s^2*t^4*u*v*x^3*y^7+226784133498994*b^2*c^2*s^2*t^4*u*v*x^3*y^7+469276624666558*b*c^3*s^2*t^4*u*v*x^3*y^7+15954159591214*c^4*s^2*t^4*u*v*x^3*y^7-16949807736422*b^3*c*s^2*t^4*u^2*x^2*y^8+28365078590751343*b^2*c^2*s^2*t^4*u^2*x^2*y^8-112857490855312223*b*c^3*s^2*t^4*u^2*x^2*y^8-73891770796*c^4*s^2*t^4*u^2*x^2*y^8-13747700331410*b^4*s*t^5*v^2*x^2*y^8-7019658892524440*b^3*c*s*t^5*v^2*x^2*y^8+28216117032191728*b^2*c^2*s*t^5*v^2*x^2*y^8-42426559720688425*b*c^3*s*t^5*v^2*x^2*y^8+28315108662121744*c^4*s*t^5*v^2*x^2*y^8+5680107068056*b^3*c*s*t^5*u*v*x*y^9-22390574279037*b^2*c^2*s*t^5*u*v*x*y^9+32764793987926*b*c^3*s*t^5*u*v*x*y^9+133273315757854*c^4*s*t^5*u*v*x*y^9-4260080301042*b^2*c^2*s*t^5*u^2*y^10+7091360161161883*b*c^3*s*t^5*u^2*y^10-28214508484096165*c^4*s*t^5*u^2*y^10+2749540066282*b^3*c*t^6*v^2*y^10-10833233243328*b^2*c^2*t^6*v^2*y^10+15839315921523*b*c^3*t^6*v^2*y^10-18424363526980*c^4*t^6*v^2*y^10
G1 = 90513467746*b^3*c*s^6*u^6*x^6-25205*b^2*c^2*s^6*u^6*x^6+165140*b*c^3*s^6*u^6*x^6-452567338730*b^4*s^5*t*u^4*v^2*x^6-7075309402038100*b^3*c*s^5*t*u^4*v^2*x^6-2675003695*b^2*c^2*s^5*t*u^4*v^2*x^6+7075309402164129*b^4*s^4*t^2*u^2*v^4*x^6-10701666180*b^3*c*s^4*t^2*u^2*v^4*x^6+2675168835*b^4*s^3*t^3*v^6*x^6+6042160939040*b^3*c*s^5*t*u^5*v*x^5*y+329853892367*b^2*c^2*s^5*t*u^5*v*x^5*y+3568212900*b*c^3*s^5*t*u^5*v*x^5*y+4955999326088*b^4*s^4*t^2*u^3*v^3*x^5*y-28299918192179650*b^3*c*s^4*t^2*u^3*v^3*x^5*y+3570194580*b^2*c^2*s^4*t^2*u^3*v^3*x^5*y+989562282031*b^4*s^3*t^3*u*v^5*x^5*y-21401350680*b^3*c*s^3*t^3*u*v^5*x^5*y-3898026430058*b^2*c^2*s^5*t*u^6*x^4*y^2+7074319839856894*b*c^3*s^5*t*u^6*x^4*y^2-825700*c^4*s^5*t*u^6*x^4*y^2+7524512456878*b^3*c*s^4*t^2*u^4*v^2*x^4*y^2-2473905579045*b^2*c^2*s^4*t^2*u^4*v^2*x^4*y^2+5349511970*b*c^3*s^4*t^2*u^4*v^2*x^4*y^2+11965619693412*b^4*s^3*t^3*u^2*v^4*x^4*y^2+2*b^3*c*s^3*t^3*u^2*v^4*x^4*y^2-5350337670*b^2*c^2*s^3*t^3*u^2*v^4*x^4*y^2-7073825058741083*b^4*s^2*t^4*v^6*x^4*y^2+990840*b^3*c*s^2*t^4*v^6*x^4*y^2+7128322551992*b^2*c^2*s^4*t^2*u^5*v*x^3*y^3+28298598775400326*b*c^3*s^4*t^2*u^5*v*x^3*y^3+3566231220*c^4*s^4*t^2*u^5*v*x^3*y^3+21272212788288*b^3*c*s^3*t^3*u^3*v^3*x^3*y^3-6597081880196*b^2*c^2*s^3*t^3*u^3*v^3*x^3*y^3+14267567120*b*c^3*s^3*t^3*u^3*v^3*x^3*y^3+16316213462200*b^4*s^2*t^4*u*v^5*x^3*y^3+28297279359427574*b^3*c*s^2*t^4*u*v^5*x^3*y^3-32105328820*b^2*c^2*s^2*t^4*u*v^5*x^3*y^3-16497240397692*b*c^3*s^4*t^2*u^6*x^2*y^4-7074319839730865*c^4*s^4*t^2*u^6*x^2*y^4-7977079795608*b^2*c^2*s^3*t^3*u^4*v^2*x^2*y^4+2*b*c^3*s^3*t^3*u^4*v^2*x^2*y^4+8025506505*c^4*s^3*t^3*u^4*v^2*x^2*y^4+21724780127018*b^3*c*s^2*t^4*u^2*v^4*x^2*y^4-1649270596075*b^2*c^2*s^2*t^4*u^2*v^4*x^2*y^4+14268392820*b*c^3*s^2*t^4*u^2*v^4*x^2*y^4+13747700331410*b^4*s*t^5*v^6*x^2*y^4+7074649693850082*b^3*c*s*t^5*v^6*x^2*y^4-4458779865*b^2*c^2*s*t^5*v^6*x^2*y^4-31908319182432*b*c^3*s^3*t^3*u^5*v*x*y^5+989562282031*c^4*s^3*t^3*u^5*v*x*y^5-49672748128568*b^2*c^2*s^2*t^4*u^3*v^3*x*y^5-28301237608152402*b*c^3*s^2*t^4*u^3*v^3*x*y^5+10701335900*c^4*s^2*t^4*u^3*v^3*x*y^5-16678267333184*b^3*c*s*t^5*u*v^5*x*y^5-989562080385*b^2*c^2*s*t^5*u*v^5*x*y^5-10701996460*b*c^3*s*t^5*u*v^5*x*y^5+3988539897804*c^4*s^3*t^3*u^6*y^6+543080806476*b*c^3*s^2*t^4*u^4*v^2*y^6+7075804183153911*c^4*s^2*t^4*u^4*v^2*y^6-6738079964086*b^2*c^2*s*t^5*u^2*v^4*y^6-7074979548044912*b*c^3*s*t^5*u^2*v^4*y^6+8918055150*c^4*s*t^5*u^2*v^4*y^6-2749540066282*b^3*c*t^6*v^6*y^6-164927021799*b^2*c^2*t^6*v^6*y^6-1783611030*b*c^3*t^6*v^6*y^6
G2 = -90513467746*b^3*c*s^6*u^10*x^2+362053896190*b^2*c^2*s^6*u^10*x^2-543081072439*b*c^3*s^6*u^10*x^2+73891770797*c^4*s^6*u^10*x^2+452567338730*b^4*s^5*t*u^8*v^2*x^2+7073499132683182*b^3*c*s^5*t*u^8*v^2*x^2-28298519529116330*b^2*c^2*s^5*t*u^8*v^2*x^2+42448882791210983*b*c^3*s^5*t*u^8*v^2*x^2-28339039901508566*c^4*s^5*t*u^8*v^2*x^2-7075309402164128*b^4*s^4*t^2*u^6*v^4*x^2+28301248310322695*b^3*c*s^4*t^2*u^6*v^4*x^2-42453628197121377*b^2*c^2*s^4*t^2*u^6*v^4*x^2+28147313030191263*b*c^3*s^4*t^2*u^6*v^4*x^2-35376547010064477*c^4*s^4*t^2*u^6*v^4*x^2-2675168834*b^4*s^3*t^3*u^4*v^6*x^2-1141950972583*b^3*c*s^3*t^3*u^4*v^6*x^2-231451806503549*b^2*c^2*s^3*t^3*u^4*v^6*x^2-42451781497749275*b*c^3*s^3*t^3*u^4*v^6*x^2-18728493805*c^4*s^3*t^3*u^4*v^6*x^2-288162911980*b^4*s^2*t^4*u^2*v^8*x^2-154441361259373*b^3*c*s^2*t^4*u^2*v^8*x^2-28301194797806801*b^2*c^2*s^2*t^4*u^2*v^8*x^2-10702491880*b*c^3*s^2*t^4*u^2*v^8*x^2-38632968954695*b^4*s*t^5*v^10*x^2-7075298699280259*b^3*c*s*t^5*v^10*x^2-2675664255*b^2*c^2*s*t^5*v^10*x^2-5680107068056*b^3*c*s^5*t*u^9*v*x*y+22390574279035*b^2*c^2*s^5*t*u^9*v*x*y-32764793987922*b*c^3*s^5*t*u^9*v*x*y-133273315757856*c^4*s^5*t*u^9*v*x*y-6766268681008*b^4*s^4*t^2*u^7*v^3*x*y+25745658751278*b^3*c*s^4*t^2*u^7*v^3*x*y-35334218404398*b^2*c^2*s^4*t^2*u^7*v^3*x*y-596909901396282*b*c^3*s^4*t^2*u^7*v^3*x*y+15954159591214*c^4*s^4*t^2*u^7*v^3*x*y+28300248046374483*b^4*s^3*t^3*u^5*v^5*x*y-113201013590811978*b^3*c*s^3*t^3*u^5*v^5*x*y+168877400557821204*b^2*c^2*s^3*t^3*u^5*v^5*x*y-113174828038926114*b*c^3*s^3*t^3*u^5*v^5*x*y+28302227170333611*c^4*s^3*t^3*u^5*v^5*x*y+10700675338*b^4*s^2*t^4*u^3*v^7*x*y-616158363822602*b^3*c*s^2*t^4*u^3*v^7*x*y+17592589689418*b^2*c^2*s^2*t^4*u^3*v^7*x*y+1219532433950*b*c^3*s^2*t^4*u^3*v^7*x*y+24970884700*c^4*s^2*t^4*u^3*v^7*x*y-154028890280312*b^4*s*t^5*u*v^9*x*y+4382096409346*b^3*c*s*t^5*u*v^9*x*y+315583783827*b^2*c^2*s*t^5*u*v^9*x*y+3567552340*b*c^3*s*t^5*u*v^9*x*y+4260080301042*b^2*c^2*s^5*t*u^10*y^2-7091360161161883*b*c^3*s^5*t*u^10*y^2+28214508484096165*c^4*s^5*t*u^10*y^2+14290781137886*b^3*c*s^4*t^2*u^8*v^2*y^2-28354607411404203*b^2*c^2*s^4*t^2*u^8*v^2*y^2+112842194620463135*b*c^3*s^4*t^2*u^8*v^2*y^2+18424363526981*c^4*s^4*t^2*u^8*v^2*y^2+10573781643320*b^4*s^3*t^3*u^6*v^4*y^2-42488873874406767*b^3*c*s^3*t^3*u^6*v^4*y^2+169199762401504069*b^2*c^2*s^3*t^3*u^6*v^4*y^2+89651613699137*b*c^3*s^3*t^3*u^6*v^4*y^2-3988539897803*c^4*s^3*t^3*u^6*v^4*y^2-35374073105115567*b^4*s^2*t^4*u^4*v^6*y^2+141062956288632303*b^3*c*s^2*t^4*u^4*v^6*y^2-42342106594535679*b^2*c^2*s^2*t^4*u^4*v^6*y^2+28302673651809167*b*c^3*s^2*t^4*u^4*v^6*y^2-7075804183153910*c^4*s^2*t^4*u^4*v^6*y^2-108347410040216*b^4*s*t^5*u^2*v^8*y^2+42496658094741655*b^3*c*s*t^5*u^2*v^8*y^2-28293233620546467*b^2*c^2*s*t^5*u^2*v^8*y^2+7075015220265514*b*c^3*s*t^5*u^2*v^8*y^2-8918055150*c^4*s*t^5*u^2*v^8*y^2+8408630948530*b^4*t^6*v^10*y^2+2100533645263*b^3*c*t^6*v^10*y^2+157792577680*b^2*c^2*t^6*v^10*y^2+1783611030*b*c^3*t^6*v^10*y^2
assert(f0 == G0 * J_0 + G1 * J_1 + G2 * J_2)


-- this succeeds in 43 seconds with 280MB of memory, with the debug version.

end
-- there is a bug involving this: different answers come from gcc 4.6.x and earlier gcc's...

J = ideal((f1)^(p+k),(f2)^(p+k),(f3)^(p+k))
gbTrace=15
gens gb(J, DegreeLimit=>28); -- 38 gens

J = ideal J_*
M = flatten entries gens gb(J, DegreeLimit=>29); -- 55 gens

J1 = ideal J_*
M1 = flatten entries gens gb(J1, DegreeLimit=>29, Strategy=>LongPolynomial); -- 55 gens
m = b^2 * c^5 * s^4 * u^4 * x^ 8
m % J
m % J1
D = select(M, f -> m % leadMonomial f == 0);
D1 = select(M1, f -> m % leadMonomial f == 0);

I = ideal{10*b^2*c^3*s^4*u^4*x^8, 2*b*c^5*s^4*u^4*x^8, 5*b^2*c^4*s^4*u^4*x^8}
gens gb I  -- WRONG!!  should have a monic term in it...

R=ZZ[b,c];
I = ideal{10*b^2*c^3, 2*b*c^5, 5*b^2*c^4}
gens gb I

-- What I think is the real problem:
R=ZZ[b,c];
I = ideal{10*b, 2*c^2, 5*b*c}
gens gb I
assert((b*c^2) % I == 0)  -- now correct

R=ZZ[b,c,d,e];
I = ideal{10*b, 2*c^2, 5*b*c, b*c^3-d^4-e^4}
gens gb I
assert((b*c^2) % I == 0)  -- now correct


gens gb ideal (D/leadTerm)
positions(0..50, i -> M1#i != M#i) -- they match in the first 51 polynomials
M1#51 == M#52
M1#52 == M#53
M1#53 == M#54
M#51  -- this is the one that is not in the stable_sort version...
select(M1, m -> (leadMonomial M#51) % leadMonomial m == 0);
leadMonomial M#51


m % J
gens gb J;
f0 % J -- == 0
M = f0 // (gens J)
(gens J) * M == f0 -- true!!
L = flatten entries M
L_0
factor L_0
L_1
f0
L_2

P = flatten entries leadTerm gens gb J
P/degree
P38 = select(P, f -> first degree f <= 38)
#P38  -- 1330 still...


RQQ=QQ[b,c,s,t,u,v,w,x,y,z,MonomialSize=>16];
f0QQ = sub(f0, RQQ)
JQQ = sub(J, RQQ)
gens gb JQQ;  -- 845 elements
MQQ = f0QQ // (gens JQQ)

MQQ = flatten entries MQQ
1440*MQQ
