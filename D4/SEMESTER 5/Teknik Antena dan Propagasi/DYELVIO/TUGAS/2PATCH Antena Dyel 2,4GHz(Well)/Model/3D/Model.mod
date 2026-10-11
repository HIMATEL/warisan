'# MWS Version: Version 2019.0 - Sep 20 2018 - ACIS 28.0.2 -

'# length = mm
'# frequency = GHz
'# time = ns
'# frequency range: fmin = 2.2 fmax = 2.5
'# created = '[VERSION]2019.0|28.0.2|20180920[/VERSION]


'@ use template: Antenna - Planar_Dyelvio.cfg

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
'set the units
With Units
    .Geometry "mm"
    .Frequency "GHz"
    .Voltage "V"
    .Resistance "Ohm"
    .Inductance "H"
    .TemperatureUnit  "Kelvin"
    .Time "ns"
    .Current "A"
    .Conductance "Siemens"
    .Capacitance "F"
End With
'----------------------------------------------------------------------------
'set the frequency range
Solver.FrequencyRange "2", "3"
'----------------------------------------------------------------------------
Plot.DrawBox True
With Background
     .Type "Normal"
     .Epsilon "1.0"
     .Mu "1.0"
     .XminSpace "0.0"
     .XmaxSpace "0.0"
     .YminSpace "0.0"
     .YmaxSpace "0.0"
     .ZminSpace "0.0"
     .ZmaxSpace "0.0"
End With
With Boundary
     .Xmin "expanded open"
     .Xmax "expanded open"
     .Ymin "expanded open"
     .Ymax "expanded open"
     .Zmin "expanded open"
     .Zmax "expanded open"
     .Xsymmetry "none"
     .Ysymmetry "none"
     .Zsymmetry "none"
End With
' optimize mesh settings for planar structures
With Mesh
     .MergeThinPECLayerFixpoints "True"
     .RatioLimit "20"
     .AutomeshRefineAtPecLines "True", "6"
     .FPBAAvoidNonRegUnite "True"
     .ConsiderSpaceForLowerMeshLimit "False"
     .MinimumStepNumber "5"
     .AnisotropicCurvatureRefinement "True"
     .AnisotropicCurvatureRefinementFSM "True"
End With
With MeshSettings
     .SetMeshType "Hex"
     .Set "RatioLimitGeometry", "20"
     .Set "EdgeRefinementOn", "1"
     .Set "EdgeRefinementRatio", "6"
End With
With MeshSettings
     .SetMeshType "HexTLM"
     .Set "RatioLimitGeometry", "20"
End With
With MeshSettings
     .SetMeshType "Tet"
     .Set "VolMeshGradation", "1.5"
     .Set "SrfMeshGradation", "1.5"
End With
' change mesh adaption scheme to energy
' 		(planar structures tend to store high energy
'     	 locally at edges rather than globally in volume)
MeshAdaption3D.SetAdaptionStrategy "Energy"
' switch on FD-TET setting for accurate farfields
FDSolver.ExtrudeOpenBC "True"
PostProcess1D.ActivateOperation "vswr", "true"
PostProcess1D.ActivateOperation "yz-matrices", "true"
With FarfieldPlot
	.ClearCuts ' lateral=phi, polar=theta
	.AddCut "lateral", "0", "1"
	.AddCut "lateral", "90", "1"
	.AddCut "polar", "90", "1"
End With
'----------------------------------------------------------------------------
Dim sDefineAt As String
sDefineAt = "2;2.5;3"
Dim sDefineAtName As String
sDefineAtName = "2;2.5;3"
Dim sDefineAtToken As String
sDefineAtToken = "f="
Dim aFreq() As String
aFreq = Split(sDefineAt, ";")
Dim aNames() As String
aNames = Split(sDefineAtName, ";")
Dim nIndex As Integer
For nIndex = LBound(aFreq) To UBound(aFreq)
Dim zz_val As String
zz_val = aFreq (nIndex)
Dim zz_name As String
zz_name = sDefineAtToken & aNames (nIndex)
' Define E-Field Monitors
With Monitor
    .Reset
    .Name "e-field ("& zz_name &")"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .MonitorValue  zz_val
    .Create
End With
' Define H-Field Monitors
With Monitor
    .Reset
    .Name "h-field ("& zz_name &")"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .MonitorValue  zz_val
    .Create
End With
' Define Farfield Monitors
With Monitor
    .Reset
    .Name "farfield ("& zz_name &")"
    .Domain "Frequency"
    .FieldType "Farfield"
    .MonitorValue  zz_val
    .ExportFarfieldSource "False"
    .Create
End With
Next
'----------------------------------------------------------------------------
With MeshSettings
     .SetMeshType "Hex"
     .Set "Version", 1%
End With
With Mesh
     .MeshType "PBA"
End With
'set the solver type
ChangeSolverType("HF Time Domain")
'----------------------------------------------------------------------------

'@ define material: Copper (annealed)

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Material
     .Reset
     .Name "Copper (annealed)"
     .Folder ""
