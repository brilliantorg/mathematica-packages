(* ::Package:: *)

(* Mathematica Package *)

(* Created by BobTheChemist Jul 27, 2013 
Modified by Blake Farrow Mar 6 2018 *)

BeginPackage["Molviewer`"]
(* Exported symbols added here with SymbolName::usage *) 

makemolecule::usage = "
	makemolecule[moleculetype]
	Constructs the graphics elements for a molecule given an identifier"
molview::usage = "
	molview[graphics]
	Displays a grpahics object with default settings to make
	molecular viewing more appealing"

	

(* Implementation of the package *)

Clear[colorrules, sizerules]; 
BrillBlue=RGBColor["#3D99F6"];
BrillOrange = RGBColor["#EC7300"];
BrillRed=RGBColor["#D61F06"];
BrillGray=RGBColor["#333333"];
BrillGreen=RGBColor["#67D94C"];
BrillPurple=RGBColor["#BA33D6"];
BrillYellow=RGBColor["#F2C94C"];
BrillColors={RGBColor[0.8392156862745098, 0.12156862745098039`, 0.023529411764705882`],RGBColor[0.23921568627450981`, 0.6, 0.9647058823529412],RGBColor[0.403921568627451, 0.8509803921568627, 0.2980392156862745],RGBColor[0.9490196078431372, 0.788235294117647, 0.2980392156862745],RGBColor[0.2, 0.2, 0.2],RGBColor[0.9254901960784314, 0.45098039215686275`, 0.]};
colorrules[] = {"H"->RGBColor[0.65, 0.7, 0.7],"He"->RGBColor[0.836713, 1., 1.],"Li"->RGBColor[0.799435, 0.543572, 0.997559],"Be"->RGBColor[0.770565, 0.964309, 0.0442359],"B"->RGBColor[1., 0.709804, 0.709804],"C"->RGBColor[0.4, 0.4, 0.4],"N"->RGBColor[0.291989, 0.437977, 0.888609],"O"->BrillRed,"F"->RGBColor[0.578462, 0.85539, 0.408855],"Ne"->RGBColor[0.677263, 0.928423, 0.955287],"Na"->RGBColor[0.658708, 0.492173, 0.842842],"Mg"->RGBColor[0.628274, 0.850553, 0.0782731],"Al"->RGBColor[0.8913, 0.631904, 0.627399],"Si"->RGBColor[0.941176, 0.784314, 0.627451],"P"->RGBColor[1., 0.501961, 0],"S"->RGBColor[0.90443, 0.97015, 0.13504],"Cl"->RGBColor[0.412698, 0.932689, 0.166398],"Ar"->RGBColor[0.546138, 0.844244, 0.892092],"K"->RGBColor[0.534026, 0.420729, 0.705621],"Ca"->RGBColor[0.480072, 0.744591, 0.0955222],"Sc"->RGBColor[0.901961, 0.901961, 0.901961],"Ti"->RGBColor[0.74902, 0.760784, 0.780392],"V"->RGBColor[0.65098, 0.65098, 0.670588],"Cr"->RGBColor[0.541176, 0.6, 0.780392],"Mn"->RGBColor[0.611765, 0.478431, 0.780392],"Fe"->RGBColor[0.878431, 0.4, 0.2],"Co"->RGBColor[0.941176, 0.564706, 0.627451],"Ni"->RGBColor[0.313725, 0.815686, 0.313725],"Cu"->RGBColor[0.784314, 0.501961, 0.2],"Zn"->RGBColor[0.490196, 0.501961, 0.690196],"Ga"->RGBColor[0.800757, 0.542666, 0.533513],"Ge"->RGBColor[0.60508, 0.632465, 0.576489],"As"->RGBColor[0.741176, 0.501961, 0.890196],"Se"->RGBColor[0.917248, 0.657833, 0.0706628],"Br"->RGBColor[0.58847, 0.22163, 0.16064],"Kr"->RGBColor[0.426019, 0.747462, 0.810413],"Rb"->RGBColor[0.425391, 0.329242, 0.585895],"Sr"->RGBColor[0.325959, 0.646423, 0.095983],"Y"->RGBColor[0.531014, 1., 1.],"Zr"->RGBColor[0.458599, 0.917466, 0.918573],"Nb"->RGBColor[0.385036, 0.834854, 0.841681],"Mo"->RGBColor[0.310325, 0.752163, 0.769323],"Tc"->RGBColor[0.234466, 0.669394, 0.701499],"Ru"->RGBColor[0.157459, 0.586546, 0.638209],"Rh"->RGBColor[0.0793033, 0.50362, 0.579453],"Pd"->RGBColor[0., 0.420615, 0.525231],"Ag"->RGBColor[0.752941, 0.752941, 0.752941],"Cd"->RGBColor[1., 0.85098, 0.560784],"In"->RGBColor[0.728371, 0.440594, 0.422196],"Sn"->RGBColor[0.39799, 0.491477, 0.495586],"Sb"->RGBColor[0.619608, 0.388235, 0.709804],"Te"->RGBColor[0.816706, 0.451332, 0.0100947],"I"->RGBColor[0.580392, 0, 0.580392],"Xe"->RGBColor[0.316906, 0.638078, 0.710252],"Cs"->RGBColor[0.332803, 0.217712, 0.483666],"Ba"->RGBColor[0.165935, 0.55605, 0.0796556],"La"->RGBColor[0.928084, 0.716075, 0.329427],"Ce"->RGBColor[0.894824, 0.731424, 0.325131],"Pr"->RGBColor[0.86523, 0.707999, 0.315261],"Nd"->RGBColor[0.837836, 0.662974, 0.301635],"Pm"->RGBColor[0.811992, 0.607859, 0.285626],"Sm"->RGBColor[0.787563, 0.549894, 0.268279],"Eu"->RGBColor[0.764628, 0.493261, 0.250405],"Gd"->RGBColor[0.743177, 0.440115, 0.23269],"Tb"->RGBColor[0.72281, 0.39143, 0.215783],"Dy"->RGBColor[0.702434, 0.347663, 0.200392],"Ho"->RGBColor[0.679962, 0.309234, 0.187368],"Er"->RGBColor[0.652012, 0.276823, 0.17779],"Tm"->RGBColor[0.613603, 0.251489, 0.173042],"Yb"->RGBColor[0.557855, 0.234598, 0.17489],"Lu"->RGBColor[0.475685, 0.227573, 0.18555],"Hf"->RGBColor[0.781537, 0.717388, 0.716579],"Ta"->RGBColor[0.734443, 0.544489, 0.683471],"W"->RGBColor[0.681179, 0.360409, 0.63675],"Re"->RGBColor[0.605181, 0.367584, 0.556343],"Os"->RGBColor[0.521806, 0.382125, 0.469204],"Ir"->RGBColor[0.445624, 0.373159, 0.399069],"Pt"->RGBColor[0.815686, 0.815686, 0.878431],"Au"->RGBColor[1., 0.819608, 0.137255],"Hg"->RGBColor[0.721569, 0.721569, 0.815686],"Tl"->RGBColor[0.65098, 0.329412, 0.301961],"Pb"->RGBColor[0.341176, 0.34902, 0.380392],"Bi"->RGBColor[0.619608, 0.309804, 0.709804],"Po"->RGBColor[0.670588, 0.360784, 0],"At"->RGBColor[0.458824, 0.309804, 0.270588],"Rn"->RGBColor[0.218799, 0.516091, 0.591608],"Fr"->RGBColor[0.25626, 0.0861372, 0.398932],"Ra"->RGBColor[0., 0.473472, 0.04654],"Ac"->RGBColor[0.322042, 0.71693, 0.988479],"Th"->RGBColor[0.3608, 0.67166, 0.943003],"Pa"->RGBColor[0.397469, 0.628, 0.898853],"U"->RGBColor[0.43205, 0.58595, 0.856029],"Np"->RGBColor[0.464542, 0.54551, 0.814532],"Pu"->RGBColor[0.494945, 0.506679, 0.774361],"Am"->RGBColor[0.52326, 0.469458, 0.735517],"Cm"->RGBColor[0.549486, 0.433847, 0.697999],"Bk"->RGBColor[0.573624, 0.399845, 0.661808],"Cf"->RGBColor[0.595673, 0.367454, 0.626942],"Es"->RGBColor[0.615633, 0.336672, 0.593404],"Fm"->RGBColor[0.633505, 0.307499, 0.561191],"Md"->RGBColor[0.649288, 0.279937, 0.530305],"No"->RGBColor[0.662982, 0.253984, 0.500746],"Lr"->RGBColor[0.674588, 0.22964, 0.472513],"Rf"->RGBColor[0.684106, 0.206907, 0.445606],"Db"->RGBColor[0.691534, 0.185783, 0.420025],"Sg"->RGBColor[0.696874, 0.166269, 0.395772],"Bh"->RGBColor[0.700126, 0.148365, 0.372844],"Hs"->RGBColor[0.701289, 0.13207, 0.351243],"Mt"->RGBColor[0.700363, 0.117385, 0.330968],"Ds"->RGBColor[0.697348, 0.10431, 0.31202],"Rg"->RGBColor[0.692245, 0.0928444, 0.294398],"Uub"->RGBColor[0.685054, 0.0829886, 0.278102],"Uut"->RGBColor[0.675773, 0.0747426, 0.263133],"Uuq"->RGBColor[0.664405, 0.0681063, 0.249491],"Uup"->RGBColor[0.650947, 0.0630797, 0.237174],"Uuh"->RGBColor[0.635401, 0.0596628, 0.226184],"Uus"->RGBColor[0.635401, 0.0596628, 0.226184],"Uuo"->RGBColor[0.635401, 0.0596628, 0.226184]};
sizerules[] = DeleteCases[Table[ElementData[z,"Abbreviation"]->
	QuantityMagnitude@(ElementData[z,"AtomicRadius"]/2),{z,118}],x_/;Head[x[[2]]]==QuantityMagnitude];
