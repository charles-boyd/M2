--- status: Draft
--- author(s): MES
--- notes: 

document { 
     Key => Hom,
     Headline => "module of homomorphisms"
     }

document { 
     Key => {(Hom,Module,Module),
	  (Hom,Module,Ideal),
	  (Hom,Module,Ring),
	  (Hom,Ideal,Module),
	  (Hom,Ideal,Ideal),
	  (Hom,Ideal,Ring),
	  (Hom,Ring,Module),
	  (Hom,Ring,Ideal)},
     Headline => "module of homomorphisms",
     Usage => "Hom(M,N)",
     Inputs => {
	  "M","N"
	  },
     Outputs => {
	  Module => {"The module Hom_R(M,N), where M and N are both R-modules"}
	  },
     "If ", TT "M", " or ", TT "N", " is an ideal or ring, it is regarded as a module in the evident way.",
     PARA{},
     EXAMPLE lines ///
     	  R = QQ[x,y]/(y^2-x^3);
	  M = image matrix{{x,y}}
	  H = Hom(M,M)
	  H1 = prune H
	  ///,
     "Specific homomorphisms may be obtained using ", TO homomorphism, ".",
     EXAMPLE lines ///
	  f1 = homomorphism H_{0}
	  f2 = homomorphism H_{1}
	  f3 = homomorphism H_{2}
	  ///,
     "In this example, f1 is the identity map, f2 is multiplication by x,
     and f3 maps x to y and y to x^2.",
     PARA{},
     SeeAlso => {homomorphism, Ext}
     }

document { 
     Key => {(Hom,Module,ChainComplex),(Hom,ChainComplex,Module)},
     Headline => "",
     Usage => "Hom(M,C)\nHom(C,M)",
     Inputs => {
	  "M",
	  "C"
	  },
     Outputs => {
	  ChainComplex => {"The chain complex whose ", TT "i", "-th spot is ", 
	       TT "Hom(M,C_i)", ", in the first case, or ", TT "Hom(C_(-i),M)", " in the second case"}
	  },
     EXAMPLE lines ///
     	  R = QQ[a..d];
	  C = res coker vars R
	  M = R^1/(a,b)
	  C' = Hom(C,M)
	  C'.dd_-1
	  C'.dd^2 == 0
	  ///,
     Caveat => {"Hom of two chain complexes is not yet implemented"},
     SeeAlso => {resolution}
     }

multidoc ///
Node
 Key
  (Hom,Matrix,Matrix)
 Headline
  induced map on Hom
 Usage
  Hom(f,g)
 Inputs
  f:
  g:
 Outputs
  :
   the map on Hom induced by the maps {\tt f} and {\tt g}
Node
 Key
  (Hom,Matrix,Module)
 Headline
  induced map on Hom
 Usage
  Hom(f,M)
 Inputs
  f:
  M:
 Outputs
  :
   the induced map on Hom
 Description
  Example
   R = QQ[x]
   f = vars R
   M = image f
   g = Hom(f,M)
   target g
   source g
Node
 Key
  (Hom,Module,Matrix)
 Headline
  induced map on Hom
 Usage
  Hom(M,f)
 Inputs
  M:
  f:
 Outputs
  :
   the induced map on Hom
 Description
  Example
   R = QQ[x]
   f = vars R
   M = image f
   g = Hom(M,f)
   target g
   source g
Node
 Key
  (Hom,Module,ChainComplexMap)
 Headline
  induced map on Hom
 Usage
  Hom(M,f)
 Inputs
  M:
  f:
 Outputs
  :
   the induced map on Hom
Node
 Key
  (Hom,ChainComplexMap,Module)
 Headline
  induced map on Hom
 Usage
  Hom(f,M)
 Inputs
  M:
  f:
 Outputs
  :
   the induced map on Hom
///

document { 
     Key => {(Hom,CoherentSheaf,CoherentSheaf),
	  (Hom, SheafOfRings, SheafOfRings),
	  (Hom, CoherentSheaf, SheafOfRings),
	  (Hom, SheafOfRings, CoherentSheaf)},
     Headline => "global Hom",
     Usage => "Hom(F,G)",
     Inputs => {
	  "F", "G" => {"both should be sheaves on a 
	               projective variety or scheme ", TT "X = Proj R"},
	  },
     Outputs => {
	  Module => {"over the coefficient field of ", TT "R"}
	  },
     "If ", TT "F", " or ", TT "G", " is a sheaf of rings, it is regarded as a sheaf of modules in the evident way.",
     PARA{},
     EXAMPLE lines ///
          R = QQ[a..d];
	  P3 = Proj R
	  I = monomialCurveIdeal(R,{1,3,4})
	  G = sheaf module I
	  Hom(OO_P3,G(3))
	  HH^0(G(3))
          ///,
     SeeAlso => {sheafHom, Ext, sheafExt}
     }