.FrqType "static"
.Type "Normal"
.SetMaterialUnit "Hz", "mm"
.Epsilon "1"
.Mu "1.0"
.Kappa "5.8e+007"
.TanD "0.0"
.TanDFreq "0.0"
.TanDGiven "False"
.TanDModel "ConstTanD"
.KappaM "0"
.TanDM "0.0"
.TanDMFreq "0.0"
.TanDMGiven "False"
.TanDMModel "ConstTanD"
.DispModelEps "None"
.DispModelMu "None"
.DispersiveFittingSchemeEps "Nth Order"
.DispersiveFittingSchemeMu "Nth Order"
.UseGeneralDispersionEps "False"
.UseGeneralDispersionMu "False"
.FrqType "all"
.Type "Lossy metal"
.SetMaterialUnit "GHz", "mm"
.Mu "1.0"
.Kappa "5.8e+007"
.Rho "8930.0"
.ThermalType "Normal"
.ThermalConductivity "401.0"
.HeatCapacity "0.39"
.MetabolicRate "0"
.BloodFlow "0"
.VoxelConvection "0"
.MechanicsType "Isotropic"
.YoungsModulus "120"
.PoissonsRatio "0.33"
.ThermalExpansionRate "17"
.Colour "1", "1", "0"
.Wireframe "False"
.Reflection "False"
.Allowoutline "True"
.Transparentoutline "False"
.Transparency "0"
.Create
End With

'@ new component: component1

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Component.New "component1"

'@ define brick: component1:Ground

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Brick
     .Reset 
     .Name "Ground" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .Xrange "-Wg/2", "Wg/2+60" 
     .Yrange "0-Y", "Lg" 
     .Zrange "0", "t" 
     .Create
End With

'@ define material: Rogers RT5880 (lossy)

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Material
     .Reset
     .Name "Rogers RT5880 (lossy)"
     .Folder ""
.FrqType "all"
.Type "Normal"
.SetMaterialUnit "GHz", "mm"
.Epsilon "2.2"
.Mu "1.0"
.Kappa "0.0"
.TanD "0.0009"
.TanDFreq "10.0"
.TanDGiven "True"
.TanDModel "ConstTanD"
.KappaM "0.0"
.TanDM "0.0"
.TanDMFreq "0.0"
.TanDMGiven "False"
.TanDMModel "ConstKappa"
.DispModelEps "None"
.DispModelMu "None"
.DispersiveFittingSchemeEps "General 1st"
.DispersiveFittingSchemeMu "General 1st"
.UseGeneralDispersionEps "False"
.UseGeneralDispersionMu "False"
.Rho "0.0"
.ThermalType "Normal"
.ThermalConductivity "0.20"
.SetActiveMaterial "all"
.Colour "0.94", "0.82", "0.76"
.Wireframe "False"
.Transparency "0"
.Create
End With

'@ define brick: component1:Substract

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Brick
     .Reset 
     .Name "Substract" 
     .Component "component1" 
     .Material "Rogers RT5880 (lossy)" 
     .Xrange "-Wg/2", "Wg/2+60" 
     .Yrange "0-Y", "Lg" 
     .Zrange "t", "t+h" 
     .Create
End With

'@ define brick: component1:Patch

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Brick
     .Reset 
     .Name "Patch" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .Xrange "-W/2", "W/2" 
     .Yrange "Lf", "Lf+L" 
     .Zrange "t+h", "t+h+t" 
     .Create
End With

'@ define brick: component1:Feed

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Brick
     .Reset 
     .Name "Feed" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .Xrange "-Wf/2", "Wf/2" 
     .Yrange "0", "L/2" 
     .Zrange "t+h", "t+h+t" 
     .Create
End With

'@ define brick: component1:Inset

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Brick
     .Reset 
     .Name "Inset" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .Xrange "-Wf/Gpf", "Wf/Gpf" 
     .Yrange "0", "L/2" 
     .Zrange "t+h", "t+h+t" 
     .Create
End With

'@ boolean subtract shapes: component1:Patch, component1:Inset

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solid.Subtract "component1:Patch", "component1:Inset"

'@ boolean add shapes: component1:Patch, component1:Feed

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solid.Add "component1:Patch", "component1:Feed"

'@ pick face

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Pick.PickFaceFromId "component1:Patch", "3"

'@ define port: 1

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Port 
     .Reset 
     .PortNumber "1" 
     .Label "" 
     .Folder "" 
     .NumberOfModes "1" 
     .AdjustPolarization "False" 
     .PolarizationAngle "0.0" 
     .ReferencePlaneDistance "0" 
     .TextSize "50" 
     .TextMaxLimit "0" 
     .Coordinates "Picks" 
     .Orientation "positive" 
     .PortOnBound "False" 
     .ClipPickedPortToBound "False" 
     .Xrange "-2.5", "2.5" 
     .Yrange "0", "0" 
     .Zrange "1.635", "1.67" 
     .XrangeAdd "2", "2" 
     .YrangeAdd "0.0", "0.0" 
     .ZrangeAdd "2", "2" 
     .SingleEnded "False" 
     .WaveguideMonitor "False" 
     .Create 
End With

'@ define monitor: e-field (f=2.4)

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Monitor 
     .Reset 
     .Name "e-field (f=2.4)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Efield" 
     .MonitorValue "2.4" 
     .UseSubvolume "False" 
     .Coordinates "Structure" 
     .SetSubvolume "-29.5", "29.5", "0", "51.37", "-0.365", "3.67" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .SetSubvolumeInflateWithOffset "False" 
     .Create 
End With