Clear[makeatomcomplex];
makeatomcomplex[atoms_, coords_] := GraphicsComplex[coords, {
   MapThread[{#1 /. colorrules[], 
      Sphere[#2, #1 /. sizerules[]]} &, {atoms, 
     Range[Length[atoms]]}]}]

Clear[makebondcomplex]
makebondcomplex[atoms_, bonds_, bondtypes_, coords_, i_] := 
 Module[{b1, hb},
  hb   = Mean@coords[[#]] & /@ ({#[[1]], #[[2]]} & /@ bonds);
  b1 = coords[[bonds[[All, i]]]];
  {EdgeForm[None],
   GraphicsComplex[Join[b1, hb], {
     Riffle[atoms[[bonds[[All, i]]]] /. colorrules[],
      Table[GeometricTransformation[
          {Black, Cylinder[{#, Length@b1 + #}, 9]},
          TranslationTransform[ k Normalize[hb[[#]]\[Cross]b1[[#]]]]
          ], {k, 
          bondtypes[[#]] /. {"Single" -> {0}, "Double" -> {-15, 15}, 
            "Aromatic" -> {-15, 15}, "Triple" -> {-15, 0, 15}}}] & /@ 
       Range[Length@b1]
      ]
     }]}]

Clear[addhighlight];
addhighlight[coords_, hilight_] :=
 GraphicsComplex[
  coords, {Opacity[0.4], Green, Sphere[#, 35] & /@ hilight}]

Clear[addlabels];
addlabels[coords_, labels_, offset_] :=
 GraphicsComplex[coords,
  {Black, MapThread[
    Text[#1, offset + #2,
      BaseStyle -> {FontSize -> 36, FontFamily -> "Helvetica", 
        Black}] &, {labels, coords}]}]

Clear[makemolecule];
makemolecule::badcoord = 
  "2D coordinates suspected, use PadRight[#,3]&/@coords";
Options[makemolecule] =
  {hilight -> {}, labels -> {}, labeloffset -> {1, 1, 1}};
makemolecule[{a_,b_,c_,d_}]:=makemolecule[{a,b,c,d}];
makemolecule[moleculeinput_, OptionsPattern[]] := 
	{
atoms=ChemicalData[moleculeinput,"VertexTypes"];
coords=QuantityMagnitude[ChemicalData[moleculeinput,"AtomPositions"]];
bondtypes=ChemicalData[moleculeinput,"EdgeTypes"];
bonds=ChemicalData[moleculeinput,"EdgeRules"];
  		makeatomcomplex[atoms, coords],
  		makebondcomplex[atoms, bonds, bondtypes, coords, #] & /@ {1, 2},
  		If[Length@OptionValue[hilight] > 0,
  			addhighlight[coords, OptionValue[hilight]]],
  		If[Length@OptionValue[labels] == Length@atoms,
  				addlabels[coords, OptionValue[labels], OptionValue[labeloffset]]]
  	}

Clear[molview];
molview[molecule_] := Graphics3D[{
   Specularity[GrayLevel[1], 100], molecule
   },
  Boxed -> False,
  Lighting -> "Neutral",
  SphericalRegion -> True, Background -> White]
  
End[]

EndPackage[]





molview@makemolecule[Sequence @@ "Caffeine", labels -> Range@18, 
  hilight -> {1, 3, 5}, labeloffset -> {25, -50, 0}]