'@ define monitor: h-field (f=2.4)

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Monitor 
     .Reset 
     .Name "h-field (f=2.4)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Hfield" 
     .MonitorValue "2.4" 
     .UseSubvolume "False" 
     .Coordinates "Structure" 
     .SetSubvolume "-29.5", "29.5", "0", "51.37", "-0.365", "3.67" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .SetSubvolumeInflateWithOffset "False" 
     .Create 
End With

'@ define farfield monitor: farfield (f=2.4)

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Monitor 
     .Reset 
     .Name "farfield (f=2.4)" 
     .Domain "Frequency" 
     .FieldType "Farfield" 
     .MonitorValue "2.4" 
     .ExportFarfieldSource "False" 
     .UseSubvolume "False" 
     .Coordinates "Structure" 
     .SetSubvolume "-29.5", "29.5", "0", "51.37", "-0.365", "3.67" 
     .SetSubvolumeOffset "10", "10", "10", "10", "10", "10" 
     .SetSubvolumeInflateWithOffset "False" 
     .SetSubvolumeOffsetType "FractionOfWavelength" 
     .Create 
End With

'@ define time domain solver parameters

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Mesh.SetCreator "High Frequency" 
With Solver 
     .Method "Hexahedral"
     .CalculationType "TD-S"
     .StimulationPort "All"
     .StimulationMode "All"
     .SteadyStateLimit "-40"
     .MeshAdaption "False"
     .AutoNormImpedance "False"
     .NormingImpedance "50"
     .CalculateModesOnly "False"
     .SParaSymmetry "False"
     .StoreTDResultsInCache  "False"
     .FullDeembedding "False"
     .SuperimposePLWExcitation "False"
     .UseSensitivityAnalysis "False"
End With

'@ set PBA version

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Discretizer.PBAVersion "2018092019"

'@ farfield plot options

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With FarfieldPlot 
     .Plottype "3D" 
     .Vary "angle1" 
     .Theta "90" 
     .Phi "90" 
     .Step "5" 
     .Step2 "5" 
     .SetLockSteps "True" 
     .SetPlotRangeOnly "False" 
     .SetThetaStart "0" 
     .SetThetaEnd "180" 
     .SetPhiStart "0" 
     .SetPhiEnd "360" 
     .SetTheta360 "False" 
     .SymmetricRange "False" 
     .SetTimeDomainFF "False" 
     .SetFrequency "-1" 
     .SetTime "0" 
     .SetColorByValue "True" 
     .DrawStepLines "False" 
     .DrawIsoLongitudeLatitudeLines "False" 
     .ShowStructure "False" 
     .ShowStructureProfile "False" 
     .SetStructureTransparent "False" 
     .SetFarfieldTransparent "False" 
     .SetSpecials "enablepolarextralines" 
     .SetPlotMode "Directivity" 
     .Distance "1" 
     .UseFarfieldApproximation "True" 
     .SetScaleLinear "False" 
     .SetLogRange "40" 
     .SetLogNorm "0" 
     .DBUnit "0" 
     .SetMaxReferenceMode "abs" 
     .EnableFixPlotMaximum "False" 
     .SetFixPlotMaximumValue "1" 
     .SetInverseAxialRatio "False" 
     .SetAxesType "user" 
     .SetAntennaType "isotropic_linear" 
     .Phistart "1.000000e+00", "0.000000e+00", "0.000000e+00" 
     .Thetastart "0.000000e+00", "0.000000e+00", "1.000000e+00" 
     .PolarizationVector "0.000000e+00", "1.000000e+00", "0.000000e+00" 
     .SetCoordinateSystemType "ludwig2ae" 
     .SetAutomaticCoordinateSystem "True" 
     .SetPolarizationType "Slant" 
     .SlantAngle 0.000000e+00 
     .Origin "bbox" 
     .Userorigin "0.000000e+00", "0.000000e+00", "0.000000e+00" 
     .SetUserDecouplingPlane "False" 
     .UseDecouplingPlane "False" 
     .DecouplingPlaneAxis "X" 
     .DecouplingPlanePosition "0.000000e+00" 
     .LossyGround "False" 
     .GroundEpsilon "1" 
     .GroundKappa "0" 
     .EnablePhaseCenterCalculation "False" 
     .SetPhaseCenterAngularLimit "3.000000e+01" 
     .SetPhaseCenterComponent "boresight" 
     .SetPhaseCenterPlane "both" 
     .ShowPhaseCenter "True" 
     .ClearCuts 
     .AddCut "lateral", "0", "1"  
     .AddCut "lateral", "90", "1"  
     .AddCut "polar", "90", "1"  
     .StoreSettings
End With

'@ define frequency range

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solver.FrequencyRange "2.2", "2.5"

'@ farfield plot options

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With FarfieldPlot 
     .Plottype "3D" 
     .Vary "angle1" 
     .Theta "0" 
     .Phi "0" 
     .Step "5" 
     .Step2 "5" 
     .SetLockSteps "True" 
     .SetPlotRangeOnly "False" 
     .SetThetaStart "0" 
     .SetThetaEnd "180" 
     .SetPhiStart "0" 
     .SetPhiEnd "360" 
     .SetTheta360 "False" 
     .SymmetricRange "False" 
     .SetTimeDomainFF "False" 
     .SetFrequency "-1" 
     .SetTime "0" 
     .SetColorByValue "True" 
     .DrawStepLines "False" 
     .DrawIsoLongitudeLatitudeLines "False" 
     .ShowStructure "True" 
     .ShowStructureProfile "True" 
     .SetStructureTransparent "False" 
     .SetFarfieldTransparent "True" 
     .SetSpecials "enablepolarextralines" 
     .SetPlotMode "Gain" 
     .Distance "1" 
     .UseFarfieldApproximation "True" 
     .SetScaleLinear "False" 
     .SetLogRange "40" 
     .SetLogNorm "0" 
     .DBUnit "0" 
     .SetMaxReferenceMode "abs" 
     .EnableFixPlotMaximum "False" 
     .SetFixPlotMaximumValue "1" 
     .SetInverseAxialRatio "False" 
     .SetAxesType "user" 
     .SetAntennaType "isotropic" 
     .Phistart "1.000000e+00", "0.000000e+00", "0.000000e+00" 
     .Thetastart "0.000000e+00", "0.000000e+00", "1.000000e+00" 
     .PolarizationVector "0.000000e+00", "1.000000e+00", "0.000000e+00" 
     .SetCoordinateSystemType "spherical" 
     .SetAutomaticCoordinateSystem "True" 
     .SetPolarizationType "Abs" 
     .SlantAngle 0.000000e+00 
     .Origin "bbox" 
     .Userorigin "0.000000e+00", "0.000000e+00", "0.000000e+00" 
     .SetUserDecouplingPlane "False" 
     .UseDecouplingPlane "False" 
     .DecouplingPlaneAxis "X" 
     .DecouplingPlanePosition "0.000000e+00" 
     .LossyGround "False" 
     .GroundEpsilon "1" 
     .GroundKappa "0" 
     .EnablePhaseCenterCalculation "False" 
     .SetPhaseCenterAngularLimit "3.000000e+01" 
     .SetPhaseCenterComponent "boresight" 
     .SetPhaseCenterPlane "both" 
     .ShowPhaseCenter "True" 
     .ClearCuts 
     .AddCut "lateral", "0", "1"  
     .AddCut "lateral", "90", "1"  
     .AddCut "polar", "90", "1"  
     .StoreSettings
End With

'@ pick edge

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Pick.PickEdgeFromId "component1:Patch", "26", "18"

'@ define distance dimension

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Dimension
    .Reset
    .CreationType "picks"
    .SetType "Distance"
    .SetID "0"
    .SetOrientation "Smart Mode"
    .SetDistance "3.424574"
    .SetViewVector "0.000000", "-0.000046", "-1.000000"
    .SetConnectedElement1 "component1:Patch"
    .SetConnectedElement2 "component1:Patch"
    .Create
End With
Pick.ClearAllPicks

'@ delete dimension 0

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Dimension
    .RemoveDimension "0"
End With

'@ pick edge

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Pick.PickEdgeFromId "component1:Patch", "26", "18"

'@ define distance dimension

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Dimension
    .Reset
    .CreationType "picks"
    .SetType "Distance"
    .SetID "1"
    .SetOrientation "Smart Mode"
    .SetDistance "3.259759"
    .SetViewVector "0.000000", "-0.000004", "-1.000000"
    .SetConnectedElement1 "component1:Patch"
    .SetConnectedElement2 "component1:Patch"
    .Create
End With
Pick.ClearAllPicks

'@ pick edge

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Pick.PickEdgeFromId "component1:Patch", "25", "17"

'@ define distance dimension

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Dimension
    .Reset
    .CreationType "picks"
    .SetType "Distance"
    .SetID "2"
    .SetOrientation "Smart Mode"
    .SetDistance "2.274018"
    .SetViewVector "-0.000000", "-0.000043", "-1.000000"
    .SetConnectedElement1 "component1:Patch"
    .SetConnectedElement2 "component1:Patch"
    .Create
End With
Pick.ClearAllPicks

'@ pick edge

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Pick.PickEdgeFromId "component1:Patch", "45", "26"

'@ define distance dimension

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Dimension
    .Reset
    .CreationType "picks"
    .SetType "Distance"
    .SetID "3"
    .SetOrientation "Smart Mode"
    .SetDistance "2.127387"
    .SetViewVector "-0.000000", "-0.000043", "-1.000000"
    .SetConnectedElement1 "component1:Patch"
    .SetConnectedElement2 "component1:Patch"
    .Create
End With
Pick.ClearAllPicks

'@ pick edge

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Pick.PickEdgeFromId "component1:Patch", "3", "33"

'@ define distance dimension

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Dimension
    .Reset
    .CreationType "picks"
    .SetType "Distance"
    .SetID "4"
    .SetOrientation "Smart Mode"
    .SetDistance "5.872285"
    .SetViewVector "-0.000000", "-0.000043", "-1.000000"
    .SetConnectedElement1 "component1:Patch"
    .SetConnectedElement2 "component1:Patch"
    .Create
End With
Pick.ClearAllPicks

'@ pick edge

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Pick.PickEdgeFromId "component1:Patch", "42", "29"

'@ define distance dimension

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Dimension
    .Reset
    .CreationType "picks"
    .SetType "Distance"
    .SetID "5"
    .SetOrientation "Smart Mode"
    .SetDistance "-11.021625"
    .SetViewVector "-0.000000", "-0.000043", "-1.000000"
    .SetConnectedElement1 "component1:Patch"
    .SetConnectedElement2 "component1:Patch"
    .Create
End With
Pick.ClearAllPicks

'@ pick edge

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Pick.PickEdgeFromId "component1:Substract", "3", "3"

'@ define distance dimension

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Dimension
    .Reset
    .CreationType "picks"
    .SetType "Distance"
    .SetID "6"
    .SetOrientation "Smart Mode"
    .SetDistance "6.120032"
    .SetViewVector "-0.000000", "-0.000043", "-1.000000"
    .SetConnectedElement1 "component1:Substract"
    .SetConnectedElement2 "component1:Substract"
    .Create
End With
Pick.ClearAllPicks

'@ pick edge

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Pick.PickEdgeFromId "component1:Substract", "2", "2"

'@ define distance dimension

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Dimension
    .Reset
    .CreationType "picks"
    .SetType "Distance"
    .SetID "7"
    .SetOrientation "Smart Mode"
    .SetDistance "5.493931"
    .SetViewVector "-0.000000", "-0.000043", "-1.000000"
    .SetConnectedElement1 "component1:Substract"
    .SetConnectedElement2 "component1:Substract"
    .Create
End With
Pick.ClearAllPicks

'@ delete dimension 4

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Dimension
    .RemoveDimension "4"
End With

'@ pick edge

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Pick.PickEdgeFromId "component1:Patch", "1", "1"

'@ define distance dimension

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Dimension
    .Reset
    .CreationType "picks"
    .SetType "Distance"
    .SetID "8"
    .SetOrientation "Smart Mode"
    .SetDistance "5.608099"
    .SetViewVector "0.000000", "-0.000019", "-1.000000"
    .SetConnectedElement1 "component1:Patch"
    .SetConnectedElement2 "component1:Patch"
    .Create
End With
Pick.ClearAllPicks

'@ pick edge

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Pick.PickEdgeFromId "component1:Patch", "4", "4"

'@ define distance dimension

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Dimension
    .Reset
    .CreationType "picks"
    .SetType "Distance"
    .SetID "9"
    .SetOrientation "Smart Mode"
    .SetDistance "2.830884"
    .SetViewVector "0.000000", "-0.000029", "-1.000000"
    .SetConnectedElement1 "component1:Patch"
    .SetConnectedElement2 "component1:Patch"
    .Create
End With
Pick.ClearAllPicks

'@ delete dimension 8

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Dimension
    .RemoveDimension "8"
End With

'@ pick edge

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Pick.PickEdgeFromId "component1:Patch", "1", "1"

'@ define distance dimension

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Dimension
    .Reset
    .CreationType "picks"
    .SetType "Distance"
    .SetID "10"
    .SetOrientation "Smart Mode"
    .SetDistance "3.019709"
    .SetViewVector "0.000000", "-0.000012", "-1.000000"
    .SetConnectedElement1 "component1:Patch"
    .SetConnectedElement2 "component1:Patch"
    .Create
End With
Pick.ClearAllPicks

'@ pick edge

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Pick.PickEdgeFromId "component1:Patch", "43", "32"

'@ transform: translate component1:Patch

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Transform 
     .Reset 
     .Name "component1:Patch" 
     .Vector "60", "0", "0" 
     .UsePickedPoints "False" 
     .InvertPickedPoints "False" 
     .MultipleObjects "True" 
     .GroupObjects "False" 
     .Repetitions "1" 
     .MultipleSelection "False" 
     .Destination "" 
     .Material "" 
     .Transform "Shape", "Translate" 
End With

'@ delete dimension 7

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Dimension
    .RemoveDimension "7"
End With

'@ delete dimension 1

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Dimension
    .RemoveDimension "1"
End With

'@ delete dimension 2

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Dimension
    .RemoveDimension "2"
End With

'@ delete dimension 3

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Dimension
    .RemoveDimension "3"
End With

'@ delete dimension 10

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Dimension
    .RemoveDimension "10"
End With

'@ delete dimension 9

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Dimension
    .RemoveDimension "9"
End With

'@ delete dimension 5

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Dimension
    .RemoveDimension "5"
End With

'@ delete dimension 6

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Dimension
    .RemoveDimension "6"
End With

'@ clear picks

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Pick.ClearAllPicks

'@ pick end point

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Pick.PickEndpointFromId "component1:Patch", "1"

'@ pick end point

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Pick.PickEndpointFromId "component1:Patch_1", "4"

'@ define brick: component1:solid1

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Brick
     .Reset 
     .Name "solid1" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .Xrange "3.75", "72.25" 
     .Yrange "0", "0+7.5" 
     .Zrange "1.67", "1.67" 
     .Create
End With

'@ clear picks

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Pick.ClearAllPicks

'@ delete shape: component1:solid1

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solid.Delete "component1:solid1"

'@ pick end point

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Pick.PickEndpointFromId "component1:Patch", "1"

'@ pick end point

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Pick.PickEndpointFromId "component1:Patch_1", "4"

'@ define brick: component1:feed_100

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Brick
     .Reset 
     .Name "feed_100" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .Xrange "0.9", "59.1" 
     .Yrange "0", "0+2" 
     .Zrange "t+h", "t+h+t" 
     .Create
End With

'@ clear picks

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Pick.ClearAllPicks

'@ pick mid point

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Pick.PickMidpointFromId "component1:feed_100", "4"

'@ define brick: component1:feed_50

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Brick
     .Reset 
     .Name "feed_50" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .Xrange "30-X", "30+X" 
     .Yrange "0-Y", "0" 
     .Zrange "t+h", "t+h+t" 
     .Create
End With

'@ clear picks

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Pick.ClearAllPicks

'@ pick end point

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Pick.PickEndpointFromId "component1:feed_50", "1"

'@ pick end point

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Pick.PickEndpointFromId "component1:Patch_1", "1"

'@ boolean add shapes: component1:Patch, component1:Patch_1

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solid.Add "component1:Patch", "component1:Patch_1"

'@ boolean add shapes: component1:feed_100, component1:feed_50

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solid.Add "component1:feed_100", "component1:feed_50"

'@ boolean add shapes: component1:Patch, component1:feed_100

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solid.Add "component1:Patch", "component1:feed_100"

'@ delete port: port1

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Port.Delete "1"

'@ pick face

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Pick.PickFaceFromId "component1:Patch", "3"

'@ define port: 1

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Port 
     .Reset 
     .PortNumber "1" 
     .Label "" 
     .Folder "" 
     .NumberOfModes "1" 
     .AdjustPolarization "False" 
     .PolarizationAngle "0.0" 
     .ReferencePlaneDistance "0" 
     .TextSize "50" 
     .TextMaxLimit "1" 
     .Coordinates "Picks" 
     .Orientation "positive" 
     .PortOnBound "False" 
     .ClipPickedPortToBound "False" 
     .Xrange "34", "42" 
     .Yrange "-10", "-10" 
     .Zrange "1.635", "1.67" 
     .XrangeAdd "0.0", "0.0" 
     .YrangeAdd "0.0", "0.0" 
     .ZrangeAdd "0.0", "0.0" 
     .SingleEnded "False" 
     .WaveguideMonitor "False" 
     .Create 
End With

'@ pick end point

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Pick.PickEndpointFromId "component1:Patch", "57"

'@ pick end point

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Pick.PickEndpointFromId "component1:Patch", "24"

'@ modify port: 1

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Port 
     .Reset 
     .LoadContentForModify "1" 
     .Label "" 
     .Folder "" 
     .NumberOfModes "1" 
     .AdjustPolarization "False" 
     .PolarizationAngle "0.0" 
     .ReferencePlaneDistance "0" 
     .TextSize "50" 
     .TextMaxLimit "1" 
     .Coordinates "Picks" 
     .Orientation "positive" 
     .PortOnBound "False" 
     .ClipPickedPortToBound "False" 
     .Xrange "34", "42" 
     .Yrange "-12", "-12" 
     .Zrange "1.635", "1.67" 
     .XrangeAdd "2", "2" 
     .YrangeAdd "0.0", "0.0" 
     .ZrangeAdd "2", "2" 
     .SingleEnded "False" 
     .Shield "none" 
     .WaveguideMonitor "False" 
     .Modify 
End With

'@ clear picks

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Pick.ClearAllPicks

'@ pick edge

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Pick.PickEdgeFromId "component1:Patch", "121", "88"

'@ define distance dimension

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Dimension
    .Reset
    .CreationType "picks"
    .SetType "Distance"
    .SetID "11"
    .SetOrientation "Smart Mode"
    .SetDistance "-0.316468"
    .SetViewVector "-0.006981", "0.006980", "-0.999951"
    .SetConnectedElement1 "component1:Patch"
    .SetConnectedElement2 "component1:Patch"
    .Create
End With
Pick.ClearAllPicks

'@ delete dimension 11

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Dimension
    .RemoveDimension "11"
End With

'@ pick end point

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Pick.PickEndpointFromId "component1:Patch", "57"

'@ pick end point

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Pick.PickEndpointFromId "component1:Patch", "24"

'@ farfield plot options

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With FarfieldPlot 
     .Plottype "Polar" 
     .Vary "angle1" 
     .Theta "0" 
     .Phi "0" 
     .Step "1" 
     .Step2 "1" 
     .SetLockSteps "True" 
     .SetPlotRangeOnly "False" 
     .SetThetaStart "0" 
     .SetThetaEnd "180" 
     .SetPhiStart "0" 
     .SetPhiEnd "360" 
     .SetTheta360 "False" 
     .SymmetricRange "False" 
     .SetTimeDomainFF "False" 
     .SetFrequency "-1" 
     .SetTime "0" 
     .SetColorByValue "True" 
     .DrawStepLines "False" 
     .DrawIsoLongitudeLatitudeLines "False" 
     .ShowStructure "True" 
     .ShowStructureProfile "True" 
     .SetStructureTransparent "False" 
     .SetFarfieldTransparent "True" 
     .SetSpecials "enablepolarextralines" 
     .SetPlotMode "Gain" 
     .Distance "1" 
     .UseFarfieldApproximation "True" 
     .SetScaleLinear "False" 
     .SetLogRange "40" 
     .SetLogNorm "0" 
     .DBUnit "0" 
     .SetMaxReferenceMode "abs" 
     .EnableFixPlotMaximum "False" 
     .SetFixPlotMaximumValue "1" 
     .SetInverseAxialRatio "False" 
     .SetAxesType "user" 
     .SetAntennaType "unknown" 
     .Phistart "1.000000e+00", "0.000000e+00", "0.000000e+00" 
     .Thetastart "0.000000e+00", "0.000000e+00", "1.000000e+00" 
     .PolarizationVector "0.000000e+00", "1.000000e+00", "0.000000e+00" 
     .SetCoordinateSystemType "spherical" 
     .SetAutomaticCoordinateSystem "True" 
     .SetPolarizationType "Linear" 
     .SlantAngle 0.000000e+00 
     .Origin "bbox" 
     .Userorigin "0.000000e+00", "0.000000e+00", "0.000000e+00" 
     .SetUserDecouplingPlane "False" 
     .UseDecouplingPlane "False" 
     .DecouplingPlaneAxis "X" 
     .DecouplingPlanePosition "0.000000e+00" 
     .LossyGround "False" 
     .GroundEpsilon "1" 
     .GroundKappa "0" 
     .EnablePhaseCenterCalculation "False" 
     .SetPhaseCenterAngularLimit "3.000000e+01" 
     .SetPhaseCenterComponent "boresight" 
     .SetPhaseCenterPlane "both" 
     .ShowPhaseCenter "True" 
     .ClearCuts 
     .AddCut "lateral", "0", "1"  
     .AddCut "lateral", "90", "1"  
     .AddCut "polar", "90", "1"  
     .StoreSettings
End With 

'@ pick edge

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Pick.PickEdgeFromId "component1:Substract", "2", "2" 


'@ define distance dimension

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Dimension
    .Reset
    .CreationType "picks"
    .SetType "Distance"
    .SetID "0"
    .SetOrientation "Smart Mode"
    .SetDistance "4.435949"
    .SetViewVector "0.000000", "-0.000038", "-1.000000"
    .SetConnectedElement1 "component1:Substract"
    .SetConnectedElement2 "component1:Substract"
    .Create
End With

Pick.ClearAllPicks


'@ pick edge

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Pick.PickEdgeFromId "component1:Substract", "3", "3" 


'@ define distance dimension

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Dimension
    .Reset
    .CreationType "picks"
    .SetType "Distance"
    .SetID "1"
    .SetOrientation "Smart Mode"
    .SetDistance "20.497467"
    .SetViewVector "0.000000", "-0.000038", "-1.000000"
    .SetConnectedElement1 "component1:Substract"
    .SetConnectedElement2 "component1:Substract"
    .Create
End With

Pick.ClearAllPicks


'@ delete dimension 0

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Dimension
    .RemoveDimension "0"
End With


'@ pick edge

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Pick.PickEdgeFromId "component1:Substract", "2", "2" 


'@ define distance dimension

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Dimension
    .Reset
    .CreationType "picks"
    .SetType "Distance"
    .SetID "2"
    .SetOrientation "Smart Mode"
    .SetDistance "21.864202"
    .SetViewVector "0.000000", "-0.000040", "-1.000000"
    .SetConnectedElement1 "component1:Substract"
    .SetConnectedElement2 "component1:Substract"
    .Create
End With

Pick.ClearAllPicks


'@ pick edge

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Pick.PickEdgeFromId "component1:Patch", "104", "74" 


'@ define distance dimension

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Dimension
    .Reset
    .CreationType "picks"
    .SetType "Distance"
    .SetID "3"
    .SetOrientation "Smart Mode"
    .SetDistance "7.725708"
    .SetViewVector "-0.003491", "0.003451", "-0.999988"
    .SetConnectedElement1 "component1:Patch"
    .SetConnectedElement2 "component1:Patch"
    .Create
End With

Pick.ClearAllPicks


'@ pick edge

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Pick.PickEdgeFromId "component1:Patch", "105", "75" 


'@ define distance dimension

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Dimension
    .Reset
    .CreationType "picks"
    .SetType "Distance"
    .SetID "4"
    .SetOrientation "Smart Mode"
    .SetDistance "13.410295"
    .SetViewVector "-0.003491", "0.003451", "-0.999988"
    .SetConnectedElement1 "component1:Patch"
    .SetConnectedElement2 "component1:Patch"
    .Create
End With

Pick.ClearAllPicks


'@ pick edge

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Pick.PickEdgeFromId "component1:Patch", "116", "83" 


'@ define distance dimension

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Dimension
    .Reset
    .CreationType "picks"
    .SetType "Distance"
    .SetID "5"
    .SetOrientation "Smart Mode"
    .SetDistance "6.726703"
    .SetViewVector "-0.003491", "0.003451", "-0.999988"
    .SetConnectedElement1 "component1:Patch"
    .SetConnectedElement2 "component1:Patch"
    .Create
End With

Pick.ClearAllPicks


'@ pick edge

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Pick.PickEdgeFromId "component1:Patch", "81", "89" 


'@ define distance dimension

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Dimension
    .Reset
    .CreationType "picks"
    .SetType "Distance"
    .SetID "6"
    .SetOrientation "Smart Mode"
    .SetDistance "-9.681551"
    .SetViewVector "-0.003491", "0.003451", "-0.999988"
    .SetConnectedElement1 "component1:Patch"
    .SetConnectedElement2 "component1:Patch"
    .Create
End With

Pick.ClearAllPicks


'@ pick edge

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Pick.PickEdgeFromId "component1:Patch", "106", "76" 


'@ define distance dimension

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Dimension
    .Reset
    .CreationType "picks"
    .SetType "Distance"
    .SetID "7"
    .SetOrientation "Smart Mode"
    .SetDistance "30.597614"
    .SetViewVector "-0.003491", "0.003451", "-0.999988"
    .SetConnectedElement1 "component1:Patch"
    .SetConnectedElement2 "component1:Patch"
    .Create
End With

Pick.ClearAllPicks


'@ pick edge

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Pick.PickEdgeFromId "component1:Patch", "127", "92" 


'@ define distance dimension

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Dimension
    .Reset
    .CreationType "picks"
    .SetType "Distance"
    .SetID "8"
    .SetOrientation "Smart Mode"
    .SetDistance "-0.760139"
    .SetViewVector "-0.003491", "0.003489", "-0.999988"
    .SetConnectedElement1 "component1:Patch"
    .SetConnectedElement2 "component1:Patch"
    .Create
End With

Pick.ClearAllPicks


'@ delete dimension 8

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Dimension
    .RemoveDimension "8"
End With


'@ pick edge

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Pick.PickEdgeFromId "component1:Patch", "127", "92" 


'@ define distance dimension

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Dimension
    .Reset
    .CreationType "picks"
    .SetType "Distance"
    .SetID "9"
    .SetOrientation "Smart Mode"
    .SetDistance "-20.364771"
    .SetViewVector "-0.003491", "0.003474", "-0.999988"
    .SetConnectedElement1 "component1:Patch"
    .SetConnectedElement2 "component1:Patch"
    .Create
End With

Pick.ClearAllPicks


'@ delete dimension 9

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Dimension
    .RemoveDimension "9"
End With


'@ pick edge

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Pick.PickEdgeFromId "component1:Patch", "77", "56" 


'@ define distance dimension

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Dimension
    .Reset
    .CreationType "picks"
    .SetType "Distance"
    .SetID "10"
    .SetOrientation "Smart Mode"
    .SetDistance "-0.751244"
    .SetViewVector "-0.000000", "-0.000001", "-1.000000"
    .SetConnectedElement1 "component1:Patch"
    .SetConnectedElement2 "component1:Patch"
    .Create
End With

Pick.ClearAllPicks


'@ pick edge

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Pick.PickEdgeFromId "component1:Patch", "28", "20" 


'@ define distance dimension

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Dimension
    .Reset
    .CreationType "picks"
    .SetType "Distance"
    .SetID "11"
    .SetOrientation "Smart Mode"
    .SetDistance "5.903738"
    .SetViewVector "-0.000000", "-0.000038", "-1.000000"
    .SetConnectedElement1 "component1:Patch"
    .SetConnectedElement2 "component1:Patch"
    .Create
End With

Pick.ClearAllPicks


'@ pick edge

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Pick.PickEdgeFromId "component1:Patch", "14", "93" 


'@ define distance dimension

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Dimension
    .Reset
    .CreationType "picks"
    .SetType "Distance"
    .SetID "12"
    .SetOrientation "Smart Mode"
    .SetDistance "11.512430"
    .SetViewVector "-0.000000", "-0.000038", "-1.000000"
    .SetConnectedElement1 "component1:Patch"
    .SetConnectedElement2 "component1:Patch"
    .Create
End With

Pick.ClearAllPicks


'@ pick edge

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Pick.PickEdgeFromId "component1:Patch", "4", "4" 


'@ define distance dimension

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Dimension
    .Reset
    .CreationType "picks"
    .SetType "Distance"
    .SetID "13"
    .SetOrientation "Smart Mode"
    .SetDistance "5.378402"
    .SetViewVector "-0.000000", "-0.000038", "-1.000000"
    .SetConnectedElement1 "component1:Patch"
    .SetConnectedElement2 "component1:Patch"
    .Create
End With

Pick.ClearAllPicks


'@ pick edge

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Pick.PickEdgeFromId "component1:Patch", "3", "17" 


'@ define distance dimension

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Dimension
    .Reset
    .CreationType "picks"
    .SetType "Distance"
    .SetID "14"
    .SetOrientation "Smart Mode"
    .SetDistance "-73.107666"
    .SetViewVector "-0.000000", "-0.000038", "-1.000000"
    .SetConnectedElement1 "component1:Patch"
    .SetConnectedElement2 "component1:Patch"
    .Create
End With

Pick.ClearAllPicks


'@ pick edge

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Pick.PickEdgeFromId "component1:Patch", "66", "47" 


'@ define distance dimension

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Dimension
    .Reset
    .CreationType "picks"
    .SetType "Distance"
    .SetID "15"
    .SetOrientation "Smart Mode"
    .SetDistance "4.440978"
    .SetViewVector "0.000000", "-0.000016", "-1.000000"
    .SetConnectedElement1 "component1:Patch"
    .SetConnectedElement2 "component1:Patch"
    .Create
End With

Pick.ClearAllPicks


'@ delete dimension 15

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Dimension
    .RemoveDimension "15"
End With


'@ pick edge

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Pick.PickEdgeFromId "component1:Patch", "66", "47" 


'@ define distance dimension

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Dimension
    .Reset
    .CreationType "picks"
    .SetType "Distance"
    .SetID "16"
    .SetOrientation "Smart Mode"
    .SetDistance "32.463573"
    .SetViewVector "-0.000000", "0.003453", "-0.999994"
    .SetConnectedElement1 "component1:Patch"
    .SetConnectedElement2 "component1:Patch"
    .Create
End With

Pick.ClearAllPicks


